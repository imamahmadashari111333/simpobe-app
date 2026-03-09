<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CplBk extends Model
{
    use HasFactory;

    protected $table = 'cpl_bk';
    protected $fillable = ['kode_bk', 'kode_cpl','prodi'];

    public function bahanKajian()
    {
        return $this->belongsTo(BahanKajian::class, 'kode_bk', 'kode_bk');
    }

    public function cpl()
    {
        return $this->belongsTo(Cpl::class, 'kode_cpl', 'kode_cpl');
    }
}