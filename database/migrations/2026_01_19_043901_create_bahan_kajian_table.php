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
        Schema::create('bahan_kajian', function (Blueprint $table) {
            $table->id();
            $table->string('kode_bk')->unique();
            $table->string('bahan_kajian');
            $table->text('deskripsi');
            $table->text('referensi')->nullable();
            $table->string('knowledge_area'); // Koreksi typo dari 'knowladge'
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bahan_kajian');
    }
};
