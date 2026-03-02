<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MataKuliah extends Model
{
    use HasFactory;

    // Tambahkan baris ini untuk memaksa Laravel menggunakan nama tabel yang benar
    protected $table = 'mata_kuliah';

    protected $fillable = [
        'kode_mk', 
        'nama_mk', 
        'sks', 
        'smt', 
        'sks_teori', 
        'sks_praktik','prodi'
    ];

    // Pastikan ini ada di model jika belum didefinisikan di migrasi
    protected $attributes = [
        'sks_teori' => 0,
        'sks_praktik' => 0,
    ];

    // App\Models\MataKuliah.php
    public function pemetaanCpmk()
{
    return $this->hasMany(PemetaanMkCplCpmk::class, 'kode_mk', 'kode_mk');
}

    // App\Models\PemetaanMkCplCpmk.php
    public function metodePenilaian() {
        // Relasi ke tabel metode_penilaian berdasarkan kode_mk dan kode_cpmk
        return $this->hasMany(MetodePenilaian::class, 'kode_cpmk', 'kode_cpmk')
                    ->where('kode_mk', $this->kode_mk);
    }
}