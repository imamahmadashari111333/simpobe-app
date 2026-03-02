<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MetodePenilaian extends Model
{
    use HasFactory;

    protected $table = 'metode_penilaian';

    protected $fillable = [
        'kode_mk', 'kode_cpmk', 'kode_sub_cpmk',
        'mbkm', 'kehadiran', 'tugas', 'quiz', 'uts', 'uas', 'praktik','prodi'
    ];

    // Relasi
    public function mataKuliah() { return $this->belongsTo(MataKuliah::class, 'kode_mk', 'kode_mk'); }
    public function cpmk() { return $this->belongsTo(Cpmk::class, 'kode_cpmk', 'kode_cpmk'); }
    public function subCpmk() { return $this->belongsTo(SubCpmk::class, 'kode_sub_cpmk', 'kode_sub_cpmk'); }
}