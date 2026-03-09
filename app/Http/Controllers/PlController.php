<?php

namespace App\Http\Controllers;

use App\Models\ProfilLulusan;
use Illuminate\Http\Request;

class PlController extends Controller
{
    public function index()
    {
        return view('pl.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Cpl $cpl)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Cpl $cpl)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Cpl $cpl)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cpl $cpl)
    {
        //
    }
}
