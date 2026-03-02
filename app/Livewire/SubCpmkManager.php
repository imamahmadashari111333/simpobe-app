<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\SubCpmk;
use App\Models\Cpmk;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class SubCpmkManager extends Component
{
    use WithFileUploads;

    public $kode_sub_cpmk, $uraian_sub_cpmk, $materi_pembelajaran, $selected_id;
    public $search = '';
    public $prodi;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $file_import;

    protected $rules = [
        'kode_sub_cpmk' => 'required|string|max:50',
        'uraian_sub_cpmk' => 'required|string',
        'materi_pembelajaran' => 'required|string',
    ];

    public function mount()
    {
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    public function render()
    {
        $sub_cpmks = SubCpmk::where('prodi', $this->prodi)
            ->when($this->search, function($query) {
                $query->where(function($q) {
                    $q->where('kode_sub_cpmk', 'like', '%' . $this->search . '%')
                      ->orWhere('uraian_sub_cpmk', 'like', '%' . $this->search . '%')
                      ->orWhere('materi_pembelajaran', 'like', '%' . $this->search . '%');
                });
            })
            ->orderBy('kode_sub_cpmk', 'asc')
            ->get();

        return view('livewire.sub-cpmk-manager', [
            'sub_cpmks' => $sub_cpmks
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
        $filePath = public_path('templates/sub_cpmk.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_Sub_CPMK.xlsx');
        }
        session()->flash('error', 'File template sub_cpmk.xlsx tidak ditemukan.');
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

                    // Mapping: 0:id, 1:kode_sub, 2:uraian, 3:materi, 4:prodi
                    $kode      = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $uraian    = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $materi    = isset($cells[3]) ? trim((string)$cells[3]) : null;
                    $prodiFile = isset($cells[4]) ? trim((string)$cells[4]) : null;

                    if (!$kode || !$prodiFile) continue;

                    SubCpmk::updateOrCreate(
                        ['kode_sub_cpmk' => $kode, 'prodi' => $prodiFile],
                        [
                            'uraian_sub_cpmk' => $uraian,
                            'materi_pembelajaran' => $materi
                        ]
                    );
                    $successCount++;
                }
            }
            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil mengimport $successCount data Sub-CPMK.");
        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }

    // --- CRUD ---

    public function showModal()
    {
        $this->resetInputFields();
        $this->confirmingItemAddEdit = true;
    }

    private function resetInputFields()
    {
        $this->kode_sub_cpmk = '';
        $this->uraian_sub_cpmk = '';
        $this->materi_pembelajaran = '';
        $this->selected_id = null;
    }

    public function save()
    {
        $this->validate();
        SubCpmk::updateOrCreate(['id' => $this->selected_id], [
            'kode_sub_cpmk' => $this->kode_sub_cpmk,
            'uraian_sub_cpmk' => $this->uraian_sub_cpmk,
            'materi_pembelajaran' => $this->materi_pembelajaran,
            'prodi' => $this->prodi,
        ]);

        $this->confirmingItemAddEdit = false;
        $this->resetInputFields();
        session()->flash('message', 'Data Sub-CPMK berhasil disimpan.');
    }

    public function edit($id)
    {
        $item = SubCpmk::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->kode_sub_cpmk = $item->kode_sub_cpmk;
        $this->uraian_sub_cpmk = $item->uraian_sub_cpmk;
        $this->materi_pembelajaran = $item->materi_pembelajaran;
        $this->confirmingItemAddEdit = true;
    }

    public function confirmDelete($id)
    {
        SubCpmk::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->confirmingItemDeletion = true;
    }

    public function delete()
    {
        SubCpmk::where('prodi', $this->prodi)->where('id', $this->selected_id)->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Data Sub-CPMK berhasil dihapus.');
    }
}