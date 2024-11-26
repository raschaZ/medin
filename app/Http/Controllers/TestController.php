<?php

namespace App\Http\Controllers;

use App\Models\Webinar;
use Illuminate\Http\Request;

class TestController extends Controller
{
    public function index( $user_id,$webinar_id)
    {
        $webinar = Webinar::find($webinar_id);
        
       return  sendNotification('submit_verification_doc_payment', ['[c.title]' =>$webinar->title], $user_id);
    }
}

