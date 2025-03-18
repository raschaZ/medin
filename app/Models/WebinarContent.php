<?php

namespace App\Models;

use Astrotomic\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class WebinarContent extends Model 
{

    protected $table = 'webinar_contents';
    public $timestamps = false;
    protected $dateFormat = 'U';
    protected $guarded = ['id'];
    
    public function webinar()
    {
        return $this->belongsTo('App\Models\Webinar', 'webinar_id', 'id');
    }
}
