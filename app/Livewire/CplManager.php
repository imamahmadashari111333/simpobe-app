<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Cpl;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class CplManager extends Component
{
    use WithFileUploads;

    public $cpls, $kode_cpl, $deskripsi_cpl, $selected_id;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $search = '';
    public $prodi;
    
    public $file_import;

    protected $rules = [
        'kode_cpl' => 'required|string|max:10',
        'deskripsi_cpl' => 'required|string',
    ];

    public function mount()
    {
        // Tetap ambil prodi user untuk filter tampilan tabel di awal
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    public function render()
    {
        $this->cpls = Cpl::where('prodi', $this->prodi)
            ->when($this->search, function($query) {
                $query->where(function($q) {
                    $q->where('kode_cpl', 'like', '%' . $this->search . '%')
                      ->orWhere('deskripsi_cpl', 'like', '%' . $this->search . '%');
                });
            })
            ->orderBy('kode_cpl', 'asc')
            ->get();

        return view('livewire.cpl-manager');
    }

    public function downloadTemplate()
    {
        $filePath = public_path('templates/cpl_prodi.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_CPL_Prodi.xlsx');
        }
        session()->flash('error', 'File template tidak ditemukan di public/templates/');
    }

    public function showImportModal()
    {
        $this->file_import = null;
        $this->confirmingImport = true;
    }

    /**
     * Import Proses: Mengambil mentah-mentah dari Excel
     */
    public function importProses()
    {
        $this->validate([
            'file_import' => 'required|mimes:xlsx,xls|max:10240',
        ]);

        $reader = new Reader();
        $successCount = 0;

        try {
            $reader->open($this->file_import->getRealPath());
            DB::beginTransaction();

            foreach ($reader->getSheetIterator() as $sheet) {
                foreach ($sheet->getRowIterator() as $index => $row) {
                    if ($index === 1) continue; // Skip Header

                    $cells = $row->toArray();

                    /**
                     * Mapping Kolom:
                     * 0: id
                     * 1: kode_cpl
                     * 2: deskripsi_cpl
                     * 3: prodi
                     */
                    $kode      = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $deskripsi = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $prodiFile = isset($cells[3]) ? trim((string)$cells[3]) : null;

                    // Lewati jika kolom inti kosong
                    if (!$kode || !$deskripsi || !$prodiFile) continue;

                    // Langsung Simpan sesuai data dari Excel
                    Cpl::updateOrCreate(
                        [
                            'prodi' => $prodiFile, 
                            'kode_cpl' => $kode
                        ],
                        [
                            'deskripsi_cpl' => $deskripsi
                        ]
                    );
                    $successCount++;
                }
            }
            DB::commit();
            $this->confirmingImport = false;
            $this->reset(['file_import']);
            
            session()->flash('message', "Berhasil! $successCount data CPL telah diimport.");

        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }

    // --- FITUR TAMBAH/EDIT/HAPUS ---
    public function showModal() { $this->resetInputFields(); $this->confirmingItemAddEdit = true; }
    private function resetInputFields() { $this->kode_cpl = ''; $this->deskripsi_cpl = ''; $this->selected_id = null; }
    public function save() { 
        $this->validate(); 
        Cpl::updateOrCreate(['id' => $this->selected_id], [
            'prodi' => $this->prodi, 
            'kode_cpl' => $this->kode_cpl, 
            'deskripsi_cpl' => $this->deskripsi_cpl
        ]);
        $this->confirmingItemAddEdit = false; 
        session()->flash('message', 'Data berhasil disimpan.'); 
    }
    public function edit($id) { 
        $item = Cpl::findOrFail($id); 
        $this->selected_id = $id; 
        $this->kode_cpl = $item->kode_cpl; 
        $this->deskripsi_cpl = $item->deskripsi_cpl; 
        $this->confirmingItemAddEdit = true; 
    }
    public function confirmDelete($id) { $this->selected_id = $id; $this->confirmingItemDeletion = true; }
    public function delete() { 
        Cpl::findOrFail($this->selected_id)->delete(); 
        $this->confirmingItemDeletion = false; 
        session()->flash('message', 'Data berhasil dihapus.');
    }
}