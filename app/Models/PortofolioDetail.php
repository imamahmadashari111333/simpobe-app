<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PortofolioDetail extends Model
{
    protected $fillable = ['portofolio_id', 'kode_cpmk', 'refleksi_analisis', 'program_perbaikan','prodi'];

    public function portofolio()
    {
        return $this->belongsTo(Portofolio::class);
    }
}