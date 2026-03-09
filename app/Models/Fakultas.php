<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Fakultas extends Model
{
    use HasFactory;

    // Menentukan nama tabel secara eksplisit (opsional jika nama tabel jamak/plural)
    protected $table = 'fakultas';

    // Kolom yang boleh diisi secara mass-assignment
    protected $fillable = [
        'nama_fakultas',
        'kode_fakultas',
    ];

    /**
     * Relasi One-to-Many: Satu Fakultas memiliki banyak Prodi.
     */
    public function prodis(): HasMany
    {
        return $this->hasMany(Prodi::class, 'fakultas_id', 'id');
    }
}