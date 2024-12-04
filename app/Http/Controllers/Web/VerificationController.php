<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Waitlist;
use Illuminate\Http\Request;

class VerificationController extends Controller
{
    public function upload($token)
    {
        $waitlist = Waitlist::where('verification_token', $token)->first();
        
        if (!$waitlist) {
            abort(404, 'Invalid or expired link.');
        }

        return redirect()->route('webinair.directpayment', ['itemId' => $waitlist->webinar->id,'ticketId'=> "webinar_id"]);
    }
    
}
