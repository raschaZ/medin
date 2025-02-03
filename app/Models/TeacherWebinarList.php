<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeacherWebinarList extends Model
{
    protected $fillable = ['webinar_id', 'instructor_id', 'teacher_ids', 'status'];
    
    protected $casts = [
        'teacher_ids' => 'array', 
        'status' => 'string',
    ];

    /**
     * Relationship: Webinar
     */
    public function webinar()
    {
        return $this->belongsTo(Webinar::class, 'webinar_id'); 
    }

    /**
     * Relationship: Certificate Request
     */
    public function certificateRequest()
    {
        return $this->belongsTo(CertificateRequest::class, 'list_id');
    }

    /**
     * Relationship: Teachers (one-to-Many)
     */

     public function teachers()
     {
         return $this->hasMany(TeachersCertificates::class, 'list_id');
     }

}