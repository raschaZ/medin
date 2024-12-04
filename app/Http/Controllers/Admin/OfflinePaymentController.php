<?php

namespace App\Http\Controllers\Admin;

use App\Exports\OfflinePaymentsExport;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Web\PaymentController;
use App\Mixins\Cashback\CashbackAccounting;
use App\Models\Accounting;
use App\Models\Cart;
use App\Models\Discount;
use App\Models\OfflineBank;
use App\Models\OfflinePayment;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\PaymentChannel;
use App\Models\Product;
use App\Models\ReserveMeeting;
use App\Models\Reward;
use App\Models\RewardAccounting;
use App\Models\Role;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;

class OfflinePaymentController extends Controller
{
    protected $order_session_key = 'payment.order_id';

    public function index(Request $request)
    {
        $this->authorize('admin_offline_payments_list');

        $pageType = $request->get('page_type', 'requests'); //requests or history

        $query = OfflinePayment::query();
        if ($pageType == 'requests') {
            $query->where('status', OfflinePayment::$waiting);
        } else {
            $query->where('status', '!=', OfflinePayment::$waiting);
        }

        $query = $this->filters($query, $request);

        $offlinePayments = $query->paginate(10);

        $offlinePayments->appends([
            'page_type' => $pageType
        ]);

        $roles = Role::all();

        $offlineBanks = OfflineBank::query()
            ->orderBy('created_at', 'desc')
            ->with([
                'specifications'
            ])
            ->get();

        $data = [
            'pageTitle' => trans('admin/main.offline_payments_title') . (($pageType == 'requests') ? 'Requests' : 'History'),
            'offlinePayments' => $offlinePayments,
            'pageType' => $pageType,
            'roles' => $roles,
            'offlineBanks' => $offlineBanks,
        ];

        $user_ids = $request->get('user_ids', []);

        if (!empty($user_ids)) {
            $data['users'] = User::select('id', 'full_name')
                ->whereIn('id', $user_ids)->get();
        }

        return view('admin.financial.offline_payments.lists', $data);
    }

    private function filters($query, $request)
    {
        $from = $request->get('from', null);
        $to = $request->get('to', null);
        $search = $request->get('search', null);
        $user_ids = $request->get('user_ids', []);
        $role_id = $request->get('role_id', null);
        $account_type = $request->get('account_type', null);
        $sort = $request->get('sort', null);
        $status = $request->get('status', null);

        if (!empty($search)) {
            $ids = User::where('full_name', 'like', "%$search%")->pluck('id')->toArray();
            $user_ids = array_merge($user_ids, $ids);
        }

        if (!empty($role_id)) {
            $role = Role::where('id', $role_id)->first();

            if (!empty($role)) {
                $ids = $role->users()->pluck('id')->toArray();
                $user_ids = array_merge($user_ids, $ids);
            }
        }

        $query = fromAndToDateFilter($from, $to, $query, 'created_at');

        if (!empty($user_ids) and count($user_ids)) {
            $query->whereIn('user_id', $user_ids);
        }

        if (!empty($account_type)) {
            $query->where('offline_bank_id', $account_type);
        }

        if (!empty($status)) {
            $query->where('status', $status);
        }

        if (!empty($sort)) {
            switch ($sort) {
                case 'amount_asc':
                    $query->orderBy('amount', 'asc');
                    break;
                case 'amount_desc':
                    $query->orderBy('amount', 'desc');
                    break;
                case 'pay_date_asc':
                    $query->orderBy('pay_date', 'asc');
                    break;
                case 'pay_date_desc':
                    $query->orderBy('pay_date', 'desc');
                    break;
            }
        } else {
            $query->orderBy('created_at', 'desc');
        }

        return $query;
    }

    public function reject($id)
    {
        $this->authorize('admin_offline_payments_reject');

        $offlinePayment = OfflinePayment::findOrFail($id);
        $offlinePayment->update(['status' => OfflinePayment::$reject]);

        $notifyOptions = [
            '[amount]' => handlePrice($offlinePayment->amount),
        ];
        sendNotification('offline_payment_rejected', $notifyOptions, $offlinePayment->user_id);

        return back();
    }

