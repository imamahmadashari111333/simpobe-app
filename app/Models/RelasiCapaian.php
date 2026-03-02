<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RelasiCapaian extends Model
{
    use HasFactory;

    protected $table = 'relasi_capaian';

    protected $fillable = [
        'kode_mk',
        'kode_cpl',
        'kode_cpmk',
        'kode_sub_cpmk','prodi'
    ];

    // Relasi untuk memudahkan pemanggilan nama di tabel
    public function mataKuliah() { return $this->belongsTo(MataKuliah::class, 'kode_mk', 'kode_mk'); }
    public function cpl() { return $this->belongsTo(Cpl::class, 'kode_cpl', 'kode_cpl'); }
    public function cpmk() { return $this->belongsTo(Cpmk::class, 'kode_cpmk', 'kode_cpmk'); }
    public function subCpmk() { return $this->belongsTo(SubCpmk::class, 'kode_sub_cpmk', 'kode_sub_cpmk'); }
}