<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Admin\traits\CertificateSettingsTrait;
use App\Http\Controllers\Controller;
use App\Mixins\Certificate\MakeCertificate;
use App\Models\Api\User;
use App\Models\CertificateRequest;
use App\Models\TeachersCertificates;
use App\Models\TeacherWebinarList;
use App\Models\Webinar;
use Illuminate\Http\Request;

class CertificateRequestController extends Controller
{
    use CertificateSettingsTrait;

    public function index(Request $request)
    {
        $this->authorize('admin_certificate_list');

        // Fetch certificate requests with optional filters
        $query = CertificateRequest::query();
        $query = $this->filters($query, $request);

        $certificateRequests = $query->with(['instructor', 'webinar', 'teachersList'])
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        // Prepare data for the view
        $data = [
            'pageTitle' => trans('admin/main.certificate_requests_list_page_title'),
            'certificate_requests' => $certificateRequests,
            'instructor' => $request->get('instructor') ?? null,
            'webinar' => $request->get('webinar') ?? null,
            'teachersList' => $request->get('teachersList') ?? null,
        ];

        // Add teachers if IDs are provided
        if ($teacherIds = $request->get('teacher_ids')) {
            $data['teachers'] = User::select('id', 'full_name')
                ->whereIn('id', $teacherIds)
                ->get();
        }
        if ($webinarsIds = $request->get('webinars_ids')) {
            $data['webinars'] = Webinar::select('id', 'slug')
                ->whereIn('id', $webinarsIds)
                ->get();
        }
        return view('admin.certificates.requests', data: $data);
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
        $this->authorize('admin_certificate_list');
        
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
        $this->authorize('admin_certificate_list');
        
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
