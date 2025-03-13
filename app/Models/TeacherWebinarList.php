<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeacherWebinarList extends Model
{
    protected $fillable = ['webinar_id', 'instructor_id', 'teacher_ids', 'status','created_at'];
    public $timestamps = false;

    protected $casts = [
        'status' => 'string',
    ];
    public static $draft = 'draft';

    public static $waiting = 'waiting';
    public static $done = 'done';
    public static $reject = 'reject';

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