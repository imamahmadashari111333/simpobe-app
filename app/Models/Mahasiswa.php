<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mahasiswa extends Model
{
    use HasFactory;

    protected $fillable = ['nim', 'nama', 'angkatan', 'prodi', 'kelas'];

    // app/Models/Mahasiswa.php
    public function krs()
    {
        return $this->hasMany(Krs::class, 'mahasiswa_id', 'nim');
    }

    // app/Models/Mahasiswa.php
    public function penilaian()
    {
        // Relasi ke tabel penilaian_komponens
        return $this->hasMany(PenilaianKomponen::class, 'nim', 'nim');
    }
}