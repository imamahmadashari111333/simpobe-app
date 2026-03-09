<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\MataKuliah;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class MataKuliahManager extends Component
{
    use WithFileUploads;

    public $mata_kuliahs, $kode_mk, $nama_mk, $sks, $smt, $sks_teori, $sks_praktik, $selected_id;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $search = '';
    public $prodi;
    public $file_import;

    protected $rules = [
        'kode_mk' => 'required|string|max:20',
        'nama_mk' => 'required|string|max:255',
        'sks' => 'required|numeric|min:1',
        'smt' => 'required|numeric|min:1|max:8',
        'sks_teori' => 'nullable|numeric',
        'sks_praktik' => 'nullable|numeric',
    ];

    public function mount()
    {
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    public function render()
    {
        $this->mata_kuliahs = MataKuliah::where('prodi', $this->prodi)
            ->when($this->search, function($query) {
                $query->where(function($q) {
                    $q->where('kode_mk', 'like', '%' . $this->search . '%')
                      ->orWhere('nama_mk', 'like', '%' . $this->search . '%')
                      ->orWhere('smt', 'like', '%' . $this->search . '%');
                });
            })
            ->orderBy('smt', 'asc')
            ->orderBy('kode_mk', 'asc')
            ->get();
                                        
        return view('livewire.mata-kuliah-manager');
    }

    // --- FITUR IMPORT ---

    public function showImportModal()
    {
        $this->file_import = null;
        $this->confirmingImport = true;
    }

    public function downloadTemplate()
    {
        $filePath = public_path('templates/mata_kuliah.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_Mata_Kuliah.xlsx');
        }
        session()->flash('error', 'File template mata_kuliah.xlsx tidak ditemukan.');
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
                     * Mapping Kolom:
                     * 0: id (ABAIAKAN)
                     * 1: kode_mk
                     * 2: nama_mk
                     * 3: sks
                     * 4: sks_teori
                     * 5: sks_praktik
                     * 6: smt
                     * 7: prodi (AMBIL DARI EXCEL)
                     */
                    $kode      = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $nama      = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $sksTotal  = isset($cells[3]) ? (int)$cells[3] : 0;
                    $teori     = isset($cells[4]) ? (int)$cells[4] : 0;
                    $praktik   = isset($cells[5]) ? (int)$cells[5] : 0;
                    $smt       = isset($cells[6]) ? (int)$cells[6] : 1;
                    $prodiFile = isset($cells[7]) ? trim((string)$cells[7]) : null;

                    if (!$kode || !$nama || !$prodiFile) continue;

                    MataKuliah::updateOrCreate(
                        [
                            'prodi' => $prodiFile,
                            'kode_mk' => $kode
                        ],
                        [
                            'nama_mk'     => $nama,
                            'sks'         => $sksTotal,
                            'sks_teori'   => $teori,
                            'sks_praktik' => $praktik,
                            'smt'         => $smt,
                            'prodi'       => $prodiFile // Pastikan prodi disimpan ke database
                        ]
                    );
                    $successCount++;
                }
            }

            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil! $successCount data Mata Kuliah diproses.");

        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }

    // --- CRUD BIASA ---

    public function showModal() { $this->resetInputFields(); $this->confirmingItemAddEdit = true; }

    private function resetInputFields()
    {
        $this->kode_mk = ''; $this->nama_mk = ''; $this->sks = ''; $this->smt = '';
        $this->sks_teori = 0; $this->sks_praktik = 0; $this->selected_id = null;
    }

    public function save()
    {
        $this->validate();
        MataKuliah::updateOrCreate(['id' => $this->selected_id], [
            'prodi' => $this->prodi,
            'kode_mk' => $this->kode_mk,
            'nama_mk' => $this->nama_mk,
            'sks' => $this->sks,
            'smt' => $this->smt,
            'sks_teori' => $this->sks_teori ?? 0,
            'sks_praktik' => $this->sks_praktik ?? 0,
        ]);
        $this->confirmingItemAddEdit = false;
        session()->flash('message', 'Data berhasil disimpan.');
    }

    public function edit($id)
    {
        $item = MataKuliah::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->kode_mk = $item->kode_mk;
        $this->nama_mk = $item->nama_mk;
        $this->sks = $item->sks;
        $this->smt = $item->smt;
        $this->sks_teori = $item->sks_teori;
        $this->sks_praktik = $item->sks_praktik;
        $this->confirmingItemAddEdit = true;
    }

    public function confirmDelete($id) { $this->selected_id = $id; $this->confirmingItemDeletion = true; }

    public function delete()
    {
        MataKuliah::where('prodi', $this->prodi)->findOrFail($this->selected_id)->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Data berhasil dihapus.');
    }
}