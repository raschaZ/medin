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
        Schema::table('certificates_templates', function (Blueprint $table) {
            $table->unsignedInteger('category_id')->nullable()->after('id'); 
            $table->foreign('category_id')->references('id')->on('categories'); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('certificates_templates', function (Blueprint $table) {
            $table->dropForeign(['category_id']);
            $table->dropColumn('category_id'); 
        });
    }
};
