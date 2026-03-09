<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('prodi', function (Blueprint $table) {
            $table->id();
            $table->foreignId('fakultas_id')->constrained('fakultas')->onDelete('cascade');
            $table->string('nama_prodi');
            $table->string('kode_prodi')->unique();
            $table->string('jenjang'); // Contoh: S1, S2, D3
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('prodi');
    }
};