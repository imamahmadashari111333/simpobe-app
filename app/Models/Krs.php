<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Krs extends Model
{
    use HasFactory;

    // Tambahkan baris ini untuk mengizinkan input massal
    protected $fillable = [
        'mahasiswa_id', 
        'kode_mk', 
        'semester', 
        'tahun_akademik'
    ];

    /**
     * Relasi ke data Mahasiswa
     */
    public function mahasiswa()
    {
        return $this->belongsTo(Mahasiswa::class, 'mahasiswa_id', 'nim');
    }

    /**
     * Relasi ke data Mata Kuliah
     */
    public function mataKuliah()
    {
        // Karena kita menggunakan kode_mk sebagai foreign key, definisikan manual
        return $this->belongsTo(MataKuliah::class, 'kode_mk', 'kode_mk');
    }
}