<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Portofolio extends Model
{
    protected $fillable = [
    'kode_mk', 
    'angkatan', 
    'prodi',
    'link_rps', 
    'lik_jurnal_pengajaran', 
    'integrasi_penelitian', 
    'integrasi_pengabmas', 
    'link_presensi_kehadiran_mahasiswa', 
    'link_bahan_ajar', 
    'link_analisis_soal', 
    'link_sampel_pekerjaan_mahasiswa', 
    'link_nilai_panjang'
];

    // Relasi ke detail (Refleksi per CPMK)
    public function details()
    {
        return $this->hasMany(PortofolioDetail::class);
    }
}