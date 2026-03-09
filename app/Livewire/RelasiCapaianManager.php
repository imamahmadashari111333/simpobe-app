<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\RelasiCapaian;
use App\Models\MataKuliah;
use App\Models\Cpl;
use App\Models\Cpmk;
use App\Models\SubCpmk;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class RelasiCapaianManager extends Component
{
    use WithFileUploads;

    public $relasis, $kode_mk, $kode_cpl, $kode_cpmk, $kode_sub_cpmk, $selected_id;
    public $search = ''; 
    public $searchMK = ''; 
    public $prodi;
    
    // Preview & Inline Properties
    public $desc_cpl = '', $desc_cpmk = '', $desc_sub = '';
    public $is_creating_cpmk = false;
    public $is_creating_sub = false;
    public $new_deskripsi_cpmk = '';
    public $new_uraian_sub = '';
    public $new_materi_pembelajaran = '';

    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    
    // Import Properties
    public $confirmingImport = false;
    public $file_import;

    protected $rules = [
        'kode_mk' => 'required',
        'kode_cpl' => 'required',
        'kode_cpmk' => 'required',
        'kode_sub_cpmk' => 'required',
    ];

    public function mount()
    {
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    // --- LOGIKA IMPORT ---
    public function showImportModal()
    {
        $this->file_import = null;
        $this->confirmingImport = true;
    }

    public function downloadTemplate()
    {
        $filePath = public_path('templates/relasi_capaian.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_Relasi_Capaian.xlsx');
        }
        session()->flash('error', 'Template tidak ditemukan.');
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
                // Lewati baris pertama (header)
                if ($index === 1) continue; 
                
                $cells = $row->toArray();

                /** * SESUAIKAN DENGAN GAMBAR EXCEL (image_4570db.png):
                 * Index 0: id
                 * Index 1: kode_mk
                 * Index 2: kode_cpl
                 * Index 3: kode_cpmk
                 * Index 4: kode_sub_cpmk
                 * Index 5: prodi
                 */
                $mk    = isset($cells[1]) ? trim((string)$cells[1]) : null;
                $cpl   = isset($cells[2]) ? trim((string)$cells[2]) : null;
                $cpmk  = isset($cells[3]) ? trim((string)$cells[3]) : null;
                $sub   = isset($cells[4]) ? trim((string)$cells[4]) : null;
                // Ambil prodi dari excel atau gunakan prodi user login jika di excel kosong
                $prodi = isset($cells[5]) ? trim((string)$cells[5]) : $this->prodi;

                // Validasi data minimal harus ada MK dan Sub-CPMK
                if ($mk && $sub) {
                    RelasiCapaian::updateOrCreate(
                        [
                            'kode_mk'       => $mk,
                            'kode_cpl'      => $cpl,
                            'kode_cpmk'     => $cpmk,
                            'kode_sub_cpmk' => $sub,
                        ],
                        [
                            // Tambahkan prodi agar tidak NULL di database
                            'prodi' => $prodi 
                        ]
                    );
                    $successCount++;
                }
            }
        }
        DB::commit();
        $this->confirmingImport = false;
        session()->flash('message', "Berhasil mengimport $successCount relasi capaian ke prodi $prodi.");
    } catch (\Exception $e) {
        DB::rollBack();
        session()->flash('error', 'Gagal Import: ' . $e->getMessage());
    } finally {
        $reader->close();
    }
}

    // --- LOGIKA EXISTING ---

    public function updatedKodeCpl($value)
    {
        $this->desc_cpl = Cpl::where('kode_cpl', $value)->where('prodi', $this->prodi)->first()->deskripsi_cpl ?? '';
        $this->kode_cpmk = ''; 
        $this->desc_cpmk = '';
    }

    public function updatedKodeCpmk($value)
    {
        $this->desc_cpmk = Cpmk::where('kode_cpmk', $value)->where('prodi', $this->prodi)->first()->deskripsi_cpmk ?? '';
        $this->kode_sub_cpmk = ''; 
        $this->desc_sub = '';
    }

    public function updatedKodeSubCpmk($value)
    {
        $this->desc_sub = SubCpmk::where('kode_sub_cpmk', $value)->where('prodi', $this->prodi)->first()->uraian_sub_cpmk ?? '';
    }

    public function render()
    {
        $list_mk = [];
        if (strlen($this->searchMK) > 0) {
            $list_mk = MataKuliah::where('prodi', $this->prodi)
                ->where(function($query) {
                    $query->where('kode_mk', 'like', '%' . $this->searchMK . '%')
                          ->orWhere('nama_mk', 'like', '%' . $this->searchMK . '%');
                })->take(5)->get();
        }

        $cplNumber = preg_replace('/[^0-9]/', '', $this->kode_cpl);
        $filtered_cpmk = $this->kode_cpl 
            ? Cpmk::where('prodi', $this->prodi)->where('kode_cpmk', 'like', '%' . $cplNumber . '%')->get() 
            : collect();

        $cpmkNumber = preg_replace('/[^0-9]/', '', $this->kode_cpmk);
        $filtered_sub_cpmk = $this->kode_cpmk 
            ? SubCpmk::where('prodi', $this->prodi)->where('kode_sub_cpmk', 'like', '%' . $cpmkNumber . '%')->get() 
            : collect();

        $this->relasis = RelasiCapaian::with(['mataKuliah', 'cpl', 'cpmk', 'subCpmk'])
            ->whereHas('mataKuliah', function($q) {
                $q->where('prodi', $this->prodi);
            })
            ->where(function($query) {
                $query->where('kode_mk', 'like', '%' . $this->search . '%')
                      ->orWhereHas('mataKuliah', function($q) {
                          $q->where('nama_mk', 'like', '%' . $this->search . '%');
                      });
            })
            ->orderBy('kode_mk')->orderBy('kode_cpl')->orderBy('kode_cpmk')->get();

        return view('livewire.relasi-capaian-manager', [
            'list_mk' => $list_mk,
            'list_cpl' => Cpl::where('prodi', $this->prodi)->get(),
            'list_cpmk' => $filtered_cpmk,
            'list_sub_cpmk' => $filtered_sub_cpmk,
        ]);
    }

    public function selectMK($kode, $nama)
    {
        $this->kode_mk = $kode;
        $this->searchMK = $kode . ' - ' . $nama;
    }

    public function toggleCreateCpmk()
    {
        $this->is_creating_cpmk = !$this->is_creating_cpmk;
        if($this->is_creating_cpmk && $this->kode_cpl) {
            $cplNumber = preg_replace('/[^0-9]/', '', $this->kode_cpl);
            $this->kode_cpmk = "CPMK" . $cplNumber;
        }
    }

    public function toggleCreateSub()
    {
        $this->is_creating_sub = !$this->is_creating_sub;
        if($this->is_creating_sub && $this->kode_cpmk) {
            $cpmkNumber = preg_replace('/[^0-9]/', '', $this->kode_cpmk);
            $this->kode_sub_cpmk = "Sub-CPMK" . $cpmkNumber;
        }
    }

    public function showModal()
    {
        $this->reset(['kode_mk', 'searchMK', 'kode_cpl', 'kode_cpmk', 'kode_sub_cpmk', 'selected_id', 
                     'is_creating_cpmk', 'is_creating_sub', 'desc_cpl', 'desc_cpmk', 'desc_sub',
                     'new_deskripsi_cpmk', 'new_uraian_sub', 'new_materi_pembelajaran']);
        $this->confirmingItemAddEdit = true;
    }

    public function save()
    {
        $this->validate();

        if($this->is_creating_cpmk) {
            Cpmk::updateOrCreate(
                ['kode_cpmk' => $this->kode_cpmk, 'prodi' => $this->prodi], 
                ['deskripsi_cpmk' => $this->new_deskripsi_cpmk]
            );
        }

        if($this->is_creating_sub) {
            SubCpmk::updateOrCreate(
                ['kode_sub_cpmk' => $this->kode_sub_cpmk, 'prodi' => $this->prodi], 
                [
                    'uraian_sub_cpmk' => $this->new_uraian_sub,
                    'materi_pembelajaran' => $this->new_materi_pembelajaran ?: null
                ]
            );
        }

        RelasiCapaian::updateOrCreate(['id' => $this->selected_id], [
            'kode_mk' => $this->kode_mk,
            'kode_cpl' => $this->kode_cpl,
            'kode_cpmk' => $this->kode_cpmk,
            'kode_sub_cpmk' => $this->kode_sub_cpmk,
        ]);

        $this->confirmingItemAddEdit = false;
        session()->flash('message', 'Relasi berhasil disimpan.');
    }

    public function confirmDelete($id)
    {
        $exists = RelasiCapaian::where('id', $id)
            ->whereHas('mataKuliah', function($q) { $q->where('prodi', $this->prodi); })
            ->exists();

        if($exists) {
            $this->selected_id = $id;
            $this->confirmingItemDeletion = true;
        }
    }

    public function delete()
    {
        if ($this->selected_id) {
            RelasiCapaian::find($this->selected_id)->delete();
        }
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Relasi berhasil dihapus.');
    }
}