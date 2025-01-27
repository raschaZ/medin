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
        Schema::create('certificate_requests', function (Blueprint $table) {
            $table->increments("id");
            $table->integer('instructor_id')->unsigned();
            $table->integer('webinar_id')->unsigned();
            $table->enum('status', ['waiting', 'done', 'reject']);
            $table->integer('created_at');

            // Add foreign key constraints if applicable
            $table->foreign('instructor_id')->references('id')->on('users')->cascadeOnDelete();
            $table->foreign('webinar_id')->references('id')->on('webinars')->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('certificate_requests');
    }
};
