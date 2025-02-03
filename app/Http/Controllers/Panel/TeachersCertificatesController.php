<?php

namespace App\Http\Controllers\Panel;

use App\Http\Controllers\Controller;
use App\Models\TeachersCertificates;
use App\Models\TeacherWebinarList;
use App\Models\Webinar;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TeachersCertificatesController extends Controller
{
    /**
     * Display a listing of teachers for a given webinar.
     *
     * @param  int  $webinarId
     * @return \Illuminate\View\View
     */
    public function index($webinarId)
    {
        $teachers=null;
        // Get the authenticated teacher
        $user = auth()->user(); // Assuming teacher is authenticated as 'user'

        // Get the teacher list related to the given webinar_id and instructor
        $teacherWebinarList = TeacherWebinarList::where('webinar_id', $webinarId)
                                                 ->where('instructor_id', $user->id)
                                                 ->first();
        if ($teacherWebinarList) {   
            $webinar = $teacherWebinarList->webinar;
            $teachers = $teacherWebinarList->teachers;
            return view(getTemplate() . '.panel.teachers.index', compact('teachers', 'webinar','teacherWebinarList'));
        }
       
        $webinar= Webinar::findOrFail($webinarId);
        return view(getTemplate() . '.panel.teachers.index', compact('teachers', 'webinar'));
    }
    
    /**
     * Store a teacher for a specific webinar and instructor.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        // Get the authenticated teacher (instructor)
        $user = auth()->user();

        // Validate the request
        $request->validate([
            'webinar_id' => 'required|exists:webinars,id', // Check if the webinar exists
            'name' => 'required|string', // Teacher name validation
            'email' => 'required|email', // Validate email as a string
        ]);
        
        // Find the existing TeacherWebinarList or create a new one
        $teacherWebinarList = TeacherWebinarList::where('webinar_id', $request->webinar_id)
                                                 ->where('instructor_id', $user->id)
                                                 ->first();
                                                 
        if ($teacherWebinarList) {
            // Store the teacher in the TeachersCertificates table
            TeachersCertificates::create([
                'webinar_id' => $request->webinar_id,
                'name' => $request->name,
                'list_id' => $teacherWebinarList->id,
                'email' => $request->email,
                'created_at' => time(),
            ]);
        } else {
            // Create a new TeacherWebinarList with the teacher's ID
            $teacherWebinarList = TeacherWebinarList::create([
                'webinar_id' => $request->webinar_id,
                'instructor_id' => $user->id,
            ]);
            
            TeachersCertificates::create([
                'webinar_id' => $request->webinar_id,
                'name' => $request->name,
                'list_id' => $teacherWebinarList->id,
                'email' => $request->email,
                'created_at' => time(),
            ]);
        }
        // Redirect back with success message
        return redirect()->back()->with('success', 'Teacher added to the webinar.');
    }

    /**
     * Show the teacher list for a specific webinar and instructor.
     *
     * @param  int  $webinarId
     * @return \Illuminate\View\View|\Illuminate\Http\RedirectResponse
     */
    public function show($webinarId)
    {
        // Get the authenticated teacher
        $teacher = auth()->user(); // Assuming teacher is authenticated as 'user'

        // Get the teacher list for the given webinar_id and authenticated teacher's ID
        $teacherWebinarList = TeacherWebinarList::where('webinar_id', $webinarId)
                                                ->where('instructor_id', $teacher->id)
                                                ->first();

        if ($teacherWebinarList) {
            $teachers = $teacherWebinarList->teachers;
            return view('panel.teachers.show', compact('teachers', 'teacherWebinarList'));
        }

        return redirect()->back()->with('error', 'Teacher list not found for this webinar.');
    } 

    /**
     * Remove a teacher from a specific webinar's teacher list.
     *
     * @param  int  $webinarId
     * @param  int  $teacherId
     * @return \Illuminate\Http\RedirectResponse
     */
    public function removeTeacher($webinarId, $teacherid)
    {
        // Récupérer l'instructeur authentifié
        $user = auth()->user();
    
        // Vérifier si la liste de l'instructeur existe pour ce webinar
        $teacherWebinarList = TeacherWebinarList::where('webinar_id', $webinarId)
                                                ->where('instructor_id', $user->id)
                                                ->first();
    
        if ($teacherWebinarList) {
            // Supprimer l'enseignant de TeachersCertificates
            $deleted = TeachersCertificates::where('list_id', $teacherWebinarList->id)
                                           ->where('id', $teacherid)
                                           ->delete();
            if ($deleted) {
                return redirect()->back()->with('success', 'Teacher removed from webinar.');
            }
        }
    
        return redirect()->back()->with('error', 'Teacher not found in this webinar.');
    }
    
}

