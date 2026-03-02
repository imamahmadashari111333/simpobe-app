<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class KetercapaianCplController extends Controller
{
    public function index()
    {
        return view('ketercapaian-cpl.index');
    }
}