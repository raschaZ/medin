<?php

namespace App\Http\Controllers\Admin;

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
    Dear ' . $waitlist->user->full_name . ',

    Congratulations on being accepted into the ' . $waitlist->webinar->getTitleAttribute() . '! 

    To complete the final steps of your enrollment, we kindly request you to proceed to  payment via the following link: 
    ' . $uploadLink . '

    Should you have any questions or need assistance, feel free to contact us. We look forward to having you as part of the course!';
    
    sendNotification('submit_verification_doc_payment', [
        '[c.title]' => $waitlist->webinar->title
    ], $user_id, null, 'system', 'single', null, $emailMessage);

    return redirect()->back();
}

}
