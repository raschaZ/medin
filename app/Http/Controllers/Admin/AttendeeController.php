<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Attendee;
use App\Models\Webinar;
use App\User;

class AttendeeController extends Controller
{
    public function presence($webinarId, $userId)
    {
        $user = User::find($userId);
        if (!$user) {
            return $this->redirectWithToast('public.request_failed', 'update.user_not_found', 'error');
        }

        $webinar = Webinar::find($webinarId);
        if (!$webinar) {
            return $this->redirectWithToast('public.request_failed', 'update.course_not_found', 'error');
        }

        if (!$user->hasPurchasedWebinar($webinar->id)) {
            return $this->redirectWithToast('public.request_failed', 'update.forbidden_request_toast_msg_lang', 'error');
        }

        if (Attendee::where('user_id', $user->id)->where('webinar_id', $webinar->id)->exists()) {
            return $this->redirectWithToast('public.request_failed', 'webinars.attendee_exist', 'error');
        }

        Attendee::create([
            'user_id' => $user->id,
            'webinar_id' => $webinar->id,
        ]);

        return $this->redirectWithToast('public.request_success', 'webinars.attendee_stored', 'success');
    }

    private function redirectWithToast($title, $message, $status)
    {
        $toastData = [
            'title' => trans($title),
            'msg' => trans($message),
            'status' => $status,
        ];

        return redirect()->back()->with(['toast' => $toastData]);
    }
}
