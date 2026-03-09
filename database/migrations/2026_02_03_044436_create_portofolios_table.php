<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('portofolios', function (Blueprint $table) {
    $table->id();
    $table->string('kode_mk')->index();
    $table->string('angkatan', 4)->index();
    $table->integer('tebal_rps')->nullable();
    $table->text('link_rps')->nullable(); // Ganti file ke Link
    $table->text('link_bukti_ajar')->nullable(); // Ganti file ke Link
    $table->timestamps();
    
    $table->unique(['kode_mk', 'angkatan']);
});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('portofolios');
    }
};
