<?php

namespace App\Http\Controllers\Api\Panel;

use App\Http\Controllers\Api\Controller;
use App\Models\Api\Attendee;
use App\Models\Api\Webinar;
use App\Models\CertificateRequest;
use Illuminate\Http\Request;

class AttendeeController extends Controller
{
    public function store(Request $request, $webinarId)
    {
        // Validate the request
        $data = $request->validate([
            'webinar_code' => 'required|string',
        ]);

        /** @var \App\Models\Api\User $user */
        $user = apiAuth();

        // var_dump($user);
        // Retrieve the webinar by ID
        $webinar = Webinar::find($webinarId);

        if (empty($webinar)) {
            return apiResponse2(0, 'invalid', trans('api.public.error'));
        }
        if ($webinar->teacher->id != $user->id && !$user->hasPurchasedWebinar($webinar->id)) {
            return apiResponse2(0, 'invalid', trans('webinars.no_access'));
        }

        // Validate the provided webinar code
        $hashedId = hash('sha256', $webinar->id);
        if ($data['webinar_code'] !== $hashedId) {
            return apiResponse2(0, 'invalid', trans('webinars.code_error'));
        }

        // Check for existing attendee
        $attendeeExists = Attendee::where([
            'user_id' => $user->id,
            'webinar_id' => $webinar->id,
        ])->exists();

        if ($attendeeExists) {
            return apiResponse2(0, 'invalid', trans('webinars.attendee_exist'));
        }

        if($webinar->teacher->id == $user->id ){      
            return apiResponse2(0, 'go_step_2', trans('api.auth.go_step_2'),['webinar_id' =>$webinar->id]);
        }
        else{ 
            // Create new attendee
            Attendee::create([
                'user_id' => $user->id,
                'webinar_id' => $webinar->id,
            ]);
        }

        return apiResponse2(1, 'passed', trans('webinars.attendee_stored'));
    }
}
