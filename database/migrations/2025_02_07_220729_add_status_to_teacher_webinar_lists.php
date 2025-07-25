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
        Schema::table('teacher_webinar_lists', function (Blueprint $table) {
            $table->enum('status', ['draft', 'waiting', 'done', 'reject'])->default('draft')->after('instructor_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('teacher_webinar_lists', function (Blueprint $table) {
            $table->dropColumn('status');
        });
    }
};
