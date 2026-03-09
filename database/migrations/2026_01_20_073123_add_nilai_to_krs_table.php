<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up() {
    Schema::table('krs', function (Blueprint $table) {
        $table->decimal('nilai_angka', 5, 2)->nullable();
        $table->string('nilai_huruf', 2)->nullable();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('krs', function (Blueprint $table) {
            //
        });
    }
};
