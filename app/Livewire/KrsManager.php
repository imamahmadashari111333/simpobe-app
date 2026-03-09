<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Krs;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use Livewire\WithPagination;

class KrsManager extends Component
{
    use WithPagination;

    public $search = '';
    public $confirmingKrsAddition = false;
    
    // Properti Form
    public $pilih_angkatan;
    public $selected_kode_mk = []; // Diubah menjadi array untuk multi-select
    public $semester, $tahun_akademik;

    // app/Livewire/KrsManager.php

// app/Livewire/KrsManager.php

// app/Livewire/KrsManager.php
public function render()
{
    $query = Krs::with(['mahasiswa', 'mataKuliah']);

    // Jika ada pencarian
    if ($this->search) {
        $query->where(function($q) {
            $q->whereHas('mahasiswa', function($mq) {
                $mq->where('nama', 'like', '%'.$this->search.'%')
                   ->orWhere('nim', 'like', '%'.$this->search.'%');
            })->orWhere('kode_mk', 'like', '%'.$this->search.'%');
        });
    }

    return view('livewire.krs-manager', [
        'krs_list' => $query->orderBy('mahasiswa_id')->paginate(20),
        'mata_kuliahs' => MataKuliah::orderBy('smt')->orderBy('nama_mk')->get(),
        'list_angkatan' => Mahasiswa::select('angkatan')->distinct()->orderBy('angkatan', 'desc')->get(),
    ]);
}

    public function confirmKrsAddition()
    {
        $this->reset(['pilih_angkatan', 'selected_kode_mk', 'semester', 'tahun_akademik']);
        $this->confirmingKrsAddition = true;
    }

    public function saveKrsMassal()
{
    $this->validate([
        'pilih_angkatan' => 'required',
        'selected_kode_mk' => 'required|array',
        'semester' => 'required',
        'tahun_akademik' => 'required',
    ]);

    $mahasiswas = Mahasiswa::where('angkatan', $this->pilih_angkatan)->get();

    foreach ($mahasiswas as $mhs) {
        foreach ($this->selected_kode_mk as $kode) {
            Krs::updateOrCreate(
                [
                    'mahasiswa_id'   => $mhs->nim, // Sekarang menyimpan NIM ke kolom mahasiswa_id
                    'kode_mk'        => $kode,
                    'tahun_akademik' => $this->tahun_akademik,
                ],
                [
                    'semester' => $this->semester, // Kolom semester di tabel krs
                ]
            );
        }
    }

    $this->confirmingKrsAddition = false;
    session()->flash('message', 'KRS Berhasil diproses menggunakan NIM.');
}
}