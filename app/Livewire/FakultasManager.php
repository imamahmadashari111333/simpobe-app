<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Fakultas;
use Livewire\WithPagination;

class FakultasManager extends Component
{
    use WithPagination;

    public $search = '';
    public $confirmingFakultasAddition = false;
    public $confirmingFakultasDeletion = false;
    public $fakultasId, $nama_fakultas, $kode_fakultas;

    protected function rules() {
        return [
            'nama_fakultas' => 'required|string|max:255',
            'kode_fakultas' => 'required|string|unique:fakultas,kode_fakultas,' . $this->fakultasId,
        ];
    }

    public function saveFakultas()
    {
        $this->validate();

        Fakultas::updateOrCreate(['id' => $this->fakultasId], [
            'nama_fakultas' => $this->nama_fakultas,
            'kode_fakultas' => $this->kode_fakultas,
        ]);

        session()->flash('message', $this->fakultasId ? 'Fakultas berhasil diperbarui.' : 'Fakultas berhasil ditambah.');
        $this->confirmingFakultasAddition = false;
        $this->reset(['nama_fakultas', 'kode_fakultas', 'fakultasId']);
    }

    public function editFakultas(Fakultas $fakultas)
    {
        $this->fakultasId = $fakultas->id;
        $this->nama_fakultas = $fakultas->nama_fakultas;
        $this->kode_fakultas = $fakultas->kode_fakultas;
        $this->confirmingFakultasAddition = true;
    }

    public function confirmFakultasDeletion($id)
    {
        $this->fakultasId = $id;
        $this->confirmingFakultasDeletion = true;
    }

    public function deleteFakultas()
    {
        Fakultas::find($this->fakultasId)->delete();
        $this->confirmingFakultasDeletion = false;
        session()->flash('message', 'Fakultas berhasil dihapus.');
    }

    public function render()
    {
        return view('livewire.fakultas-manager', [
            'fakultas' => Fakultas::where('nama_fakultas', 'like', '%'.$this->search.'%')->paginate(10),
        ]);
    }
}