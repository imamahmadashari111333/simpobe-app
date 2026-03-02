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
        Schema::create('metode_penilaian', function (Blueprint $table) {
            $table->id();
            $table->string('kode_mk');
            $table->string('kode_cpmk');
            $table->string('kode_sub_cpmk');
            // Kolom bobot penilaian (menggunakan decimal agar lebih presisi daripada integer)
            $table->decimal('mbkm', 5, 2)->default(0);
            $table->decimal('kehadiran', 5, 2)->default(0);
            $table->decimal('tugas', 5, 2)->default(0);
            $table->decimal('quiz', 5, 2)->default(0);
            $table->decimal('uts', 5, 2)->default(0);
            $table->decimal('uas', 5, 2)->default(0);
            $table->decimal('praktik', 5, 2)->default(0);
            $table->timestamps();

            $table->foreign('kode_mk')->references('kode_mk')->on('mata_kuliah')->onDelete('cascade');
            $table->foreign('kode_cpmk')->references('kode_cpmk')->on('cpmk')->onDelete('cascade');
            $table->foreign('kode_sub_cpmk')->references('kode_sub_cpmk')->on('sub_cpmk')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('metode_penilaian');
    }
};
