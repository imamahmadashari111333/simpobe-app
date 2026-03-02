<?php

namespace App\Http\Controllers;

class PenilaianController extends Controller
{
    public function index()
    {
        return view('penilaian.index');
    }

    public function importForm()
    {
        return view('penilaian.import');
    }
}