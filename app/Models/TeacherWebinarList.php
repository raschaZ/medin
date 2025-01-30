<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeacherWebinarList extends Model
{
    protected $fillable = ['webinar_id', 'instructor_id', 'teacher_ids'];
    
    protected $casts = [
        'teacher_ids' => 'array', 
    ];
    
    /**
     * Define the relationship between TeachersCertificates and Webinar.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function webinar()
    {
        return $this->belongsTo(Webinar::class, 'webinar_id'); 
    }
}
