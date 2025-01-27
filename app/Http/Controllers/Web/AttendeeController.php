<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Api\Controller;
use App\Models\Attendee;
use App\Models\CertificateRequest;
use App\Models\Webinar;
use Illuminate\Http\Request;

class AttendeeController extends Controller
{
    public function store(Request $request, $id)
    {

        try { // Validate the request
            $data = $request->validate([
                'qr_code' => 'required|string',
            ]);

            /** @var \App\User $user */
            $user =  auth()->user();


            // var_dump($user);
            // Retrieve the webinar by ID
            $webinar = Webinar::find($id);

            if (empty($webinar)) {
                // return apiResponse2(0, 'invalid', trans('api.public.error'));
                return $this->redirectWithToast('public.request_success', 'api.public.error', 'success');
            }
            if ($webinar->teacher->id != $user->id && !$user->hasPurchasedWebinar($webinar->id)) {
                // return apiResponse2(0, 'invalid', trans('webinars.no_access'));
                return $this->redirectWithToast('public.request_success', 'webinars.no_access', 'success');
            }

            // Validate the provided webinar code
            $hashedId = hash('sha256', $webinar->id);


            if ($data['qr_code'] !== $hashedId) {
                // return apiResponse2(0, 'invalid', trans('webinars.code_error'));
                return $this->redirectWithToast('public.request_success', 'webinars.code_error', 'success');
            }

            // Check for existing attendee
            $attendeeExists = Attendee::where([
                'user_id' => $user->id,
                'webinar_id' => $webinar->id,
            ])->exists();
            if ($attendeeExists) {
                // return apiResponse2(0, 'invalid', trans('webinars.attendee_exist'));
                return $this->redirectWithToast('public.request_success', 'webinars.attendee_exist', 'success');
            }

            if($webinar->teacher->id == $user->id ){ 
                
                $notifyOptions = [
                    '[u.name]' => $user->full_name,
                    '[c.title]' => $webinar->slug,
                ];
                sendNotification('certificate_request_send', $notifyOptions, 1);

                $attendeeExists = CertificateRequest::where([
                    'instructor_id' => $user->id,
                    'webinar_id' => $webinar->id,
                    'status'=> CertificateRequest::$waiting,
                ])->exists();
                if ($attendeeExists) {
                    // return apiResponse2(0, 'invalid', trans('webinars.attendee_exist'));
                    return $this->redirectWithToast('public.request_success', 'webinars.attendee_exist', 'success');
                }else{
                    CertificateRequest::create([
                        'instructor_id' => $user->id,
                        'webinar_id' => $webinar->id,
                        'created_at'=> time(),
                    ]); 
                }

                
            }
            else{ // Create new attendee
                Attendee::create([
                    'user_id' => $user->id,
                    'webinar_id' => $webinar->id,
                ]);
            }
            // return apiResponse2(1, 'valid', trans('webinars.attendee_stored'));

            return $this->redirectWithToast('public.request_success', 'webinars.attendee_stored', 'success');
        } catch (\Exception $e) {
            \Log::error("Error storing attendee: {$e->getMessage()}");
            return $this->redirectWithToast('public.request_success', 'public.unexpected_error', 'error');
        }
    }
    private function redirectWithToast($title, $message, $status)
    {
        $toastData = [
            'title' => trans($title),
            'msg' => trans($message),
            'status' => $status,
        ];

        return back()->with(['toast' => $toastData]);
    }
}
