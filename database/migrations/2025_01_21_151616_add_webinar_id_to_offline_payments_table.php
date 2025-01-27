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
        Schema::table('offline_payments', function (Blueprint $table) {
            $table->unsignedInteger('webinar_id')->nullable()->after('reference_number');
            $table->foreign('webinar_id')->references('id')->on('webinars'); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('offline_payments', function (Blueprint $table) {
            $table->dropForeign(['webinar_id']);
            $table->dropColumn('webinar_id');
        });
    }
};
