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
    Schema::table('krs', function (Blueprint $table) {
        // Hapus foreign key lama
        $table->dropForeign(['mahasiswa_id']);
        
        // Ubah tipe data mahasiswa_id jika sebelumnya integer menjadi string (sesuai NIM)
        $table->string('mahasiswa_id')->change();

        // Tambahkan foreign key baru yang merujuk ke NIM
        $table->foreign('mahasiswa_id')->references('nim')->on('mahasiswas')->onDelete('cascade')->onUpdate('cascade');
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
