<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DosenProfil extends Model
{
    use HasFactory;

    /**
     * Field yang boleh diisi secara massal.
     */
    protected $fillable = [
        'user_id',
        'nik',
        'nidn',
        'gelar_depan',
        'gelar_belakang',
        'prodi',
        'fakultas',
        'jabatan_fungsional',
        'jabatan_struktural',
    ];

    /**
     * Relasi Kebalikan ke User (Many to One / One to One)
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}