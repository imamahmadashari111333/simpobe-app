<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EvaluasiCpmkController extends Controller
{
    /**
     * Menampilkan halaman wrapper untuk Livewire
     */
    public function index()
    {
        // Pastikan nama view ini sesuai dengan file di langkah nomor 2
        return view('penilaian.evaluasi_cpmk');
    }
}