<?php


namespace App\Http\Controllers\Panel;

use App\Http\Controllers\Controller;
use App\Mixins\Certificate\MakeCertificate;
use App\Models\CertificateRequest;
use App\Models\TeachersCertificates;
use App\Models\TeacherWebinarList;
use App\Models\Webinar;
use App\User;
use Illuminate\Http\Request;

class CertificateRequestController extends Controller
{
    public function store(Request $request)
    {

        /** @var \App\User $user */
        $user = auth()->user();

        if (!$user->isTeacher()) {
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
            ])->first();
            
            if ($attendeeExists && $attendeeExists->status != CertificateRequest::$waiting) {
                $toastData = [
                    'title' => trans('public.request_failed'),
                    'msg' => trans('public.request_exist'),
                    'status' => 'error',
                ];
        
                return redirect('/course/'.$list->webinar->slug)->with(['toast' => $toastData]);
            }elseif($attendeeExists && $attendeeExists->status == CertificateRequest::$waiting){
                $notifyOptions = [
                    '[u.name]' => $user->full_name,
                    '[c.title]' => $list->webinar->slug,
                ];
                sendNotification('certificate_request_send', $notifyOptions, 1);    
                sendNotification('certificate_request_send', $notifyOptions, $user->organ_id);    
                $toastData = [
                    'title' => trans('public.request_success'),
                    'msg' => trans('webinars.request_sent'),
                    'status' => 'success',
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
                sendNotification('certificate_request_send', $notifyOptions, $user->organ_id);    
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
    
    public function index(Request $request)
    {
        /** @var \App\User $user */
        $user = auth()->user();

        if (!$user->isOrganization()) {
            abort(404);
        }
        
        // Fetch certificate requests with optional filters
        $query = CertificateRequest::query();
        $query = $this->filters($query, $request);

        $webinars = Webinar::whereHas('teacher', function ($query) use ($user) {
            $query->where('organ_id', $user->id);
        })->get();
        
        $instructors = User::where('organ_id', $user->id)->get();
        
        $certificateRequests = $query->with(['instructor', 'webinar', 'teachersList'])
            ->whereIn('instructor_id', $instructors->pluck('id')->toArray())
            ->whereIn('webinar_id', $webinars->pluck('id')->toArray())
            ->orderBy('created_at', 'desc')
            ->paginate(10);
        
        // Prepare data for the view
        $data = [
            'pageTitle' => trans('admin/main.certificate_requests_list_page_title'),
            'certificate_requests' => $certificateRequests,
            'teachersList' => $request->get('teachersList') ?? null,
            'teachers' => $instructors, // No need for null coalescing since it's already an array
            'webinars' => $webinars,    // Same here
        ];
        return view('web.default.panel.certificates.requests', data: $data);
    }

    /**
     * Apply filters to the query based on the request parameters.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Database\Eloquent\Builder
     */
    private function filters($query, $request)
    {
        $filters = $request->all();

        if (!empty($filters['teacher_ids'])) {
            $query->whereIn('instructor_id', $filters['teacher_ids']);
        }

        if (!empty($filters['webinars_ids'])) {
            $query->whereIn('webinar_id', $filters['webinars_ids']);
        }

        return $query;
    }

    public function approve($id)
    {
        /** @var \App\User $user */
        $user = auth()->user();

        if (!$user->isOrganization()) {
            abort(404);
        }
        
        $certificateRequest = CertificateRequest::findOrFail($id);
        if($certificateRequest->teachersList->teachers){
            $teachers =$certificateRequest->teachersList->teachers;
            foreach($teachers as $teacher)
            {
                $makeCertificate = new MakeCertificate();
                $makeCertificate->makeCourseCertificateTeacher($teacher, $certificateRequest->webinar);
            }

        }
        $certificateRequest->update(['status' => CertificateRequest::$done]);

        $certificateRequest->teachersList->update(['status' => TeacherWebinarList::$done]);

        $notifyOptions = [
            '[title]' => $certificateRequest->webinar->slug,
        ];
        
        sendNotification('certificate_request_approved', $notifyOptions, $certificateRequest->user_id);
        
        return back();

    }

    public function reject($id)
    {
        /** @var \App\User $user */
        $user = auth()->user();

        if (!$user->isOrganization()) {
            abort(404);
        }
        
        $certificateRequest = CertificateRequest::findOrFail($id);
        
        $certificateRequest->update(['status' => CertificateRequest::$reject]);
        
        $certificateRequest->teachersList->update(['status' => TeacherWebinarList::$reject]);
        
        $notifyOptions = [
            '[c.title]' => $certificateRequest->webinar->slug,
        ];
        
        sendNotification('certificate_request_rejected', $notifyOptions, $certificateRequest->user_id);
        
        return back();

    }

    /**
     * Delete the TeacherWebinarList record and its associated teacher records.
     *
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        // Vérification de l'existence de la demande de certificat
        $certificateRequest = CertificateRequest::findOrFail($id);
    
        // Vérifier si la liste des enseignants existe
        $teacherWebinarList = $certificateRequest->teachersList;
    
        if ($teacherWebinarList) {
            try {
                \DB::beginTransaction(); // Démarrer une transaction
    
                // Supprimer tous les enseignants liés à cette liste
                TeachersCertificates::where('list_id', $teacherWebinarList->id)->delete();
    
                // Supprimer la liste des enseignants
                $teacherWebinarList->delete();
            } catch (\Exception $e) {
                \DB::rollBack(); // Annuler la transaction en cas d'erreur
                return redirect()->back()->with('error', 'Error deleting teachers: ' . $e->getMessage());
            }
        }
    
        try {
            // Supprimer la demande de certificat
            $certificateRequest->delete();
            \DB::commit(); // Valider la transaction
            return redirect()->back()->with('success', 'Teacher list and associated teachers deleted successfully.');
        } catch (\Exception $e) {
            \DB::rollBack(); // Annuler la transaction si la suppression échoue
            return redirect()->back()->with('error', 'Error deleting certificate request: ' . $e->getMessage());
        }
    }     
}
