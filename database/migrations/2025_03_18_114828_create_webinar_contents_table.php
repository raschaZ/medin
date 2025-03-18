<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('webinar_contents', function (Blueprint $table) {
            $table->increments('id'); // ID of the webinarContent
            $table->integer('webinar_id')->unsigned(); // ID of the webinar
            $table->foreign('webinar_id')->on('webinars')->references('id')->cascadeOnDelete(); // Foreign key constraint to the webinars table
            $table->text('objectives'); // Objectives of the webinar
            $table->text('target_audience'); // Target audience for the webinar
            $table->text('program'); // Program details
            $table->string('file_path')->nullable(); // Path to the attached file
            $table->integer('updated_at')->unsigned(); // Timestamp of the last update
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('webinar_contents');
    }
};
