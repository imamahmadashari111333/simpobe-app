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
        Schema::create('organisasi_mk', function (Blueprint $table) {
            $table->id();
            $table->string('kode_mk');
            $table->enum('kategori', ['MKWU', 'MKDU', 'MKFS', 'IK', 'MKP']);
            $table->timestamps();

            $table->foreign('kode_mk')->references('kode_mk')->on('mata_kuliah')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('organisasi_mk');
    }
};
