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
        Schema::create('cpl_bk_mk', function (Blueprint $table) {
            $table->id();
            $table->string('kode_bk');
            $table->string('kode_cpl');
            $table->string('kode_mk');
            $table->timestamps();

            $table->foreign('kode_bk')->references('kode_bk')->on('bahan_kajian')->onDelete('cascade');
            $table->foreign('kode_cpl')->references('kode_cpl')->on('cpl_prodi')->onDelete('cascade');
            $table->foreign('kode_mk')->references('kode_mk')->on('mata_kuliah')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cpl_bk_mk');
    }
};
