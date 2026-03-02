<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Prodi;
use App\Models\Fakultas;
use Livewire\WithPagination;

class ProdiManager extends Component
{
    use WithPagination;

    public $search = '';
    public $confirmingProdiAddition = false;
    public $confirmingProdiDeletion = false;

    // Properti Form
    public $prodiId, $fakultas_id, $nama_prodi, $kode_prodi, $jenjang;

    protected function rules() {
        return [
            'fakultas_id' => 'required|exists:fakultas,id',
            'nama_prodi' => 'required|string|max:255',
            'kode_prodi' => 'required|string|unique:prodi,kode_prodi,' . $this->prodiId,
            'jenjang' => 'required|string',
        ];
    }

    public function saveProdi()
    {
        $this->validate();

        Prodi::updateOrCreate(['id' => $this->prodiId], [
            'fakultas_id' => $this->fakultas_id,
            'nama_prodi' => $this->nama_prodi,
            'kode_prodi' => $this->kode_prodi,
            'jenjang' => $this->jenjang,
        ]);

        session()->flash('message', $this->prodiId ? 'Data Prodi berhasil diperbarui.' : 'Data Prodi berhasil ditambahkan.');
        
        $this->confirmingProdiAddition = false;
        $this->reset(['prodiId', 'fakultas_id', 'nama_prodi', 'kode_prodi', 'jenjang']);
    }

    public function editProdi(Prodi $prodi)
    {
        $this->prodiId = $prodi->id;
        $this->fakultas_id = $prodi->fakultas_id;
        $this->nama_prodi = $prodi->nama_prodi;
        $this->kode_prodi = $prodi->kode_prodi;
        $this->jenjang = $prodi->jenjang;
        $this->confirmingProdiAddition = true;
    }

    // --- METODE YANG TADI HILANG ---
    public function confirmProdiDeletion($id)
    {
        $this->prodiId = $id;
        $this->confirmingProdiDeletion = true;
    }

    public function deleteProdi()
    {
        $prodi = Prodi::find($this->prodiId);
        
        if ($prodi) {
            $prodi->delete();
            session()->flash('message', 'Data Prodi berhasil dihapus.');
        }

        $this->confirmingProdiDeletion = false;
        $this->reset(['prodiId']);
    }
    // -------------------------------

    public function render()
    {
        return view('livewire.prodi-manager', [
            'prodis' => Prodi::with('fakultas')
                ->where('nama_prodi', 'like', '%' . $this->search . '%')
                ->orWhere('kode_prodi', 'like', '%' . $this->search . '%')
                ->paginate(10),
            'listFakultas' => Fakultas::orderBy('nama_fakultas', 'asc')->get(),
        ]);
    }
}