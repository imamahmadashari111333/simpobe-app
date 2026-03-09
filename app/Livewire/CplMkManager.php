<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\CplMk;
use App\Models\Cpl;
use App\Models\MataKuliah;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class CplMkManager extends Component
{
    use WithFileUploads;

    public $kode_cpl, $kode_mk, $selected_id;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $search_mk = ''; 
    public $search_table = ''; 
    public $prodi;
    public $file_import;

    protected $rules = [
        'kode_cpl' => 'required',
        'kode_mk' => 'required',
    ];

    public function mount()
    {
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    public function render()
    {
        // Filter list MK untuk dropdown modal
        $filtered_mk = MataKuliah::where('prodi', $this->prodi)
            ->where(function($query) {
                $query->where('nama_mk', 'like', '%' . $this->search_mk . '%')
                      ->orWhere('kode_mk', 'like', '%' . $this->search_mk . '%');
            })
            ->orderBy('smt', 'asc')
            ->orderBy('kode_mk', 'asc')
            ->get();
            
        // Query utama tabel dengan filter prodi
        $cpl_mks_query = CplMk::with(['cpl', 'mataKuliah'])
            ->where('prodi', $this->prodi) // Proteksi Prodi Utama
            ->when($this->search_table, function($q) {
                $q->where(function($sub) {
                    $sub->where('kode_cpl', 'like', '%' . $this->search_table . '%')
                        ->orWhere('kode_mk', 'like', '%' . $this->search_table . '%')
                        ->orWhereHas('mataKuliah', function($mk) {
                            $mk->where('nama_mk', 'like', '%' . $this->search_table . '%');
                        });
                });
            })
            ->get();

        return view('livewire.cpl-mk-manager', [
            'cpl_mks' => $cpl_mks_query->sortBy('kode_cpl')->groupBy('kode_cpl'),
            'list_cpl' => Cpl::where('prodi', $this->prodi)->orderBy('kode_cpl', 'asc')->get(),
            'list_mk' => $filtered_mk,
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
        $filePath = public_path('templates/cpl_mk.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_CPL_MK.xlsx');
        }
        session()->flash('error', 'File template cpl_mk.xlsx tidak ditemukan.');
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

                    // Mapping: 0:id, 1:kode_cpl, 2:kode_mk, 3:prodi
                    $cplKode   = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $mkKode    = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $prodiFile = isset($cells[3]) ? trim((string)$cells[3]) : null;

                    if (!$cplKode || !$mkKode || !$prodiFile) continue;

                    CplMk::updateOrCreate(
                        ['kode_cpl' => $cplKode, 'kode_mk' => $mkKode, 'prodi' => $prodiFile],
                        ['prodi' => $prodiFile]
                    );
                    $successCount++;
                }
            }
            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil mengimport $successCount data pemetaan CPL-MK.");
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
        $this->reset(['kode_cpl', 'kode_mk', 'selected_id', 'search_mk']);
        $this->confirmingItemAddEdit = true;
    }

    public function edit($id)
    {
        $item = CplMk::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->kode_cpl = $item->kode_cpl;
        $this->kode_mk = $item->kode_mk;
        $this->confirmingItemAddEdit = true;
    }

    public function save()
    {
        $this->validate();
        CplMk::updateOrCreate(
            ['id' => $this->selected_id],
            [
                'kode_cpl' => $this->kode_cpl,
                'kode_mk' => $this->kode_mk,
                'prodi' => $this->prodi, // Simpan prodi login
            ]
        );
        $this->confirmingItemAddEdit = false;
        session()->flash('message', 'Data berhasil disimpan.');
    }

    public function confirmDelete($id)
    {
        $this->selected_id = $id;
        $this->confirmingItemDeletion = true;
    }

    public function delete()
    {
        CplMk::where('prodi', $this->prodi)->findOrFail($this->selected_id)->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Data berhasil dihapus.');
    }
}