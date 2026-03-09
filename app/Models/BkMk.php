<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BkMk extends Model
{
    use HasFactory;

    protected $table = 'bk_mk';
    protected $fillable = ['kode_mk', 'kode_bk','prodi'];

    public function mataKuliah()
    {
        return $this->belongsTo(MataKuliah::class, 'kode_mk', 'kode_mk');
    }

    public function bahanKajian()
    {
        return $this->belongsTo(BahanKajian::class, 'kode_bk', 'kode_bk');
    }
}