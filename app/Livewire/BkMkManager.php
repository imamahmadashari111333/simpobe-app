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
        /** * Mengambil prodi dari relasi profil dosen. 
         * Pastikan relasi 'profil' sudah ada di Model User.
         */
        $this->prodi = Auth::user()->profil->prodi ?? null;

        if (!$this->prodi) {
            session()->flash('error', 'Profil prodi tidak ditemukan. Silakan hubungi admin.');
        }
    }

    public function render()
{
    $query = BkMk::with([
            'mataKuliah' => function($q) {
                $q->where('prodi', $this->prodi);
            }, 
            'bahanKajian' => function($q) {
                $q->where('prodi', $this->prodi);
            }
        ])
        ->where('prodi', $this->prodi)
        // Pastikan record yang relasinya kosong (karena beda prodi) tidak ikut tampil
        ->whereHas('mataKuliah', function($q) {
            $q->where('prodi', $this->prodi);
        })
        ->whereHas('bahanKajian', function($q) {
            $q->where('prodi', $this->prodi);
        })
        ->when($this->search, function($q) {
            $q->where(function($sub) {
                $sub->where('kode_mk', 'like', '%' . $this->search . '%')
                    ->orWhere('kode_bk', 'like', '%' . $this->search . '%');
            });
        });

    return view('livewire.bk-mk-manager', [
        'bk_mks' => $query->get()->sortBy(function($item) {
            return $item->mataKuliah->smt ?? 0;
        })->groupBy('kode_mk'),
        
        'list_mk' => MataKuliah::where('prodi', $this->prodi)->orderBy('smt')->get(),
        'list_bk' => BahanKajian::where('prodi', $this->prodi)->orderBy('kode_bk')->get(),
    ]);
}

    public function showModal() {
        $this->reset(['kode_mk', 'kode_bk', 'selected_id']);
        $this->confirmingItemAddEdit = true;
    }

    public function edit($id) {
        // FindOrFail dengan filter prodi agar tidak bisa edit data prodi lain via URL/ID
        $item = BkMk::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->kode_mk = $item->kode_mk;
        $this->kode_bk = $item->kode_bk;
        $this->confirmingItemAddEdit = true;
    }

    public function save() {
        $this->validate();

        // Validasi Akhir: Pastikan MK dan BK yang dipilih memang milik prodi user
        $cekMk = MataKuliah::where('kode_mk', $this->kode_mk)->where('prodi', $this->prodi)->exists();
        $cekBk = BahanKajian::where('kode_bk', $this->kode_bk)->where('prodi', $this->prodi)->exists();

        if (!$cekMk || !$cekBk) {
            session()->flash('error', 'Mata Kuliah atau Bahan Kajian tidak valid untuk prodi Anda.');
            return;
        }
        
        BkMk::updateOrCreate(['id' => $this->selected_id], [
            'kode_mk' => $this->kode_mk,
            'kode_bk' => $this->kode_bk,
            'prodi'   => $this->prodi,
        ]);

        $this->confirmingItemAddEdit = false;
        session()->flash('message', 'Pemetaan berhasil disimpan.');
    }

    public function confirmDelete($id) {
        $this->selected_id = $id;
        $this->confirmingItemDeletion = true;
    }

    public function delete() {
        // Delete dengan filter prodi untuk keamanan
        BkMk::where('prodi', $this->prodi)->findOrFail($this->selected_id)->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Pemetaan berhasil dihapus.');
    }

    public function showImportModal()
    {
        $this->file_import = null;
        $this->confirmingImport = true;
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
                    $mkKode = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $bkKode = isset($cells[2]) ? trim((string)$cells[2]) : null;

                    if (!$mkKode || !$bkKode) continue;

                    // Validasi: Apakah MK dan BK ini milik prodi user yang sedang login?
                    $isValidMk = MataKuliah::where('kode_mk', $mkKode)->where('prodi', $this->prodi)->exists();
                    $isValidBk = BahanKajian::where('kode_bk', $bkKode)->where('prodi', $this->prodi)->exists();

                    if ($isValidMk && $isValidBk) {
                        BkMk::updateOrCreate(
                            [
                                'kode_mk' => $mkKode,
                                'kode_bk' => $bkKode,
                                'prodi'   => $this->prodi // Paksa pakai prodi dari session login
                            ],
                            ['prodi' => $this->prodi]
                        );
                        $successCount++;
                    }
                }
            }

            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil mengimport $successCount data yang sesuai dengan prodi Anda.");
        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }

    public function downloadTemplate()
    {
        $filePath = public_path('templates/bk_mk.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_BK_MK.xlsx');
        }
        session()->flash('error', 'File template tidak ditemukan.');
    }
}