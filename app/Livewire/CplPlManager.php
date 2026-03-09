<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\CplPl;
use App\Models\Cpl;
use App\Models\ProfilLulusan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;
use OpenSpout\Reader\XLSX\Reader;

class CplPlManager extends Component
{
    use WithFileUploads;

    public $cpl_pls, $kode_cpl, $kode_pl, $selected_id;
    public $confirmingItemDeletion = false;
    public $confirmingItemAddEdit = false;
    public $confirmingImport = false;
    public $file_import;
    public $search = '';
    public $prodi;

    protected $rules = [
        'kode_cpl' => 'required',
        'kode_pl' => 'required',
    ];

    public function mount()
    {
        $this->prodi = Auth::user()->profil->prodi ?? null;
    }

    public function render()
    {
        $this->cpl_pls = CplPl::with(['cpl', 'pl'])
            ->where('prodi', $this->prodi)
            ->when($this->search, function($query) {
                $query->where(function($q) {
                    $q->where('kode_cpl', 'like', '%' . $this->search . '%')
                      ->orWhere('kode_pl', 'like', '%' . $this->search . '%')
                      ->orWhereHas('cpl', function($sub) {
                          $sub->where('deskripsi_cpl', 'like', '%' . $this->search . '%');
                      })
                      ->orWhereHas('pl', function($sub) {
                          $sub->where('profesi', 'like', '%' . $this->search . '%');
                      });
                });
            })
            ->orderBy('kode_cpl')
            ->get();
        
        return view('livewire.cpl-pl-manager', [
            'list_cpl' => Cpl::where('prodi', $this->prodi)->orderBy('kode_cpl')->get(),
            'list_pl' => ProfilLulusan::where('prodi', $this->prodi)->orderBy('kode_pl')->get(),
        ]);
    }

    public function showModal()
    {
        abort_if(Auth::user()->role !== 'Kaprodi', 403);
        $this->reset(['kode_cpl', 'kode_pl', 'selected_id']);
        $this->confirmingItemAddEdit = true;
    }

    public function save()
    {
        abort_if(Auth::user()->role !== 'Kaprodi', 403);
        $this->validate();

        CplPl::updateOrCreate(['id' => $this->selected_id], [
            'kode_cpl' => $this->kode_cpl,
            'kode_pl' => $this->kode_pl,
            'prodi'   => $this->prodi, // Untuk input manual tetap pakai prodi user login
        ]);

        $this->confirmingItemAddEdit = false;
        session()->flash('message', 'Data relasi berhasil disimpan.');
    }

    public function edit($id)
    {
        abort_if(Auth::user()->role !== 'Kaprodi', 403);
        $item = CplPl::where('prodi', $this->prodi)->findOrFail($id);

        $this->selected_id = $id;
        $this->kode_cpl = $item->kode_cpl;
        $this->kode_pl = $item->kode_pl;
        $this->confirmingItemAddEdit = true;
    }

    public function confirmDelete($id)
    {
        abort_if(Auth::user()->role !== 'Kaprodi', 403);
        $this->selected_id = $id;
        $this->confirmingItemDeletion = true;
    }

    public function delete()
    {
        abort_if(Auth::user()->role !== 'Kaprodi', 403);
        CplPl::where('prodi', $this->prodi)->find($this->selected_id)->delete();
        $this->confirmingItemDeletion = false;
        session()->flash('message', 'Data relasi berhasil dihapus.');
    }

    public function showImportModal()
    {
        abort_if(Auth::user()->role !== 'Kaprodi', 403);
        $this->file_import = null;
        $this->confirmingImport = true;
    }

    public function downloadTemplate()
    {
        $filePath = public_path('templates/cpl_pl.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'cpl_pl.xlsx');
        }
        session()->flash('error', 'File template tidak ditemukan.');
    }

    public function importProses()
    {
        abort_if(Auth::user()->role !== 'Kaprodi', 403);
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
                    
                    // Mengambil data sesuai kolom di gambar: 
                    // id(0), kode_cpl(1), kode_pl(2), prodi(3)
                    $kode_cpl   = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $kode_pl    = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $prodi_file = isset($cells[3]) ? trim((string)$cells[3]) : null;

                    if ($kode_cpl && $kode_pl && $prodi_file) {
                        // Simpan ke database menggunakan nilai prodi dari file excel
                        CplPl::updateOrCreate(
                            [
                                'kode_cpl' => $kode_cpl, 
                                'kode_pl'  => $kode_pl,
                                'prodi'    => $prodi_file
                            ],
                            [
                                'prodi'    => $prodi_file
                            ]
                        );
                        $successCount++;
                    }
                }
            }
            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil mengimport $successCount data dari excel.");
        } catch (\Exception $e) {
            DB::rollBack();
            session()->flash('error', 'Gagal: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }
}