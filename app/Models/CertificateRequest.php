<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CertificateRequest extends Model
{    
    protected $table = "certificate_requests";
    public $timestamps = false;
    protected $guarded = ['id'];

    public static $waiting = 'waiting';
    public static $done = 'done';
    public static $reject = 'reject';

    public function instructor()
    {
        return $this->hasOne('App\User', 'id', 'instructor_id');
    }

    public function webinar()
    {
        return $this->hasOne('App\Models\Webinar', 'id', 'webinar_id');
    }
    public function teachersList()
    {
        return $this->hasOne('App\Models\TeacherWebinarList
        ', 'id', 'list_id');
    }
}
