<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class KrsController extends Controller
{
    /**
     * Menampilkan halaman pengelolaan KRS.
     */
    public function index()
    {
        // Mengembalikan view krs.index yang akan berisi komponen Livewire
        return view('krs.index');
    }
}