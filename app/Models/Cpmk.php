<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cpmk extends Model
{
    use HasFactory;

    protected $table = 'cpmk';

    protected $fillable = [
        'kode_cpmk',
        'deskripsi_cpmk','prodi'
    ];

    public function pemetaan()
{
    return $this->hasMany(PemetaanMkCplCpmk::class, 'kode_cpmk', 'kode_cpmk');
}
}