<?php

namespace App\Http\Controllers\Api\Instructor;

use App\Http\Controllers\Controller;
use App\Models\Api\Webinar;
use App\Models\TeachersCertificates;
use App\Models\TeacherWebinarList;
use Illuminate\Http\Request;

class TeachersCertificatesController extends Controller
{
    public function index($webinarId)
    {
        $user = apiAuth();
        $webinar = Webinar::find($webinarId);

        if (!$webinar || (!$user->isTeacher() && $webinar->teacher->id != $user->id)) {
            return apiResponse2(0, 'unauthorized', trans('api.public.unauthorized'));
        }

        $teacherWebinarList = TeacherWebinarList::where('webinar_id', $webinarId)
            ->where('instructor_id', $user->id)
            ->first();

        $teachers = $teacherWebinarList ? $teacherWebinarList->teachers : [];
        return apiResponse2(1, 'retrieved', trans('api.public.retrieved'), compact('teachers', 'webinar','teacherWebinarList'));
    }

    public function store(Request $request)
    {
        $user = apiAuth();

        $request->validate([
            'webinar_id' => 'required|exists:webinars,id',
            'name' => 'required|string',
            'email' => 'required|email',
        ]);

        $teacherWebinarList = TeacherWebinarList::firstOrCreate([
            'webinar_id' => $request->webinar_id,
            'instructor_id' => $user->id
        ], [
            'created_at' => time(),
        ]);

        if ($teacherWebinarList->status != 'draft') {
            return apiResponse2(0, 'forbidden', trans("Teacher list already submitted and can't be changed."));
        }

        $teacher = TeachersCertificates::create([
            'webinar_id' => $request->webinar_id,
            'name' => $request->name,
            'list_id' => $teacherWebinarList->id,
            'email' => $request->email,
            'created_at' => time(),
        ]);

        return apiResponse2(1, 'created', trans('api.public.created'), $teacher);
    }

    public function show($webinarId)
    {
        $user = apiAuth();
        $teacherWebinarList = TeacherWebinarList::where('webinar_id', $webinarId)
            ->where('instructor_id', $user->id)
            ->first();

        if (!$teacherWebinarList) {
            return apiResponse2(0, 'not_found', trans('api.public.not_found'));
        }

        return apiResponse2(1, 'retrieved', trans('api.public.retrieved'), [
            'teachers' => $teacherWebinarList->teachers,
            'teacherWebinarList' => $teacherWebinarList,
        ]);
    }

    public function removeTeacher($webinarId, $teacherId)
    {
        $user = apiAuth();

        $teacherWebinarList = TeacherWebinarList::where('webinar_id', $webinarId)
            ->where('instructor_id', $user->id)
            ->first();

        if (!$teacherWebinarList || $teacherWebinarList->status != 'draft') {
            return apiResponse2(0, 'forbidden', trans("Teacher list already submitted and can't be changed."));
        }

        $deleted = TeachersCertificates::where('list_id', $teacherWebinarList->id)
            ->where('id', $teacherId)
            ->delete();

        if ($deleted) {
            return apiResponse2(1, 'deleted', trans('api.public.deleted'));
        }

        return apiResponse2(0, 'not_found', trans('api.public.not_found'));
    }
}
