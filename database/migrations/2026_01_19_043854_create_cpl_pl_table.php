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
        Schema::create('cpl_pl', function (Blueprint $table) {
            $table->id();
            $table->string('kode_cpl');
            $table->string('kode_pl');
            $table->timestamps();

            // Opsional: Menambahkan constraint foreign key jika menggunakan InnoDB
            $table->foreign('kode_cpl')->references('kode_cpl')->on('cpl_prodi')->onDelete('cascade');
            $table->foreign('kode_pl')->references('kode_pl')->on('profil_lulusan')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cpl_pl');
    }
};
