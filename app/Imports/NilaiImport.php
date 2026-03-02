<?php

namespace App\Imports;

use App\Models\Krs;
use App\Models\Mahasiswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class NilaiImport implements ToModel, WithHeadingRow
{
    public function model(array $row)
    {
        // Cari mahasiswa berdasarkan NIM dari kolom di Excel
        $mahasiswa = Mahasiswa::where('nim', $row['nim'])->first();

        if ($mahasiswa) {
            // Cari data KRS yang sesuai (Mahasiswa + Kode MK)
            $krs = Krs::where('mahasiswa_id', $mahasiswa->id)
                      ->where('kode_mk', $row['kode_mk'])
                      ->first();
            
            if ($krs) {
                // Update Nilai Angka
                $nilai = $row['nilai'];
                $krs->nilai_angka = $nilai;

                // Logika otomatis konversi nilai huruf
                if ($nilai >= 85) $krs->nilai_huruf = 'A';
                elseif ($nilai >= 75) $krs->nilai_huruf = 'B';
                elseif ($nilai >= 60) $krs->nilai_huruf = 'C';
                elseif ($nilai >= 45) $krs->nilai_huruf = 'D';
                else $krs->nilai_huruf = 'E';
                
                $krs->save();
            }
        }
        return null; // Kita hanya mengupdate data, bukan menambah baris baru
    }
}