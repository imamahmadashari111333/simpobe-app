<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\BkMk;
use App\Models\MataKuliah;
use App\Models\BahanKajian;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class BkMkManager extends Component
{
    use WithFileUploads;

    public $kode_mk, $kode_bk, $selected_id;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $search = '';
    public $prodi;
    public $file_import;

    protected $rules = [
        'kode_mk' => 'required',
        'kode_bk' => 'required',
    ];

    public function mount()
    {
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    public function render()
    {
        $query = BkMk::with(['mataKuliah', 'bahanKajian'])
            ->where('prodi', $this->prodi) // Filter utama prodi
            ->when($this->search, function($q) {
                $q->where(function($sub) {
                    $sub->where('kode_mk', 'like', '%' . $this->search . '%')
                        ->orWhere('kode_bk', 'like', '%' . $this->search . '%')
                        ->orWhereHas('mataKuliah', function($mk) {
                            $mk->where('nama_mk', 'like', '%' . $this->search . '%');
                        })
                        ->orWhereHas('bahanKajian', function($bk) {
                            $bk->where('bahan_kajian', 'like', '%' . $this->search . '%');
                        });
                });
            });

        return view('livewire.bk-mk-manager', [
            'bk_mks' => $query->get()->sortBy(function($item) {
                return $item->mataKuliah->smt ?? 0;
            })->groupBy('kode_mk'),
            'list_mk' => MataKuliah::where('prodi', $this->prodi)->orderBy('smt')->orderBy('kode_mk')->get(),
            'list_bk' => BahanKajian::where('prodi', $this->prodi)->orderBy('kode_bk')->get(),
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
        $filePath = public_path('templates/bk_mk.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_BK_MK.xlsx');
        }
        session()->flash('error', 'File template bk_mk.xlsx tidak ditemukan.');
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

                    // Mapping: 0:id, 1:kode_mk, 2:kode_bk, 3:prodi
                    $mkKode    = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $bkKode    = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $prodiFile = isset($cells[3]) ? trim((string)$cells[3]) : null;

                    if (!$mkKode || !$bkKode || !$prodiFile) continue;

                    BkMk::updateOrCreate(
                        [
                            'kode_mk' => $mkKode,
                            'kode_bk' => $bkKode,
                            'prodi'   => $prodiFile
                        ],
                        [
                            'prodi'   => $prodiFile // Pastikan kolom prodi terisi (tidak NULL)
                        ]
                    );
                    $successCount++;
                }
            }

            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil mengimport $successCount pemetaan BK-MK.");

        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }

    // --- CRUD BIASA ---

    public function showModal() {
        $this->reset(['kode_mk', 'kode_bk', 'selected_id']);
        $this->confirmingItemAddEdit = true;
    }

    public function edit($id) {
        $item = BkMk::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->kode_mk = $item->kode_mk;
        $this->kode_bk = $item->kode_bk;
        $this->confirmingItemAddEdit = true;
    }

    public function save() {
        $this->validate();
        BkMk::updateOrCreate(['id' => $this->selected_id], [
            'kode_mk' => $this->kode_mk,
            'kode_bk' => $this->kode_bk,
            'prodi'   => $this->prodi, // Simpan prodi saat input manual
        ]);
        $this->confirmingItemAddEdit = false;
        session()->flash('message', 'Pemetaan berhasil disimpan.');
    }

    public function confirmDelete($id) {
        $this->selected_id = $id;
        $this->confirmingItemDeletion = true;
    }

    public function delete() {
        BkMk::where('prodi', $this->prodi)->findOrFail($this->selected_id)->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Pemetaan berhasil dihapus.');
    }
}