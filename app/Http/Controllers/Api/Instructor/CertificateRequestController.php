<?php

namespace App\Http\Controllers\Api\Instructor;

use App\Http\Controllers\Controller;
use App\Models\CertificateRequest;
use App\Models\TeacherWebinarList;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CertificateRequestController extends Controller
{
    public function store(Request $request)
    {
        // Obtenir l'utilisateur authentifié
        $user = apiAuth();

        if (empty($user)) {
            return apiResponse2(0, 'unauthorized', trans('auth.unauthorized'));
        }

        // Valider la requête
        $rules = [
            'teacher_webinar_list_id' => 'required|exists:teacher_webinar_lists,id',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return apiResponse2(0, 'invalid', trans('api.public.invalid'));
        }

        // Récupérer la liste et vérifier si l'utilisateur est bien l'instructeur du webinar
        $list = TeacherWebinarList::find($request->teacher_webinar_list_id);

        if ($list->webinar->teacher->id !== $user->id) {
            return apiResponse2(0, 'unauthorized', trans('api.public.unauthorized'));
        }

        // Vérifier si la demande existe déjà
        $attendeeExists = CertificateRequest::where([
            'instructor_id' => $user->id,
            'webinar_id' => $list->webinar->id,
            'list_id' => $list->id,
        ])->first();

        if ($attendeeExists && $attendeeExists->status != CertificateRequest::$waiting) {
            return apiResponse2(0, 'exists', trans('public.request_exist'));
        }
        elseif($attendeeExists && $attendeeExists->status == CertificateRequest::$waiting){
                // Envoyer une notification
            sendNotification('certificate_request_send', [
                '[u.name]' => $user->full_name,
                '[c.title]' => $list->webinar->slug,
            ], 1);

            return apiResponse2(1, 'created', trans('webinars.request_sent'));
        }
        // Créer la demande de certificat
        CertificateRequest::create([
            'instructor_id' => $user->id,
            'webinar_id' => $list->webinar->id,
            'list_id' => $list->id,
            'status' => CertificateRequest::$waiting,
            'created_at' => time(),
        ]);

        // Envoyer une notification
        sendNotification('certificate_request_send', [
            '[u.name]' => $user->full_name,
            '[c.title]' => $list->webinar->slug,
        ], 1);

        return apiResponse2(1, 'created', trans('webinars.request_sent'));
    }

    public function checkRequest(Request $request, $webinarId)
    {
        // Obtenir l'utilisateur authentifié
        $user = apiAuth();

        if (empty($user)) {
            return apiResponse2(0, 'unauthorized', trans('auth.unauthorized'));
        }

        // Vérifier si la demande existe
        $certificateRequest = CertificateRequest::where([
            'instructor_id' => $user->id,
            'webinar_id' => $webinarId,
        ])->first();

        if ($certificateRequest) {
            return apiResponse2(1, 'retrieved', trans('api.public.retrieved'));
        }

        return apiResponse2(0, 'not_found', trans('api.public.not_found'));
    }
}