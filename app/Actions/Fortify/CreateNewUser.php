<?php

namespace App\Actions\Fortify;

use App\Models\User;
use App\Models\DosenProfil;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Fortify\Contracts\CreatesNewUsers;
use Laravel\Jetstream\Jetstream;

class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    public function create(array $input): User
    {
        Validator::make($input, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => $this->passwordRules(),
            'registration_code' => ['required', function ($attribute, $value, $fail) {
                if ($value !== 'puyerobe') $fail('Kode akses tidak valid.');
            }],
            'nik' => ['required', 'string', 'unique:dosen_profils,nik'],
            'prodi' => ['required', 'string'],
            'fakultas' => ['required', 'string'],
            'jabatan_fungsional' => ['required', 'string'], // Tambahan Validasi
        ])->validate();

        return DB::transaction(function () use ($input) {
            $user = User::create([
                'name' => $input['name'],
                'email' => $input['email'],
                'password' => Hash::make($input['password']),
                'role' => 'dosen',
                'level' => 0,
            ]);

            DosenProfil::create([
                'user_id' => $user->id,
                'nik' => $input['nik'],
                'nidn' => $input['nidn'] ?? null,
                'gelar_depan' => $input['gelar_depan'] ?? null,
                'gelar_belakang' => $input['gelar_belakang'] ?? null,
                'prodi' => $input['prodi'],
                'fakultas' => $input['fakultas'],
                'jabatan_fungsional' => $input['jabatan_fungsional'], // Simpan Data Jafa
                'jabatan_struktural' => null, // Biasanya diisi oleh Admin kemudian
            ]);

            return $user;
        });
    }
}