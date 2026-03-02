<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RelasiCapaianController extends Controller
{
    /**
     * Menampilkan halaman pemetaan (mapping) OBE.
     */
    public function index()
    {
        return view('relasi.index');
    }
}
