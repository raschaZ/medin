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
        Schema::table('teachers_certificates', function (Blueprint $table) {
            $table->unsignedInteger('list_id')->nullable(); 
        });
    
        Schema::table('teachers_certificates', function (Blueprint $table) {
            $table->foreign('list_id')->references('id')->on('teacher_webinar_lists')->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('teachers_certificates', function (Blueprint $table) {
            $table->dropForeign(['list_id']);
            $table->dropColumn('list_id');
        });
    }
};
