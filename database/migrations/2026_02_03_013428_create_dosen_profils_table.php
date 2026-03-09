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
        Schema::create('dosen_profils', function (Blueprint $table) {
            $table->id();
            // Menghubungkan ke tabel users (autentikasi)
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            
            // Identitas Pegawai & Akademik
            $table->string('nik')->unique(); // NIK Pegawai
            $table->string('nidn')->unique()->nullable(); // NIDN Dikti
            $table->string('gelar_depan')->nullable();
            $table->string('gelar_belakang')->nullable();
            
            // Unit Kerja
            $table->string('prodi');
            $table->string('fakultas');
            
            // Jabatan
            $table->string('jabatan_fungsional')->nullable(); // Lektor, Lektor Kepala, dll
            $table->string('jabatan_struktural')->nullable(); // Dekan, Ketua LPM, Kaprodi, dll
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dosen_profils');
    }
};