<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\KurikulumController;
use App\Http\Controllers\MataKuliahController;
use App\Http\Controllers\CplController;
use App\Http\Controllers\CpmkController;
use App\Http\Controllers\SubCpmkController;
use App\Http\Controllers\RelasiCapaianController;
use App\Http\Controllers\MetodePenilaianController;
use App\Http\Controllers\PenilaianObeController;
use App\Http\Controllers\PlController;
use App\Http\Controllers\CplPlController;
use App\Http\Controllers\BkController;
use App\Http\Controllers\CplBkController;
use App\Http\Controllers\BkMkController;
use App\Http\Controllers\CplMkController;
use App\Http\Controllers\CplBkMkController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\KrsController;
use App\Http\Controllers\PenilaianController;
use App\Http\Controllers\EvaluasiCpmkController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\DosenController;
use App\Http\Controllers\PortofolioController;
use App\Http\Controllers\CplMahasiswaController;
use App\Http\Controllers\KetercapaianCplController;
use App\Http\Controllers\AnalisisCplController;
use App\Http\Controllers\FakultasController;
use App\Http\Controllers\ProdiController;


// Rute Publik (Tanpa Login)
Route::get('/', function () {
    return view('welcome');
});

// Rute yang Memerlukan Autentikasi (Jetstream & Verified)
Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {

    Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // Kelompok Menu Kurikulum OBE
    Route::prefix('kurikulum-obe')->group(function () {
        // Tabel 1 - Tabel 5: Profil & CPL
        Route::resource('pl', PlController::class)->names('pl');
        Route::resource('cpl-sndikti', CplSndiktiController::class)->names('cpl-sndikti');
        Route::resource('cpl', CplController::class)->names('cpl');
        Route::resource('cpl-pl', CplPlController::class)->names('cpl-pl');

        // Tabel 6 - Tabel 7: Bahan Kajian
        Route::resource('bk', BkController::class)->names('bk');
        Route::resource('cpl-bk', CplBkController::class)->names('cpl-bk');

        // Tabel 8 - Tabel 12: Mata Kuliah & Pemetaan
        Route::resource('mata-kuliah', MataKuliahController::class)->names('mata-kuliah');
        Route::resource('bk-mk', BkMkController::class)->names('bk-mk');
        Route::resource('cpl-mk', CplMkController::class)->names('cpl-mk');
        Route::resource('cplbk-mk', CplBkMkController::class)->names('cplbk-mk');
        Route::resource('organisasi-mk', OrganisasiMkController::class)->names('organisasi-mk');

        // Tabel 13 - Tabel 16: CPMK, Sub-CPMK & Penilaian
        Route::resource('cpmk', CpmkController::class)->names('cpmk');
        Route::resource('sub-cpmk', SubCpmkController::class)->names('sub-cpmk');
        Route::resource('relasi', RelasiCapaianController::class)->names('relasi');
        Route::resource('metodepenilaian', MetodePenilaianController::class)->names('metodepenilaian');

        // Tambahan: Ringkasan Kurikulum
        Route::resource('kurikulum', KurikulumController::class)->names('kurikulum');
    });

    // Group Penilaian OBE
    Route::prefix('penilaian-obe')->group(function () {
        // Master Data Mahasiswa
        Route::resource('mahasiswa', MahasiswaController::class);

        // KRS (Kartu Rencana Studi)
        Route::resource('krs', KrsController::class);

        // Proses Nilai & Import
        Route::get('/import-nilai', [PenilaianController::class, 'importForm'])->name('penilaian.import');
        Route::post('/import-nilai', [PenilaianController::class, 'importProses'])->name('penilaian.import.proses');

        // Evaluasi & Laporan
        Route::get('/evaluasi-cpmk', [EvaluasiCpmkController::class, 'index'])->name('penilaian.evaluasi_cpmk');
        // Route baru untuk hasil evaluasi
        Route::get('/evaluasi-cpmk/hasil', \App\Livewire\EvaluasiCpmkManager::class)->name('penilaian.evaluasi_cpmk_hasil');

        Route::get('/matriks-cpl', [PenilaianController::class, 'matriksCpl'])->name('matriks-cpl');
        Route::get('/portofolio', [PenilaianController::class, 'portofolio'])->name('portofolio');
    });
    Route::get('/portofolio/download/{kode_mk}/{angkatan}', [PortofolioController::class, 'download'])
        ->name('portofolio.download');

    // Pastikan bagian ->name(...) sesuai dengan yang dipanggil di view
    Route::get('/penilaian-obe/portofolio', [PortofolioController::class, 'index'])
        ->name('portofolio.index');

    // Route untuk download (sudah benar menggunakan kode_mk dan angkatan)
    Route::match(['get', 'post'], '/portofolio/download/{kode_mk}/{angkatan}', [PortofolioController::class, 'download'])
        ->name('portofolio.download');
    // Route download yang sudah ada sebelumnya
    Route::match(['get', 'post'], '/portofolio/download/{kode_mk}/{angkatan}', [PortofolioController::class, 'download'])->name('portofolio.download');

    Route::middleware([
        'auth:sanctum',
        config('jetstream.auth_session'),
        'verified',
    ])->group(function () {

        // ... route dashboard dan lainnya ...

        // Route untuk Manajemen User
        Route::prefix('users')->name('users.')->group(function () {
            Route::get('/dosen', [UserController::class, 'dosen'])->name('dosen');
        });
    });
    Route::get('/users/dosen', [DosenController::class, 'index'])->name('users.dosen');

    Route::get('/ketercapaian-cpl', [KetercapaianCplController::class, 'index'])->name('cpl.ketercapaian');
    Route::get('/analisis-cpl', [AnalisisCplController::class, 'index'])->name('cpl.analisis');
    Route::get('/fakultas', [FakultasController::class, 'index'])->name('fakultas.index');
    Route::get('/prodi', [ProdiController::class, 'index'])->name('prodi.index');
});
