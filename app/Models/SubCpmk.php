<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCpmk extends Model
{
    use HasFactory;

    protected $table = 'sub_cpmk';

    protected $fillable = [
        'kode_sub_cpmk',
        'uraian_sub_cpmk',
        'materi_pembelajaran','prodi'
    ];
}