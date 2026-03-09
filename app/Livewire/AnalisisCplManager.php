<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Mahasiswa;
use App\Models\Cpl;
use App\Models\RelasiCapaian;
use App\Models\MetodePenilaian;
use App\Models\Prodi;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AnalisisCplManager extends Component
{
    public $angkatan, $prodi, $selected_cpl;
    public $prodi_login, $kaprodi; // Tambahkan variabel kaprodi
    public $options_angkatan = [], $options_prodi = [], $list_cpl = [];
    public $stats = ['Tinggi' => 0, 'Sedang' => 0, 'Rendah' => 0, 'Tidak Tercapai' => 0];
    public $mahasiswa_list = [];
    public $komponen_penilaian = [];
    public $total_skor_maks = 0;

    public function mount()
    {
        // 1. Ambil prodi user login
        $this->prodi_login = Auth::user()->profil->prodi ?? null;
        $this->prodi = $this->prodi_login;

        // 2. Opsi Angkatan filter berdasarkan prodi
        $this->options_angkatan = Mahasiswa::where('prodi', $this->prodi_login)
            ->distinct()
            ->orderBy('angkatan', 'desc')
            ->pluck('angkatan');

        // 3. Opsi Prodi dari Model Prodi (Hanya prodi login)
        $this->options_prodi = Prodi::where('nama_prodi', $this->prodi_login)->pluck('nama_prodi');

        // 4. List CPL berdasarkan prodi
        $this->list_cpl = Cpl::where('prodi', $this->prodi_login)->orderBy('kode_cpl', 'asc')->get();

        // 5. Data Kaprodi untuk tanda tangan
        $this->kaprodi = User::with('profil')
            ->whereHas('profil', function($q) {
                $q->where('jabatan_struktural', 'Kaprodi')
                  ->where('prodi', $this->prodi_login);
            })->first();
    }

    public function updated($propertyName)
    {
        if (in_array($propertyName, ['angkatan', 'prodi', 'selected_cpl'])) {
            $this->hitungAnalisis();
        }
    }

    public function hitungAnalisis()
    {
        // Force prodi agar tidak bisa diubah via inspect element
        $this->prodi = $this->prodi_login;

        if (!$this->angkatan || !$this->prodi || !$this->selected_cpl) return;

        $relasi = RelasiCapaian::where('kode_cpl', $this->selected_cpl)
            ->whereHas('cpl', fn($q) => $q->where('prodi', $this->prodi_login))
            ->with(['mataKuliah'])->get();
            
        $uniqueMk = $relasi->pluck('kode_mk')->unique();

        $this->komponen_penilaian = MetodePenilaian::whereIn('kode_mk', $uniqueMk)
            ->whereIn('kode_cpmk', $relasi->pluck('kode_cpmk'))
            ->with(['mataKuliah'])->get();
        
        $this->total_skor_maks = $this->komponen_penilaian->sum(function($kp) {
            return ($kp->mbkm + $kp->kehadiran + $kp->tugas + $kp->quiz + $kp->uts + $kp->uas + $kp->praktik);
        });

        $mahasiswas = Mahasiswa::where('angkatan', $this->angkatan)
            ->where('prodi', $this->prodi_login)
            ->with(['penilaian'])->get();

        $this->resetStats();
        $this->mahasiswa_list = [];

        foreach ($mahasiswas as $mhs) {
            $nilai_per_cpmk = [];
            $total_nilai_kumulatif = 0;
            $count_cpmk = 0;

            foreach ($this->komponen_penilaian as $kp) {
                $nilaiMhs = $mhs->penilaian->where('kode_mk', $kp->kode_mk)->first();
                $skor = $nilaiMhs ? $nilaiMhs->nilai_akhir : 0;
                $nilai_per_cpmk[] = ['skor' => $skor];
                $total_nilai_kumulatif += $skor;
                $count_cpmk++;
            }

            $nilai_akhir_cpl = $count_cpmk > 0 ? ($total_nilai_kumulatif / $count_cpmk) : 0;
            $predikat = $this->getPredikat($nilai_akhir_cpl);
            $this->stats[$predikat]++;

            $this->mahasiswa_list[] = [
                'nim' => $mhs->nim,
                'nama' => $mhs->nama,
                'items' => $nilai_per_cpmk,
                'nilai_akhir' => number_format($nilai_akhir_cpl, 2),
                'predikat' => $predikat
            ];
        }

        $this->dispatch('updateCharts', data: array_values($this->stats));
    }

    private function getPredikat($nilai)
    {
        if ($nilai >= 80) return 'Tinggi';
        if ($nilai >= 60) return 'Sedang';
        if ($nilai >= 40) return 'Rendah';
        return 'Tidak Tercapai';
    }

    private function resetStats() { $this->stats = ['Tinggi' => 0, 'Sedang' => 0, 'Rendah' => 0, 'Tidak Tercapai' => 0]; }

    public function render() { return view('livewire.analisis-cpl-manager'); }
}