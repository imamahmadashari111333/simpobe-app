<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Mahasiswa;
use App\Models\Cpl;
use App\Models\RelasiCapaian;
use App\Models\Prodi;
use Illuminate\Support\Facades\Auth;

class KetercapaianCplManager extends Component
{
    public $angkatan, $prodi, $search; 
    public $prodi_login; 
    public $list_cpl = [];
    public $search_results = [];
    public $options_angkatan = [];
    public $options_prodi = [];

    public function mount()
    {
        $this->prodi_login = Auth::user()->profil->prodi ?? null;
        
        // Kunci nilai properti prodi ke prodi_login
        $this->prodi = $this->prodi_login;

        $this->list_cpl = Cpl::where('prodi', $this->prodi_login)
            ->orderBy('kode_cpl', 'asc')
            ->get();

        $this->options_angkatan = Mahasiswa::where('prodi', $this->prodi_login)
            ->select('angkatan')
            ->distinct()
            ->orderBy('angkatan', 'desc')
            ->pluck('angkatan');

        // Untuk options prodi, kita hanya ambil data prodi login saja agar pilihan lain tidak muncul
        $this->options_prodi = Prodi::where('nama_prodi', $this->prodi_login)
            ->pluck('nama_prodi');
    }

    public function cari()
    {
        $this->prodi = $this->prodi_login;

        $this->validate([
            'angkatan' => 'required',
            'prodi' => 'required',
        ]);

        $petaCpl = RelasiCapaian::whereHas('cpl', function($q) {
            $q->where('prodi', $this->prodi_login);
        })->get()->groupBy('kode_cpl');

        $query = Mahasiswa::where('angkatan', $this->angkatan)
            ->where('prodi', $this->prodi_login)
            ->with(['penilaian']);

        if ($this->search) {
            $query->where(function($q) {
                $q->where('nama', 'like', '%' . $this->search . '%')
                  ->orWhere('nim', 'like', '%' . $this->search . '%');
            });
        }

        $results = $query->get()->map(function ($mhs) use ($petaCpl) {
            $hasilCpl = [];
            foreach ($this->list_cpl as $cpl) {
                $listRelasi = $petaCpl->get($cpl->kode_cpl);
                if ($listRelasi) {
                    $uniqueMk = $listRelasi->pluck('kode_mk')->unique();
                    $avgNilai = $mhs->penilaian->whereIn('kode_mk', $uniqueMk)->avg('nilai_akhir');
                    $hasilCpl[$cpl->kode_cpl] = $avgNilai ? number_format($avgNilai, 2) : 0; // Set 0 jika null untuk grafik
                } else {
                    $hasilCpl[$cpl->kode_cpl] = 0;
                }
            }

            return [
                'nim'   => $mhs->nim,
                'nama'  => $mhs->nama,
                'prodi' => $mhs->prodi,
                'cpl'   => $hasilCpl
            ];
        });

        $this->search_results = $results->toArray();

        // Hitung Rata-rata CPL Keseluruhan untuk Grafik
        $chartLabels = [];
        $chartData = [];

        foreach ($this->list_cpl as $cpl) {
            $chartLabels[] = $cpl->kode_cpl;
            // Ambil rata-rata dari seluruh mahasiswa untuk CPL ini
            $avgCpl = collect($this->search_results)->avg(function($item) use ($cpl) {
                return (float) $item['cpl'][$cpl->kode_cpl];
            });
            $chartData[] = number_format($avgCpl, 2);
        }

        // Kirim data ke Browser
        $this->dispatch('update-charts', labels: $chartLabels, data: $chartData);
    }

    public function render()
    {
        return view('livewire.ketercapaian-cpl-manager');
    }
}