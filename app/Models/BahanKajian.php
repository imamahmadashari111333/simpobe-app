<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BahanKajian extends Model
{
    use HasFactory;

    protected $table = 'bahan_kajian';

    protected $fillable = [
        'kode_bk', 
        'bahan_kajian', 
        'deskripsi', 
        'referensi', 
        'knowledge_area','prodi'
    ];
}