    public function approved($id)
    {
        $this->authorize('admin_offline_payments_approved');

        $offlinePayment = OfflinePayment::findOrFail($id);

        Accounting::create([
            'creator_id' => auth()->user()->id,
            'user_id' => $offlinePayment->user_id,
            'amount' => $offlinePayment->amount,
            'type' => Accounting::$addiction,
            'type_account' => Accounting::$asset,
            'description' => trans('admin/pages/setting.notification_offline_payment_approved'),
            'created_at' => time(),
        ]);

        $offlinePayment->update(['status' => OfflinePayment::$approved]);

        $notifyOptions = [
            '[amount]' => handlePrice($offlinePayment->amount),
        ];
        sendNotification('offline_payment_approved', $notifyOptions, $offlinePayment->user_id);

        $accountChargeReward = RewardAccounting::calculateScore(Reward::ACCOUNT_CHARGE, $offlinePayment->amount);
        RewardAccounting::makeRewardAccounting($offlinePayment->user_id, $accountChargeReward, Reward::ACCOUNT_CHARGE);

        $chargeWalletReward = RewardAccounting::calculateScore(Reward::CHARGE_WALLET, $offlinePayment->amount);
        RewardAccounting::makeRewardAccounting($offlinePayment->user_id, $chargeWalletReward, Reward::CHARGE_WALLET);

        if (!empty($offlinePayment->user)) {
            $order = new Order();
            $order->total_amount = $offlinePayment->amount;
            $order->user_id = $offlinePayment->user_id;

            $cashbackAccounting = new CashbackAccounting($offlinePayment->user);
            $cashbackAccounting->rechargeWallet($order);
        }

        return back();
    }

    public function exportExcel(Request $request)
    {
        $pageType = $request->get('page_type', 'requests'); //requests or history

        $query = OfflinePayment::query();
        if ($pageType == 'requests') {
            $query->where('status', OfflinePayment::$waiting);
        } else {
            $query->where('status', '!=', OfflinePayment::$waiting);
        }

        $query = $this->filters($query, $request);

        $offlinePayments = $query->get();

        $export = new OfflinePaymentsExport($offlinePayments);

        return Excel::download($export, 'offline_payment_' . $pageType . '.xlsx');
    }
    
