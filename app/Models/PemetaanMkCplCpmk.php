<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PemetaanMkCplCpmk extends Model
{
    use HasFactory;

    // Nama tabel didefinisikan secara eksplisit karena tidak menggunakan bentuk jamak bahasa Inggris
    protected $table = 'pemetaan_mk_cpl_cpmk';

    protected $fillable = [
        'kode_mk',
        'kode_cpl',
        'kode_cpmk','prodi'
    ];

    /**
     * Relasi ke Mata Kuliah
     */
    public function mataKuliah()
    {
        return $this->belongsTo(MataKuliah::class, 'kode_mk', 'kode_mk');
    }

    /**
     * Relasi ke CPL Prodi
     */
    public function cpl()
    {
        return $this->belongsTo(Cpl::class, 'kode_cpl', 'kode_cpl');
    }

    /**
     * Relasi ke CPMK
     */
    public function cpmk()
    {
        return $this->belongsTo(Cpmk::class, 'kode_cpmk', 'kode_cpmk');
    }

    /**
     * Relasi ke Metode Penilaian 
     * Membantu mengambil bobot komponen untuk perhitungan evaluasi
     */
    public function metodePenilaian()
    {
        return $this->hasMany(MetodePenilaian::class, 'kode_cpmk', 'kode_cpmk')
                    ->where('kode_mk', $this->kode_mk);
    }
}