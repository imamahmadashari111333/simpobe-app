<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CplPl extends Model
{
    use HasFactory;

    protected $table = 'cpl_pl';

    protected $fillable = ['kode_cpl', 'kode_pl','prodi'];

    // Relasi ke tabel CPL Prodi
    public function cpl()
    {
        return $this->belongsTo(Cpl::class, 'kode_cpl', 'kode_cpl');
    }

    // Relasi ke tabel Profil Lulusan
    public function pl()
    {
        return $this->belongsTo(ProfilLulusan::class, 'kode_pl', 'kode_pl');
    }
}