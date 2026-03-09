<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MetodePenilaianController extends Controller
{
    public function index() { 
        return view('metodepenilaian.index'); 
    }
}
