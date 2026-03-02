<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Cpmk;
use App\Models\Cpl;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class CpmkManager extends Component
{
    use WithFileUploads;

    public $kode_cpmk, $deskripsi_cpmk, $selected_id;
    public $search = '';
    public $prodi;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $file_import;

    protected $rules = [
        'kode_cpmk' => 'required|string|max:20',
        'deskripsi_cpmk' => 'required|string',
    ];

    public function mount()
    {
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    public function render()
    {
        $cpmks = Cpmk::where('prodi', $this->prodi)
            ->when($this->search, function($query) {
                $query->where(function($q) {
                    $q->where('kode_cpmk', 'like', '%' . $this->search . '%')
                      ->orWhere('deskripsi_cpmk', 'like', '%' . $this->search . '%');
                });
            })
            ->orderBy('kode_cpmk', 'asc')
            ->get();

        return view('livewire.cpmk-manager', [
            'cpmks' => $cpmks
        ]);
    }

    // --- FITUR IMPORT ---

    public function showImportModal()
    {
        $this->file_import = null;
        $this->confirmingImport = true;
    }

    public function downloadTemplate()
    {
        $filePath = public_path('templates/cpmk.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_CPMK.xlsx');
        }
        session()->flash('error', 'File template cpmk.xlsx tidak ditemukan.');
    }

    public function importProses()
    {
        $this->validate(['file_import' => 'required|mimes:xlsx,xls|max:10240']);
        $reader = new Reader();
        $successCount = 0;

        try {
            $reader->open($this->file_import->getRealPath());
            DB::beginTransaction();

            foreach ($reader->getSheetIterator() as $sheet) {
                foreach ($sheet->getRowIterator() as $index => $row) {
                    if ($index === 1) continue; 
                    $cells = $row->toArray();

                    // Mapping: 0:id, 1:kode_cpmk, 2:deskripsi_cpmk, 3:prodi
                    $kode      = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $deskripsi = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $prodiFile = isset($cells[3]) ? trim((string)$cells[3]) : null;

                    if (!$kode || !$prodiFile) continue;

                    Cpmk::updateOrCreate(
                        ['kode_cpmk' => $kode, 'prodi' => $prodiFile],
                        ['deskripsi_cpmk' => $deskripsi]
                    );
                    $successCount++;
                }
            }
            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil mengimport $successCount data CPMK.");
        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }

    // --- CRUD BIASA ---

    public function showModal()
    {
        $this->resetInputFields();
        $this->confirmingItemAddEdit = true;
    }

    private function resetInputFields()
    {
        $this->kode_cpmk = '';
        $this->deskripsi_cpmk = '';
        $this->selected_id = null;
    }

    public function save()
    {
        $this->validate();
        Cpmk::updateOrCreate(['id' => $this->selected_id], [
            'kode_cpmk' => $this->kode_cpmk,
            'deskripsi_cpmk' => $this->deskripsi_cpmk,
            'prodi' => $this->prodi,
        ]);

        $this->confirmingItemAddEdit = false;
        $this->resetInputFields();
        session()->flash('message', 'Data CPMK berhasil disimpan.');
    }

    public function edit($id)
    {
        $item = Cpmk::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->kode_cpmk = $item->kode_cpmk;
        $this->deskripsi_cpmk = $item->deskripsi_cpmk;
        $this->confirmingItemAddEdit = true;
    }

    public function confirmDelete($id)
    {
        Cpmk::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->confirmingItemDeletion = true;
    }

    public function delete()
    {
        Cpmk::where('prodi', $this->prodi)->where('id', $this->selected_id)->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Data CPMK berhasil dihapus.');
    }
}