<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Admin\traits\CertificateSettingsTrait;
use App\Http\Controllers\Controller;
use App\Models\Api\User;
use App\Models\CertificateRequest;
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

        $certificateRequests = $query->with(['instructor', 'webinar'])
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        // Prepare data for the view
        $data = [
            'pageTitle' => trans('admin/main.certificate_requests_list_page_title'),
            'certificate_requests' => $certificateRequests,
            'instructor' => $request->get('instructor') ?? null,
            'webinar' => $request->get('webinar') ?? null,
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

        return view('admin.certificates.requests', $data);
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
        
        $certificateRequest->update(['status' => CertificateRequest::$done]);
        
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
        
        
        $notifyOptions = [
            '[c.title]' => $certificateRequest->webinar->slug,
        ];
        
        sendNotification('certificate_request_rejected', $notifyOptions, $certificateRequest->user_id);
        
        return back();

    }
}
