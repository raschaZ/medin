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
        Schema::create('teachers_certificates', function (Blueprint $table) {
            $table->increments("id");
            $table->integer('webinar_id')->unsigned();
            $table->string('name');
            $table->string('email');
            $table->enum('status', ['waiting', 'done', 'reject']);

            $table->integer('created_at');

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
        Schema::dropIfExists('teachers_certificates');
    }
};
