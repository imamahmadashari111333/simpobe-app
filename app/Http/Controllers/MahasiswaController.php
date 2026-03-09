<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MahasiswaController extends Controller
{
    public function index()
    {
        // Pastikan nama file di resources/views/mahasiswa/index.blade.php ada
        return view('mahasiswa.index');
    }
}