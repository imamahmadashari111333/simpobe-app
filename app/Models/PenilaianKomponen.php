<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PenilaianKomponen extends Model
{
    protected $fillable = [
    // Identitas Relasi (Wajib Ada!)
    'nim', 
    'kode_mk', 
    'user_id',
    
    // Metadata
    'smt', 
    'tahun_akademik',
    
    // Komponen Nilai
    'kehadiran', 
    'tugas', 
    'kuiz', 
    'praktik', 
    'uts', 
    'uas', 
    'nilai_mbkm', 
    
    // Hasil Perhitungan
    'nilai_akhir', 
    'nilai_huruf', 
    'nik',
    
    // Informasi Dosen
    'dosen1', 
    'dosen2', 
    'dosen3','prodi'
];

    public function mata_kuliah()
    {
        // Kita hubungkan kolom kode_mk di tabel penilaian ke kolom kode_mk di tabel mata_kuliah
        return $this->belongsTo(MataKuliah::class, 'kode_mk', 'kode_mk');
    }

    public function mahasiswa()
    {
        return $this->belongsTo(Mahasiswa::class, 'nim', 'nim');
    }
}