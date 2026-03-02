<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProfilLulusan extends Model
{
    use HasFactory;

    protected $table = 'profil_lulusan';

    protected $fillable = [
        'kode_pl',
        'deskripsi_pl',
        'profesi','prodi'
    ];
}