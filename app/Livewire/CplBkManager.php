<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\CplBk;
use App\Models\BahanKajian;
use App\Models\Cpl;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class CplBkManager extends Component
{
    use WithFileUploads;

    public $kode_bk, $kode_cpl, $selected_id;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $search = '';
    public $prodi;
    public $file_import;

    protected $rules = [
        'kode_bk' => 'required',
        'kode_cpl' => 'required',
    ];

    public function mount()
{
    // Mengambil prodi dari session profil dosen yang login
    $this->prodi = Auth::user()->profil->prodi ?? null;

    if (!$this->prodi) {
        session()->flash('error', 'Data Prodi tidak ditemukan pada profil Anda.');
    }
}

public function render()
{
    $query = CplBk::with([
            'bahanKajian' => function($q) {
                $q->where('prodi', $this->prodi);
            },
            'cpl' => function($q) {
                $q->where('prodi', $this->prodi);
            }
        ])
        // 1. Filter tabel pivot utama
        ->where('prodi', $this->prodi)
        
        // 2. Keamanan: Hanya tampilkan jika relasinya memang ada di prodi tersebut
        ->whereHas('bahanKajian', function($q) {
            $q->where('prodi', $this->prodi);
        })
        ->whereHas('cpl', function($q) {
            $q->where('prodi', $this->prodi);
        })
        
        // 3. Fitur Pencarian
        ->when($this->search, function($q) {
            $q->where(function($sub) {
                $sub->where('kode_bk', 'like', '%' . $this->search . '%')
                    ->orWhere('kode_cpl', 'like', '%' . $this->search . '%')
                    ->orWhereHas('bahanKajian', function($bk) {
                        $bk->where('bahan_kajian', 'like', '%' . $this->search . '%');
                    })
                    ->orWhereHas('cpl', function($cpl) {
                        $cpl->where('deskripsi_cpl', 'like', '%' . $this->search . '%');
                    });
            });
        });

    return view('livewire.cpl-bk-manager', [
        'cpl_bks' => $query->get()->groupBy('kode_bk'),
        
        // Dropdown List (Sudah Terfilter Prodi)
        'list_bk' => BahanKajian::where('prodi', $this->prodi)
            ->orderBy('kode_bk')
            ->get(),
            
        'list_cpl' => Cpl::where('prodi', $this->prodi)
            ->orderBy('kode_cpl')
            ->get(),
    ]);
}

    public function downloadTemplate()
    {
        $filePath = public_path('templates/cpl_bk.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_CPL_BK.xlsx');
        }
        session()->flash('error', 'File template tidak ditemukan.');
    }

    public function showImportModal()
    {
        $this->file_import = null;
        $this->confirmingImport = true;
    }

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

                    // Kolom A: id (0), B: kode_bk (1), C: kode_cpl (2), D: prodi (3)
                    $bkKode    = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $cplKode   = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $prodiFile = isset($cells[3]) ? trim((string)$cells[3]) : null;

                    if (!$bkKode || !$cplKode || !$prodiFile) continue;

                    // PERBAIKAN: Masukkan prodi ke dalam array data yang disimpan
                    CplBk::updateOrCreate(
                        [
                            'kode_bk'  => $bkKode,
                            'kode_cpl' => $cplKode,
                            'prodi'    => $prodiFile // Masukkan ke sini agar unik per prodi
                        ],
                        [
                            'prodi'    => $prodiFile // Pastikan ini ada agar tidak NULL
                        ]
                    );
                    $successCount++;
                }
            }

            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil mengimport $successCount data pemetaan.");

        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }

    public function showModal() { $this->reset(['kode_bk', 'kode_cpl', 'selected_id']); $this->confirmingItemAddEdit = true; }

    public function save()
    {
        $this->validate();
        CplBk::updateOrCreate(['id' => $this->selected_id], [
            'kode_bk' => $this->kode_bk,
            'kode_cpl' => $this->kode_cpl,
            'prodi' => $this->prodi, // Simpan prodi saat input manual
        ]);
        $this->confirmingItemAddEdit = false;
        session()->flash('message', 'Data berhasil disimpan.');
    }

    public function edit($id)
    {
        $item = CplBk::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->kode_bk = $item->kode_bk;
        $this->kode_cpl = $item->kode_cpl;
        $this->confirmingItemAddEdit = true;
    }

    public function confirmDelete($id) { $this->selected_id = $id; $this->confirmingItemDeletion = true; }

    public function delete()
    {
        CplBk::where('prodi', $this->prodi)->findOrFail($this->selected_id)->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Data berhasil dihapus.');
    }
}