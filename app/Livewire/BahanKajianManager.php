<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\BahanKajian;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class BahanKajianManager extends Component
{
    use WithFileUploads;

    public $bks, $selected_id, $kode_bk, $bahan_kajian, $deskripsi, $referensi, $knowledge_area;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $search = '';
    public $prodi;
    
    public $file_import;

    protected $rules = [
        'kode_bk' => 'required|string|max:10',
        'bahan_kajian' => 'required|string',
        'deskripsi' => 'required|string',
        'knowledge_area' => 'required|string',
        'referensi' => 'nullable|string',
    ];

    public function mount()
    {
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    public function render()
    {
        $this->bks = BahanKajian::where('prodi', $this->prodi)
            ->when($this->search, function($query) {
                $query->where(function($q) {
                    $q->where('kode_bk', 'like', '%' . $this->search . '%')
                      ->orWhere('bahan_kajian', 'like', '%' . $this->search . '%')
                      ->orWhere('knowledge_area', 'like', '%' . $this->search . '%')
                      ->orWhere('deskripsi', 'like', '%' . $this->search . '%');
                });
            })
            ->orderBy('kode_bk', 'asc')
            ->get();

        return view('livewire.bahan-kajian-manager');
    }

    public function downloadTemplate()
    {
        // 1. Nama template disesuaikan: bahan_kajian.xlsx
        $filePath = public_path('templates/bahan_kajian.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_Bahan_Kajian.xlsx');
        }
        session()->flash('error', 'File template tidak ditemukan di public/templates/bahan_kajian.xlsx');
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

                    /**
                     * Mapping Kolom sesuai instruksi:
                     * 0: id (DIABAIKAN)
                     * 1: kode_bk -> kode_bk
                     * 2: bahan_kajian -> bahan_kajian
                     * 3: deskripsi -> deskripsi
                     * 4: knowledge_area -> knowledge_area
                     * 5: referensi -> referensi
                     * 6: prodi -> prodi (DIAMBIL DARI EXCEL)
                     */
                    $kode      = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $nama      = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $desc      = isset($cells[3]) ? trim((string)$cells[3]) : null;
                    $area      = isset($cells[4]) ? trim((string)$cells[4]) : null;
                    $ref       = isset($cells[5]) ? trim((string)$cells[5]) : null;
                    $prodiFile = isset($cells[6]) ? trim((string)$cells[6]) : null;

                    // Lewati jika kolom inti kosong
                    if (!$kode || !$nama || !$prodiFile) continue;

                    // 2. Mengambil prodi dari Excel, bukan auth
                    // 3. Abaikan ID, gunakan updateOrCreate berdasarkan prodi + kode_bk
                    BahanKajian::updateOrCreate(
                        [
                            'prodi' => $prodiFile, 
                            'kode_bk' => $kode
                        ],
                        [
                            'bahan_kajian'   => $nama,
                            'deskripsi'      => $desc,
                            'knowledge_area' => $area,
                            'referensi'      => $ref,
                        ]
                    );
                    $successCount++;
                }
            }

            DB::commit();
            $this->confirmingImport = false;
            $this->reset(['file_import']);
            session()->flash('message', "Berhasil! $successCount data Bahan Kajian telah diimport.");

        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }

    public function showModal() { $this->resetInputFields(); $this->confirmingItemAddEdit = true; }

    private function resetInputFields()
    {
        $this->kode_bk = ''; $this->bahan_kajian = ''; $this->deskripsi = '';
        $this->referensi = ''; $this->knowledge_area = ''; $this->selected_id = null;
    }

    public function save()
    {
        $this->validate();
        BahanKajian::updateOrCreate(['id' => $this->selected_id], [
            'prodi' => $this->prodi,
            'kode_bk' => $this->kode_bk,
            'bahan_kajian' => $this->bahan_kajian,
            'deskripsi' => $this->deskripsi,
            'referensi' => $this->referensi,
            'knowledge_area' => $this->knowledge_area,
        ]);
        $this->confirmingItemAddEdit = false;
        session()->flash('message', 'Data berhasil disimpan.');
    }

    public function edit($id)
    {
        $item = BahanKajian::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->kode_bk = $item->kode_bk;
        $this->bahan_kajian = $item->bahan_kajian;
        $this->deskripsi = $item->deskripsi;
        $this->referensi = $item->referensi;
        $this->knowledge_area = $item->knowledge_area;
        $this->confirmingItemAddEdit = true;
    }

    public function confirmDelete($id) { $this->selected_id = $id; $this->confirmingItemDeletion = true; }

    public function delete()
    {
        BahanKajian::where('prodi', $this->prodi)->findOrFail($this->selected_id)->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Data berhasil dihapus.');
    }
}