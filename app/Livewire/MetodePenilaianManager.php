<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\MetodePenilaian;
use App\Models\MataKuliah;
use App\Models\Cpmk;
use App\Models\SubCpmk;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class MetodePenilaianManager extends Component
{
    use WithFileUploads;

    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $confirmingItemDeletion = false;
    public $file_import;
    
    public $penilaians, $selected_id;
    public $kode_mk, $kode_cpmk, $kode_sub_cpmk;
    public $mbkm = 0, $kehadiran = 0, $tugas = 0, $quiz = 0, $uts = 0, $uas = 0, $praktik = 0;
    public $search = '';
    public $prodi;

    protected $rules = [
        'kode_mk' => 'required',
        'kode_cpmk' => 'required',
        'kode_sub_cpmk' => 'required',
        'mbkm' => 'nullable|numeric|min:0|max:100',
        'kehadiran' => 'nullable|numeric|min:0|max:100',
        'tugas' => 'nullable|numeric|min:0|max:100',
        'quiz' => 'nullable|numeric|min:0|max:100',
        'uts' => 'nullable|numeric|min:0|max:100',
        'uas' => 'nullable|numeric|min:0|max:100',
        'praktik' => 'nullable|numeric|min:0|max:100',
    ];

    public function mount()
    {
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    public function render()
    {
        $this->penilaians = MetodePenilaian::with(['mataKuliah'])
            ->where('prodi', $this->prodi)
            ->when($this->search, function($query) {
                $query->whereHas('mataKuliah', function($q) {
                    $q->where(function($subQ) {
                        $subQ->where('nama_mk', 'like', '%' . $this->search . '%')
                             ->orWhere('kode_mk', 'like', '%' . $this->search . '%');
                    });
                });
            })
            ->orderBy('kode_mk')
            ->get();

        return view('livewire.metode-penilaian-manager', [
            'list_mk' => MataKuliah::where('prodi', $this->prodi)->get(),
            'list_cpmk' => Cpmk::where('prodi', $this->prodi)->get(),
            'list_sub_cpmk' => SubCpmk::where('prodi', $this->prodi)->get(),
        ]);
    }

    // --- FITUR SAVE / UPDATE ---

    public function save()
    {
        $this->validate();

        $toZero = function($value) {
            return (is_null($value) || $value === '') ? 0 : $value;
        };

        MetodePenilaian::updateOrCreate(['id' => $this->selected_id], [
            'kode_mk' => $this->kode_mk,
            'kode_cpmk' => $this->kode_cpmk,
            'kode_sub_cpmk' => $this->kode_sub_cpmk,
            'mbkm' => $toZero($this->mbkm),
            'kehadiran' => $toZero($this->kehadiran),
            'tugas' => $toZero($this->tugas),
            'quiz' => $toZero($this->quiz),
            'uts' => $toZero($this->uts),
            'uas' => $toZero($this->uas),
            'praktik' => $toZero($this->praktik),
            'prodi' => $this->prodi,
        ]);

        $this->confirmingItemAddEdit = false;
        $this->resetInputFields();
        session()->flash('message', 'Data bobot berhasil disimpan.');
    }

    // --- FITUR IMPORT ---

    /**
     * Memunculkan Modal Import
     * Fungsi ini yang tadinya hilang sehingga menyebabkan eror
     */
    public function showImportModal()
    {
        $this->reset('file_import'); // Reset file input sebelumnya
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

            $toZero = function($val) {
                $clean = trim((string)$val);
                return ($clean === '' || !is_numeric($clean)) ? 0 : $clean;
            };

            foreach ($reader->getSheetIterator() as $sheet) {
                foreach ($sheet->getRowIterator() as $index => $row) {
                    if ($index === 1) continue; 
                    $cells = $row->toArray();

                    $mk    = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $cpmk  = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $sub   = isset($cells[3]) ? trim((string)$cells[3]) : null;
                    $f_prodi = isset($cells[11]) ? trim((string)$cells[11]) : $this->prodi;

                    if ($mk && $sub) {
                        MetodePenilaian::updateOrCreate(
                            ['kode_mk' => $mk, 'kode_cpmk' => $cpmk, 'kode_sub_cpmk' => $sub, 'prodi' => $f_prodi],
                            [
                                'mbkm'      => $toZero($cells[4] ?? 0),
                                'kehadiran' => $toZero($cells[5] ?? 0),
                                'tugas'     => $toZero($cells[6] ?? 0),
                                'quiz'      => $toZero($cells[7] ?? 0),
                                'uts'       => $toZero($cells[8] ?? 0),
                                'uas'       => $toZero($cells[9] ?? 0),
                                'praktik'   => $toZero($cells[10] ?? 0),
                            ]
                        );
                        $successCount++;
                    }
                }
            }
            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil mengimport $successCount data.");
        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }

    public function downloadTemplate()
    {
        $filePath = public_path('templates/metode_penilaian.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_Metode_Penilaian.xlsx');
        }
        session()->flash('error', 'File template tidak ditemukan di folder public/templates/.');
    }

    // --- HELPER LAINNYA ---

    public function showModal()
    {
        $this->resetInputFields();
        $this->confirmingItemAddEdit = true;
    }

    private function resetInputFields()
    {
        $this->kode_mk = ''; $this->kode_cpmk = ''; $this->kode_sub_cpmk = '';
        $this->mbkm = 0; $this->kehadiran = 0; $this->tugas = 0; 
        $this->quiz = 0; $this->uts = 0; $this->uas = 0; $this->praktik = 0;
        $this->selected_id = null;
    }

    public function edit($id)
    {
        $item = MetodePenilaian::where('prodi', $this->prodi)->findOrFail($id);
        $this->selected_id = $id;
        $this->kode_mk = $item->kode_mk;
        $this->kode_cpmk = $item->kode_cpmk;
        $this->kode_sub_cpmk = $item->kode_sub_cpmk;
        $this->mbkm = $item->mbkm;
        $this->kehadiran = $item->kehadiran;
        $this->tugas = $item->tugas;
        $this->quiz = $item->quiz;
        $this->uts = $item->uts;
        $this->uas = $item->uas;
        $this->praktik = $item->praktik;
        $this->confirmingItemAddEdit = true;
    }

    public function confirmDelete($id)
    {
        $this->selected_id = $id;
        $this->confirmingItemDeletion = true;
    }

    public function delete()
    {
        MetodePenilaian::where('prodi', $this->prodi)->find($this->selected_id)?->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Data berhasil dihapus.');
    }
}