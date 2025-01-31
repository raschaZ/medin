<?php


namespace App\Http\Controllers\Panel;

use App\Http\Controllers\Controller;
use App\Models\CertificateRequest;
use App\Models\TeacherWebinarList;
use Illuminate\Http\Request;

class CertificateRequestController extends Controller
{
    public function store(Request $request)
    {

        /** @var \App\User $user */
        $user = auth()->user();

        if (!$user->isTeacher() and !$user->isOrganization()) {
            abort(404);
        }
        $data = $request->all();

        $rules = [
            'teacher_webinar_list_id' => 'required|exists:teacher_webinar_lists,id',
        ];

        $this->validate($request, $rules);

        $list = TeacherWebinarList::find($data['teacher_webinar_list_id']);

        if($list->webinar->teacher->id == $user->id ){ 

            $attendeeExists = CertificateRequest::where([
                'instructor_id' => $user->id,
                'webinar_id' => $list->webinar->id,
                'list_id' => $list->id,
            ])->exists();
            if ($attendeeExists) {
                $toastData = [
                    'title' => trans('public.request_failed'),
                    'msg' => trans('public.request_exist'),
                    'status' => 'error',
                ];
        
                return redirect('/course/'.$list->webinar->slug)->with(['toast' => $toastData]);
            }else{
                CertificateRequest::create([
                    'instructor_id' => $user->id,
                    'webinar_id' => $list->webinar->id,
                    'list_id' => $list->id,
                    'status'=> CertificateRequest::$waiting,
                    'created_at'=> time(),
                ]); 
               
                $notifyOptions = [
                    '[u.name]' => $user->full_name,
                    '[c.title]' => $list->webinar->slug,
                ];
                sendNotification('certificate_request_send', $notifyOptions, 1);    
                $toastData = [
                    'title' => trans('public.request_success'),
                    'msg' => trans('webinars.request_sent'),
                    'status' => 'success',
                ];
        
                return redirect('/course/'.$list->webinar->slug)->with(['toast' => $toastData]);
            }
            
        }
        $toastData = [
            'title' => trans('public.request_failed'),
            'msg' => trans('public.request_failed'),
            'status' => 'error',
        ];

        return redirect('/course/'.$list->webinar->slug)->with(['toast' => $toastData]);
    }

}
