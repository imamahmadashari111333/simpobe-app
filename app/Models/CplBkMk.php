<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CplBkMk extends Model
{
    use HasFactory;

    protected $table = 'cpl_bk_mk';

    // Kolom 'id' jangan dimasukkan ke fillable jika sudah auto-increment
    // 'prodi' WAJIB ada di sini agar bisa disimpan
    protected $fillable = [
        'kode_bk', 
        'kode_cpl', 
        'kode_mk', 
        'prodi'
    ];

    /**
     * Relasi ke model lain (Pastikan nama model sesuai dengan aplikasi Anda)
     */
    public function mataKuliah() {
        return $this->belongsTo(MataKuliah::class, 'kode_mk', 'kode_mk');
    }

    public function cpl() {
        return $this->belongsTo(Cpl::class, 'kode_cpl', 'kode_cpl');
    }

    public function bahanKajian() {
        return $this->belongsTo(BahanKajian::class, 'kode_bk', 'kode_bk');
    }
}