    public function manualPayment(Request $request,$carts=null)
    {
        $user = auth()->user();

        if (empty($carts)) {
            $carts = Cart::where('creator_id', $user->id)
                ->get();
        }

        $hasPhysicalProduct = $carts->where('productOrder.product.type', Product::$physical);
        $checkAddressValidation = (count($hasPhysicalProduct) > 0);

        if (empty(getStoreSettings('show_address_selection_in_cart')) or !empty(getStoreSettings('take_address_selection_optional'))) {
            $checkAddressValidation = false;
        }

        $this->validate($request, [
            'country_id' => Rule::requiredIf($checkAddressValidation),
            'province_id' => Rule::requiredIf($checkAddressValidation),
            'city_id' => Rule::requiredIf($checkAddressValidation),
            'district_id' => Rule::requiredIf($checkAddressValidation),
            'address' => Rule::requiredIf($checkAddressValidation),
        ]);

        $discountId = $request->input('discount_id');

        $paymentChannels = PaymentChannel::where('status', 'active')->get();

        $discountCoupon = Discount::where('id', $discountId)->first();

        if (empty($discountCoupon) or $discountCoupon->checkValidDiscount() != 'ok') {
            $discountCoupon = null;
        }

        if (!empty($carts) and !$carts->isEmpty()) {
            $calculate = $this->calculatePrice($carts, $user);

            $order = $this->createOrderAndOrderItems($carts, $calculate, $user, $discountCoupon);

            if (!empty($discountCoupon)) {
                $totalCouponDiscount = $this->handleDiscountPrice($discountCoupon, $carts, $calculate['sub_total']);
                $calculate['total_discount'] += $totalCouponDiscount;
                $calculate["total"] = $calculate["total"] - $totalCouponDiscount;
            }

            if (count($hasPhysicalProduct) > 0) {
                $this->updateProductOrders($request, $carts, $user);
            }

            if (!empty($order) and $order->total_amount > 0) {
                $razorpay = false;
                $isMultiCurrency = !empty(getFinancialCurrencySettings('multi_currency'));

                foreach ($paymentChannels as $paymentChannel) {
                    if ($paymentChannel->class_name == 'Razorpay' and (!$isMultiCurrency or in_array(currency(), $paymentChannel->currencies))) {
                        $razorpay = true;
                    }
                }

                $totalCashbackAmount = $this->getTotalCashbackAmount($carts, $user, $calculate["sub_total"]);

                $data = [
                    'pageTitle' => trans('public.checkout_page_title'),
                    'paymentChannels' => $paymentChannels,
                    'carts' => $carts,
                    'subTotal' => $calculate["sub_total"],
                    'totalDiscount' => $calculate["total_discount"],
                    'tax' => $calculate["tax"],
                    'taxPrice' => $calculate["tax_price"],
                    'total' => $calculate["total"],
                    'userGroup' => $user->userGroup ? $user->userGroup->group : null,
                    'order' => $order,
                    'count' => $carts->count(),
                    'userCharge' => $user->getAccountingCharge(),
                    'razorpay' => $razorpay,
                    'totalCashbackAmount' => $totalCashbackAmount,
                    'previousUrl' => url()->previous(),
                ];

                $paymentController = new PaymentController();

                $this->validate($request, [
                    'gateway' => 'required'
                ]);
        
                $user = auth()->user();
                $gateway = $request->input('gateway');
                $orderId = $request->input('order_id');
        
                $order = Order::where('id', $orderId)
                    ->where('user_id', $user->id)
                    ->first();
        
                if ($order->type === Order::$meeting) {
                    $orderItem = OrderItem::where('order_id', $order->id)->first();
                    $reserveMeeting = ReserveMeeting::where('id', $orderItem->reserve_meeting_id)->first();
                    $reserveMeeting->update(['locked_at' => time()]);
                }
        
                if ($gateway === 'credit') {
        
                    if ($user->getAccountingCharge() < $order->total_amount) {
                        $order->update(['status' => Order::$fail]);
        
                        session()->put($this->order_session_key, $order->id);
        
                        return redirect('/payments/status');
                    }
        
                    $order->update([
                        'payment_method' => Order::$credit
                    ]);
        
                    $paymentController->setPaymentAccounting($order, 'credit');
        
                    $order->update([
                        'status' => Order::$paid
                    ]);
        
                    session()->put($this->order_session_key, $order->id);
        
                    return redirect('/payments/status');
                }
        
                $paymentChannel = PaymentChannel::where('id', $gateway)
                    ->where('status', 'active')
                    ->first();
        
                if (!$paymentChannel) {
                    $toastData = [
                        'title' => trans('cart.fail_purchase'),
                        'msg' => trans('public.channel_payment_disabled'),
                        'status' => 'error'
                    ];
                    return back()->with(['toast' => $toastData]);
                }
        
                $order->payment_method = Order::$paymentChannel;
                $order->save();
         // Send confirmation or update any necessary records
         $toastData = [
            'title' => trans('admin.success'),
            'msg' => trans('admin.payment_recorded_successfully'),
            'status' => 'success'
        ];

        return back()->with(['toast' => $toastData]);
            } else {
                return $this->handlePaymentOrderWithZeroTotalAmount($order);
            }
        }

        return back()->with([
            'toast' => [
                'title' => trans('admin.error'),
                'msg' => trans('admin.payment_record_failed') ,
                'status' => 'error'
            ]
        ]);
    }

}
