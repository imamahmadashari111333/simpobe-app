<?php

namespace App\Http\Controllers;

use App\Models\Cpl;
use Illuminate\Http\Request;

class CplController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('cpl.index');
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
