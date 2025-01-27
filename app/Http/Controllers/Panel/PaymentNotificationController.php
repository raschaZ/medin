<?php

namespace App\Http\Controllers\Panel;

use App\Http\Controllers\Controller;
use App\Models\Waitlist;
use Illuminate\Support\Str;

class PaymentNotificationController extends Controller
{
    public function sendNotification($user_id, $waitlist_id)
    {
        $waitlist = Waitlist::find($waitlist_id);
        
        if (!$waitlist->is_accepted) {
            $waitlist->is_accepted = true;
            $waitlist->save();
        }
        
        // Generate a unique token for secure access
        $token = Str::random(32);
        $waitlist->verification_token = $token;
        $waitlist->save();
        
        // Create a secure link using the token
        $uploadLink = route('verification.upload', ['token' => $token]);
        
        $emailMessage = '
        <html>
            <body>
                <p>Dear ' . $waitlist->user->full_name . ',</p>
                
                <p>Congratulations on being accepted into the <strong> "' . $waitlist->webinar->getTitleAttribute() . '" </strong>!</p>
                
                <p>To complete the final steps of your enrollment, we kindly request you to proceed to payment via the following link:</p>
                
                <p><a href="' . $uploadLink . '" target="_blank"> Click here. </a></p>
                
                <p>Should you have any questions or need assistance, feel free to contact us. We look forward to having you as part of the course!</p>
                
                <p>Best regards,<br>Your Team</p>
            </body>
        </html>';
    
        sendNotification('submit_verification_doc_payment', [
            '[c.title]' => $waitlist->webinar->title
        ], $user_id, null, 'system', 'single', null, $emailMessage);
        $toastData = [
            'title' => trans('public.request_success'),
            'msg' => trans('public.notification_sent'),
            'status' => 'success'
        ];
        return redirect()->back()->with(['toast' => $toastData]);
    }

}
