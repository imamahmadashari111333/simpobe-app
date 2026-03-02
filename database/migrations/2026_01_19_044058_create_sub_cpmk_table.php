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
        Schema::create('sub_cpmk', function (Blueprint $table) {
            $table->id();
            $table->string('kode_sub_cpmk')->unique();
            $table->text('uraian_sub_cpmk');
            $table->text('materi_pembelajaran');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sub_cpmk');
    }
};
