<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CplMk extends Model
{
    use HasFactory;

    protected $table = 'cpl_mk';
    protected $fillable = ['kode_cpl', 'kode_mk','prodi'];

    public function cpl()
    {
        return $this->belongsTo(Cpl::class, 'kode_cpl', 'kode_cpl');
    }

    public function mataKuliah()
    {
        return $this->belongsTo(MataKuliah::class, 'kode_mk', 'kode_mk');
    }
}