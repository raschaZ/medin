<?php

namespace App\Http\Controllers\Api\Panel;

use App\Http\Controllers\Controller;
use App\Models\Webinar;
use App\Models\Waitlist;
use Illuminate\Http\Request;
use Validator;

class WaitlistController extends Controller
{
    // Store a new waitlist entry for a webinar
    public function store(Request $request, $webinarId)
    {
        // Get the authenticated user
        $user = apiAuth();

        // If no user is authenticated, return a 401 Unauthorized response
        if (empty($user)) {
            return apiResponse2(0,'unauthorized',trans('auth.unauthorized')) ;
        }

        // Validation rules for the 'webinarId' from the URL
        $rules = [
            'webinarId' => 'required|exists:webinars,id' // Ensure the 'webinarId' exists in the 'webinars' table
        ];

        // Validate the request data
        $validator = Validator::make(['webinarId' => $webinarId], $rules);

        // If validation fails, return a 422 response with error details
        if ($validator->fails()) {
            return apiResponse2(0, 'invalid', trans('api.public.invalid'));
        }

        // Retrieve the webinar using the 'webinarId' passed in the URL
        $webinar = Webinar::find($webinarId);

        if (!empty($webinar)) {
            
            if(!$user->isProfileComplete()){
                return apiResponse2(0, 'invalid', trans('api.public.complete_your_profile_first'));
            }
            // Create a waitlist entry for the authenticated user
            Waitlist::query()->updateOrCreate([
                'webinar_id' => $webinar->id,
                'user_id' => $user->id, // Use the authenticated user's ID
            ], [
                'full_name' => $user->full_name, // Use the authenticated user's full name
                'created_at' => time() // Use the current timestamp
            ]);
           
            // Set notification options with placeholders for the webinar title and user's name
            $notifyOptions = [
                '[c.title]' => $webinar->title,
                '[u.name]' => $user->full_name,
            ];

            // Send notification to the admin about the waitlist submission
            sendNotification("waitlist_submission_for_admin", $notifyOptions, 1);

            // Send notification to the authenticated user
            sendNotification("waitlist_submission", $notifyOptions, $user->id);

            // Return success response indicating waitlist entry was successful
            return apiResponse2(1, 'updated', trans('api.public.updated'));
        }

        // Return a 404 response if the webinar was not found
        return apiResponse2(0, 'invalid', trans('api.public.invalid'));
    }

    public function checkWaitlist(Request $request, $webinarId)
    {
        // Get the authenticated user
        $user = apiAuth();
    
        // If no user is authenticated, return a 401 Unauthorized response
        if (empty($user)) {
            return apiResponse2(0,'unauthorized',trans('auth.unauthorized')) ;
        }
    
        // Check if the user is already in the waitlist for the given webinar
        $waitlistEntry = Waitlist::where('webinar_id', $webinarId)
                                ->where('user_id', $user->id)
                                ->first();
    
        if ($waitlistEntry) {
            // Return response indicating the user is on the waitlist
            return apiResponse2(1, 'retrived', trans('api.public.retrived'));
        }
    
        // Return response indicating the user is not on the waitlist
        return apiResponse2(0, 'retrived', trans('api.public.retrived'));
    }
    
}
