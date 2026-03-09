<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CplBkController extends Controller
{
    /**
     * Menampilkan halaman pemetaan CPL ke Bahan Kajian.
     */
    public function index()
    {
        // Mengarahkan ke file blade resources/views/cpl-bk/index.blade.php
        return view('cpl-bk.index');
    }
}