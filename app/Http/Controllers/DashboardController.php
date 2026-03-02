<?php

namespace App\Http\Controllers;

use App\Models\MataKuliah;
use App\Models\Cpl;
use App\Models\ProfilLulusan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        // 1. Ambil prodi dari user yang login menggunakan relasi profil()
        // Kita gunakan optional() untuk mencegah error jika data dosen_profils kosong
        $prodi = optional(Auth::user()->profil)->prodi;

        // 2. Jika prodi tidak ditemukan, kita set default array kosong agar view tidak error
        if (!$prodi) {
            return view('dashboard', [
                'total_mk' => 0,
                'total_sks' => 0,
                'profil_lulusan' => [],
                'cpl_prodi' => [],
                'error' => 'Data profil prodi tidak ditemukan.'
            ]);
        }

        // 3. Ambil data Mata Kuliah berdasarkan prodi user
        $query_mk = MataKuliah::where('prodi', $prodi);
        $total_mk = $query_mk->count();
        $raw_sks = $query_mk->sum('sks');
        
        // Logika SKS (dikurangi 24)
        $total_sks = max(0, $raw_sks - 24); 

        return view('dashboard', [
            'total_mk' => $total_mk,
            'total_sks' => $total_sks,
            // 4. Filter Profil Lulusan & CPL berdasarkan prodi yang sama
            'profil_lulusan' => ProfilLulusan::where('prodi', $prodi)->get(),
            'cpl_prodi' => Cpl::where('prodi', $prodi)->get(),
        ]);
    }
}