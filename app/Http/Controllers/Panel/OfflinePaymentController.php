<?php

namespace App\Http\Controllers\Panel;

use App\Exports\OfflinePaymentsExport;
use App\Http\Controllers\Controller;
use App\Mixins\Cashback\CashbackAccounting;
use App\Models\Accounting;
use App\Models\Bundle;
use App\Models\OfflineBank;
use App\Models\OfflinePayment;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductOrder;
use App\Models\Reward;
use App\Models\RewardAccounting;
use App\Models\Role;
use App\Models\Sale;
use App\Models\Waitlist;
use App\Models\Webinar;
use App\User;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class OfflinePaymentController extends Controller
{
    protected $order_session_key = 'payment.order_id';

    public function index(Request $request)
    {
        // $this->authorize('admin_offline_payments_list');
        /** @var \App\User $user */
        $user = auth()->user();
    
        if (!$user->isTeacher() and !$user->isOrganization()) {
            abort(404);
        }
    
        $pageType = $request->get('page_type', 'requests'); // 'requests' or 'history'
    
        // Get only offline payments for webinars owned by this teacher
        $query = OfflinePayment::whereHas('webinar', function ($q) use ($user) {
            $q->where('teacher_id', $user->id);
        });
    
        if ($pageType == 'requests') {
            $query->where('status', OfflinePayment::$waiting);
        } else {
            $query->where('status', '!=', OfflinePayment::$waiting);
        }
    
        $query = $this->filters($query, $request);
    
        $offlinePayments = $query->paginate(10);
        $offlinePayments->appends(['page_type' => $pageType]);
    
        $roles = Role::all();
    
        $offlineBanks = OfflineBank::query()
            ->orderBy('created_at', 'desc')
            ->with(['specifications'])
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
    
        return view(getTemplate() . '.panel.financial.offline_payments.lists', $data);
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
        // $this->authorize('admin_offline_payments_list');
        /** @var \App\User $user */
        $user = auth()->user();
    
        if (!$user->isTeacher() and !$user->isOrganization()) {
            abort(404);
        }

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
        // dd("approved");
        // $this->authorize('admin_offline_payments_list');
        /** @var \App\User $user */
        $user = auth()->user();
    
        if (!$user->isTeacher() and !$user->isOrganization()) {
            abort(404);
        }

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
        // $this->authorize('admin_offline_payments_list');
        /** @var \App\User $user */
        $user = auth()->user();
    
        if (!$user->isTeacher() and !$user->isOrganization()) {
            abort(404);
        }

        $pageType = $request->get('page_type', 'requests'); //requests or history

        // Get only offline payments for webinars owned by this teacher
        $query = OfflinePayment::whereHas('webinar', function ($q) use ($user) {
            $q->where('teacher_id', $user->id);
        });
        if ($pageType == 'requests') {
            $query->where('status', OfflinePayment::$waiting);
        } else {
            $query->where('status', '!=', OfflinePayment::$waiting);
        }

        $query = $this->filters($query, $request);

        $offlinePayments = $query->with(['offlineBank'])->get();
        $export = new OfflinePaymentsExport($offlinePayments);

        return Excel::download($export, 'offline_payment_' . $pageType . '.xlsx');
    }
    
    
    public function offlinePayment(Request $request, $id)
    {
        $this->authorize('admin_offline_payments_approved');
    
        $offlinePayment = OfflinePayment::findOrFail($id);
    
        // Ensure the payment is still pending
        if ($offlinePayment->status !== OfflinePayment::$waiting) {
            return response()->json([
                'code' => 400,
                'message' => trans('update.payment_already_processed'),
            ], 400);
        }
    
        // Create accounting entry
        Accounting::create([
            'creator_id' => auth()->user()->id,
            'user_id' => $offlinePayment->user_id,
            'amount' => $offlinePayment->amount,
            'type' => Accounting::$addiction,
            'type_account' => Accounting::$asset,
            'description' => trans('admin/pages/setting.notification_offline_payment_approved'),
            'created_at' => time(),
        ]);
    

        // Mark the payment as approved
        $offlinePayment->update(['status' => OfflinePayment::$approved]);

        Waitlist::where('webinar_id', $offlinePayment->webinar_id)
        ->where('user_id', $offlinePayment->user_id) 
        ->delete();

        // Send notification about payment approval
        sendNotification('offline_payment_approved', [
            '[amount]' => handlePrice($offlinePayment->amount),
        ], $offlinePayment->user_id);
    
        $user = User::find($offlinePayment->user_id);
    
        if ($user) {
            $sellerId = null;
            $itemType = null;
            $itemId = null;
            $itemColumnName = null;
            $productOrder = null;
    
            if (!empty($offlinePayment->webinar_id)) {
                $course = Webinar::find($offlinePayment->webinar_id);
    
                if ($course && !$course->isOwner($user->id) && !$course->checkUserHasBought($user)) {
                    $sellerId = $course->creator_id;
                    $itemId = $course->id;
                    $itemType = Sale::$webinar;
                    $itemColumnName = 'webinar_id';
                } else {
                    return $this->errorResponse($request, $course, 'course');
                }
            } elseif (!empty($offlinePayment->bundle_id)) {
                $bundle = Bundle::find($offlinePayment->bundle_id);
    
                if ($bundle && !$bundle->isOwner($user->id) && !$bundle->checkUserHasBought($user)) {
                    $sellerId = $bundle->creator_id;
                    $itemId = $bundle->id;
                    $itemType = Sale::$bundle;
                    $itemColumnName = 'bundle_id';
                } else {
                    return $this->errorResponse($request, $bundle, 'bundle');
                }
            } elseif (!empty($offlinePayment->product_id)) {
                $product = Product::find($offlinePayment->product_id);
    
                if ($product && !$product->isOwner($user->id) && !$product->checkUserHasBought($user)) {
                    $sellerId = $product->creator_id;
                    $itemId = $product->id;
                    $itemType = Sale::$product;
                    $itemColumnName = 'product_order_id';
    
                    $productOrder = ProductOrder::create([
                        'product_id' => $product->id,
                        'seller_id' => $sellerId,
                        'buyer_id' => $user->id,
                        'specifications' => null,
                        'quantity' => 1,
                        'status' => 'pending',
                        'created_at' => time(),
                    ]);
    
                    $itemId = $productOrder->id;
                } else {
                    return $this->errorResponse($request, $product, 'product');
                }
            }
    
            if ($sellerId && $itemType && $itemId && $itemColumnName) {
                $sale = Sale::create([
                    'buyer_id' => $user->id,
                    'seller_id' => $sellerId,
                    $itemColumnName => $itemId,
                    'type' => $itemType,
                    'manual_added' => true,
                    'payment_method' => Sale::$credit,
                    'amount' => $offlinePayment->amount,
                    'total_amount' => $offlinePayment->amount,
                    'created_at' => time(),
                ]);
    
                if ($productOrder) {
                    $productOrder->update([
                        'sale_id' => $sale->id,
                        'status' => $product->isVirtual() ? ProductOrder::$success : ProductOrder::$waitingDelivery,
                    ]);
                }
    
                return $this->successResponse($request, $course ?? $bundle ?? $product);
            }
        }
    
        return response()->json([
            'code' => 422,
            'message' => trans('update.something_went_wrong'),
        ], 422);
    }
    
}
