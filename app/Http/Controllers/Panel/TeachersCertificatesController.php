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
            $teacherIds = json_decode($teacherWebinarList->teacher_ids); // Decode the JSON into an array
            $teachers = TeachersCertificates::whereIn('id', $teacherIds)->get();
            return view(getTemplate() . '.panel.teachers.index', compact('teachers', 'webinar'));
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

        // Store the teacher in the TeachersCertificates table
        $teacher = TeachersCertificates::create([
            'webinar_id' => $request->webinar_id,
            'name' => $request->name,
            'email' => $request->email,
            'created_at' => time(),
        ]);

        // Find the existing TeacherWebinarList or create a new one
        $teacherWebinarList = TeacherWebinarList::where('webinar_id', $request->webinar_id)
                                                 ->where('instructor_id', $user->id)
                                                 ->first();

        // If a list exists, append the new teacher to it; otherwise, create a new list
        if ($teacherWebinarList) {
            $teacherIds = json_decode($teacherWebinarList->teacher_ids); // Decode the teacher_ids
            $teacherIds[] = $teacher->id; // Add the new teacher's ID to the list
            $teacherWebinarList->teacher_ids = json_encode($teacherIds); // Re-encode and save
            $teacherWebinarList->save();
        } else {
            // Create a new TeacherWebinarList with the teacher's ID
            TeacherWebinarList::create([
                'webinar_id' => $request->webinar_id,
                'instructor_id' => $user->id,
                'teacher_ids' => json_encode([$teacher->id]),
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
            $teacherIds = json_decode($teacherWebinarList->teacher_ids); // Decode the JSON into an array
            $teachers = TeachersCertificates::whereIn('id', $teacherIds)->get();
            return view('panel.teachers.show', compact('teachers', 'teacherWebinarList'));
        }

        return redirect()->back()->with('error', 'Teacher list not found for this webinar.');
    }

    /**
     * Delete the TeacherWebinarList record and its associated teacher records.
     *
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        // Find the TeacherWebinarList record
        $teacherWebinarList = TeacherWebinarList::findOrFail($id);

        // Decode the teacher_ids from the list (if it's stored as JSON)
        $teacherIds = json_decode($teacherWebinarList->teacher_ids);

        // Delete the teachers associated with this webinar list
        TeachersCertificates::whereIn('id', $teacherIds)->delete();

        // Now delete the TeacherWebinarList itself
        $teacherWebinarList->delete();

        return redirect()->back()->with('success', 'Teacher list and associated teachers deleted successfully.');
    }

    /**
     * Remove a teacher from a specific webinar's teacher list.
     *
     * @param  int  $webinarId
     * @param  int  $teacherId
     * @return \Illuminate\Http\RedirectResponse
     */
    public function removeTeacher($webinarId, $teacherId)
    {
        // Get the authenticated teacher (instructor)
        $teacher = auth()->user();

        // Find the TeacherWebinarList for the given webinar_id and the instructor (authenticated teacher)
        $teacherWebinarList = TeacherWebinarList::where('webinar_id', $webinarId)
                                                 ->where('instructor_id', $teacher->id)
                                                 ->first();

        if ($teacherWebinarList) {
            // Decode the teacher_ids from JSON
            $teacherIds = json_decode($teacherWebinarList->teacher_ids);

            // If teacherId exists in the list, remove it
            if (($key = array_search($teacherId, $teacherIds)) !== false) {
                unset($teacherIds[$key]);
                // Re-encode the teacher IDs and save back to the model
                $teacherWebinarList->teacher_ids = json_encode(array_values($teacherIds));
                $teacherWebinarList->save();

                return redirect()->back()->with('success', 'Teacher removed from webinar.');
            }
        }

        return redirect()->back()->with('error', 'Teacher not found in this webinar.');
    }
}

