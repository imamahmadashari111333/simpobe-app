<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Models\RelasiCapaian;
use App\Models\MetodePenilaian;
use App\Models\Prodi;
use App\Models\Cpmk;
use App\Models\CplMk;
use App\Models\CplBkMk;
use App\Models\CplBk;
use App\Models\BahanKajian;
use App\Models\SubCpmk;
use App\Models\DosenProfil;
use App\Models\MataKuliah;
use App\Models\Mahasiswa;
use App\Models\BkMk;
use App\Models\CplPl;
use App\Models\ProfilLulusan;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Endpoint GET Relasi Capaian (Agriby Diandra Chaniago)
Route::get('/relasi-capaian', function () {
    return RelasiCapaian::all();
});
// Link: https://simpobe.uhb.ac.id/api/relasi-capaian

// Endpoint GET Metode Penilaian (Agriby Diandra Chaniago)
Route::get('/metode-penilaian', function () {
    return MetodePenilaian::all();
});
// Link: https://simpobe.uhb.ac.id/api/metode-penilaian

// Endpoint GET Prodi (Annastasya Nabila Elsa Wulandari)
Route::get('/prodi', function () {
    return Prodi::all();
});
// Link: https://simpobe.uhb.ac.id/api/prodi

// Endpoint GET Cpmk (Safa Kiana)
Route::get('/cpmk', function () {
    return Cpmk::all();
});
// Link: https://simpobe.uhb.ac.id/api/cpmk

// Endpoint GET CplMk (Rachman Hidayat)
Route::get('/cpl-mk', function () {
    return CplMk::all();
});
// Link: https://simpobe.uhb.ac.id/api/cpl-mk

// Endpoint GET CplMkBk (Rachman Hidayat)
Route::get('/cpl-bk-mk', function () {
    return CplBkMk::all();
});
// Link: https://simpobe.uhb.ac.id/api/cpl-bk-mk

// Endpoint GET CplBk (Fakhri Zahi Mumtaza)
Route::get('/cpl-bk', function () {
    return CplBk::all();
});
// Link: https://simpobe.uhb.ac.id/api/cpl-bk

// Endpoint GET Bahan Kajian (Fakhri Zahi Mumtaza)
Route::get('/bahan-kajian', function () {
    return BahanKajian::all();
});
// Link: https://simpobe.uhb.ac.id/api/bahan-kajian

// Endpoint GET SubCpmk (Setiawan)
Route::get('/sub-cpmk', function () {
    return SubCpmk::all();
});
// Link: https://simpobe.uhb.ac.id/api/sub-cpmk

// Endpoint GET DosenProfil (Anisya)
Route::get('/dosen-profil', function () {
    return DosenProfil::all();
});
// Link: https://simpobe.uhb.ac.id/api/dosen-profil

// Endpoint GET Mata Kuliah (Humam)
Route::get('/mata-kuliah', function () {
    return MataKuliah::query()->get();
});
// Link: https://simpobe.uhb.ac.id/api/mata-kuliah

// Endpoint GET Pemetaan BK - MK (Humam)
Route::get('/pemetaan-bk-mk', function () {
    return BkMk::query()->with(['mataKuliah', 'bahanKajian'])->get();
});
// Link: https://simpobe.uhb.ac.id/api/pemetaan-bk-mk

// Endpoint GET Relasi CPL dengan Profil Lulusan (ESHA)
Route::get('/relasi-cpl-profil-lulusan', function () {
    return CplPl::query()->with(['cpl', 'pl'])->get();
});
// Link: https://simpobe.uhb.ac.id/api/relasi-cpl-profil-lulusan

// Endpoint GET Mahasiswa (ADWIN)
Route::get('/mahasiswa', function () {
    return Mahasiswa::all();
});
// Link: https://simpobe.uhb.ac.id/api/mahasiswa

// Endpoint GET Profil Lulusan (Putra)
Route::get('/profil-lulusan', function () {
    return ProfilLulusan::all();
});
// Link: https://simpobe.uhb.ac.id/api/profil-lulusan