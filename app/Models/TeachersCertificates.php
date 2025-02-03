<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeachersCertificates extends Model
{
    
    protected $fillable = ['webinar_id', 'name', 'email','created_at','list_id'];
    public $timestamps = false;

    /**
     * Define the relationship between TeachersCertificates and Webinar.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function webinar()
    {
        return $this->belongsTo(Webinar::class, 'webinar_id'); 
    }

      /**
     * Relationship: TeacherWebinarList (one-to-Many)
     */

    public function teacherWebinarList()
    {
        
        return $this->belongsTo(TeacherWebinarList::class, 'list_id');
    }
}
