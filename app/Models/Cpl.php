<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cpl extends Model
{
    use HasFactory;

    protected $table = 'cpl_prodi'; // Nama tabel sesuai Schema Anda

    protected $fillable = [
        'kode_cpl',
        'deskripsi_cpl','prodi'
    ];
}