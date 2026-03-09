<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('krs', function (Blueprint $table) {
        $table->id();
        // Relasi ke Mahasiswa (ID biasanya bigint)
        $table->foreignId('mahasiswa_id')->constrained('mahasiswas')->onDelete('cascade');
        
        // Relasi ke Mata Kuliah (Gunakan string jika primary key MK adalah kode_mk)
        $table->string('kode_mk'); 
        $table->foreign('kode_mk')->references('kode_mk')->on('mata_kuliah')->onDelete('cascade');
        
        $table->string('semester'); 
        $table->string('tahun_akademik', 10); 
        $table->timestamps();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('krs');
    }
};
