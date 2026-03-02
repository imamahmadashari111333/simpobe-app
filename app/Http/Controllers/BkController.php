<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BkController extends Controller
{
    /**
     * Menampilkan daftar bahan kajian.
     */
    public function index()
    {
        return view('bk.index');
    }
}