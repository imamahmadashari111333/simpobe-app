<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\ProfilLulusan;
use Illuminate\Support\Facades\Auth;

class ProfilLulusanManager extends Component
{
    public $pls, $selected_id, $kode_pl, $deskripsi_pl, $profesi;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;

    protected $rules = [
        'kode_pl' => 'required|string|max:10',
        'deskripsi_pl' => 'required|string',
        'profesi' => 'required|string',
    ];

    public function render()
    {
        // 1. Ambil prodi dari user yang login melalui relasi profil
        $prodi = optional(Auth::user()->profil)->prodi;

        // 2. Filter data PL berdasarkan prodi user tersebut
        $this->pls = ProfilLulusan::where('prodi', $prodi)->get();

        return view('livewire.profil-lulusan-manager');
    }

    public function showModal()
    {
        $this->resetInputFields();
        $this->confirmingItemAddEdit = true;
    }

    private function resetInputFields()
    {
        $this->kode_pl = '';
        $this->deskripsi_pl = '';
        $this->profesi = '';
        $this->selected_id = null;
    }

    public function save()
    {
        $this->validate();

        // 3. Ambil prodi user untuk disimpan ke database
        $prodi = optional(Auth::user()->profil)->prodi;

        // 4. Pastikan kolom 'prodi' ikut disimpan/diupdate
        ProfilLulusan::updateOrCreate(['id' => $this->selected_id], [
            'kode_pl' => $this->kode_pl,
            'deskripsi_pl' => $this->deskripsi_pl,
            'profesi' => $this->profesi,
            'prodi' => $prodi, // Menyimpan prodi secara otomatis
        ]);

        $this->confirmingItemAddEdit = false;
        $this->resetInputFields();
    }

    public function edit($id)
    {
        // Gunakan where prodi juga untuk keamanan agar tidak bisa edit prodi lain via ID
        $prodi = optional(Auth::user()->profil)->prodi;
        $item = ProfilLulusan::where('prodi', $prodi)->findOrFail($id);

        $this->selected_id = $id;
        $this->kode_pl = $item->kode_pl;
        $this->deskripsi_pl = $item->deskripsi_pl;
        $this->profesi = $item->profesi;
        $this->confirmingItemAddEdit = true;
    }

    public function delete()
    {
        if ($this->selected_id) {
            $prodi = optional(Auth::user()->profil)->prodi;
            
            // Pastikan hanya bisa menghapus data miliknya sendiri
            ProfilLulusan::where('prodi', $prodi)
                ->where('id', $this->selected_id)
                ->delete();

            $this->confirmingItemDeletion = false;
            $this->selected_id = null;
        }
    }

    public function confirmDeletion($id)
    {
        $this->selected_id = $id;
        $this->confirmingItemDeletion = true;
    }
}