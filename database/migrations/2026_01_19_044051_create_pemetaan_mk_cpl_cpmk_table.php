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
        Schema::create('pemetaan_mk_cpl_cpmk', function (Blueprint $table) {
            $table->id();
            $table->string('kode_mk');
            $table->string('kode_cpl');
            $table->string('kode_cpmk');
            $table->timestamps();

            $table->foreign('kode_mk')->references('kode_mk')->on('mata_kuliah')->onDelete('cascade');
            $table->foreign('kode_cpl')->references('kode_cpl')->on('cpl_prodi')->onDelete('cascade');
            $table->foreign('kode_cpmk')->references('kode_cpmk')->on('cpmk')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pemetaan_mk_cpl_cpmk');
    }
};
