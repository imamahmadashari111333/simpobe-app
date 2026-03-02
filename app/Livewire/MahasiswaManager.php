<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Mahasiswa;
use App\Models\Prodi;
use Livewire\WithPagination;
use Livewire\WithFileUploads;
use Illuminate\Support\Facades\DB;
use OpenSpout\Reader\XLSX\Reader;

class MahasiswaManager extends Component
{
    use WithPagination, WithFileUploads;

    public $search = '';
    public $confirmingMahasiswaDeletion = false;
    public $confirmingMahasiswaAddition = false;
    public $confirmingImport = false;
    public $file_import;
    
    // Properti Form
    public $mahasiswaId;
    public $nim, $nama, $angkatan, $prodi, $kelas;

    protected $rules = [
        'nim' => 'required|string',
        'nama' => 'required|string|max:255',
        'angkatan' => 'required|string|max:4',
        'prodi' => 'required|string',
        'kelas' => 'nullable|string|max:50', // Tambahkan rule untuk kelas
    ];

    public function render()
    {
        $list_prodi = Prodi::orderBy('nama_prodi')->get();

        return view('livewire.mahasiswa-manager', [
            'mahasiswas' => Mahasiswa::where(function($query) {
                    $query->where('nama', 'like', '%'.$this->search.'%')
                          ->orWhere('nim', 'like', '%'.$this->search.'%');
                })
                ->orderBy('angkatan', 'desc')
                ->paginate(10),
            'list_prodi' => $list_prodi
        ]);
    }

    public function confirmMahasiswaAddition()
    {
        $this->reset(['nim', 'nama', 'angkatan', 'prodi', 'kelas', 'mahasiswaId']);
        $this->confirmingMahasiswaAddition = true;
    }

    public function editMahasiswa(Mahasiswa $mahasiswa)
    {
        $this->mahasiswaId = $mahasiswa->id;
        $this->nim = $mahasiswa->nim;
        $this->nama = $mahasiswa->nama;
        $this->angkatan = $mahasiswa->angkatan;
        $this->prodi = $mahasiswa->prodi;
        $this->kelas = $mahasiswa->kelas; // Ambil data kelas
        $this->confirmingMahasiswaAddition = true;
    }

    public function saveMahasiswa()
    {
        $rules = $this->rules;
        $rules['nim'] = 'required|string|unique:mahasiswas,nim,' . $this->mahasiswaId;
        $this->validate($rules);

        Mahasiswa::updateOrCreate(['id' => $this->mahasiswaId], [
            'nim' => $this->nim,
            'nama' => $this->nama,
            'angkatan' => $this->angkatan,
            'prodi' => $this->prodi,
            'kelas' => $this->kelas, // Pastikan tersimpan di sini
        ]);

        $this->confirmingMahasiswaAddition = false;
        session()->flash('message', 'Data Mahasiswa berhasil disimpan.');
    }

    public function confirmMahasiswaDeletion($id)
    {
        $this->mahasiswaId = $id;
        $this->confirmingMahasiswaDeletion = true;
    }

    public function deleteMahasiswa()
    {
        Mahasiswa::find($this->mahasiswaId)->delete();
        $this->confirmingMahasiswaDeletion = false;
        session()->flash('message', 'Mahasiswa berhasil dihapus.');
    }

    // --- FITUR IMPORT & TEMPLATE ---

    public function showImportModal()
    {
        $this->confirmingImport = true;
    }

    public function downloadTemplate()
    {
        $filePath = public_path('templates/template_mahasiswa.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_Mahasiswa.xlsx');
        }
        session()->flash('error', 'File template tidak ditemukan.');
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
                    
                    $nim      = isset($cells[1]) ? trim((string)$cells[1]) : null;
                    $nama     = isset($cells[2]) ? trim((string)$cells[2]) : null;
                    $angkatan = isset($cells[3]) ? trim((string)$cells[3]) : null;
                    $prodi    = isset($cells[4]) ? trim((string)$cells[4]) : null;
                    $kelas    = isset($cells[5]) ? trim((string)$cells[5]) : null; // Mapping kolom ke-6 (F)

                    if ($nim && $nama) {
                        Mahasiswa::updateOrCreate(
                            ['nim' => $nim],
                            [
                                'nama'     => $nama,
                                'angkatan' => $angkatan,
                                'prodi'    => $prodi,
                                'kelas'    => $kelas, // Simpan kelas dari Excel
                            ]
                        );
                        $successCount++;
                    }
                }
            }
            DB::commit();
            $this->confirmingImport = false;
            session()->flash('message', "Berhasil mengimport $successCount data mahasiswa.");
        } catch (\Exception $e) {
            if(DB::transactionLevel() > 0) DB::rollBack();
            session()->flash('error', 'Gagal Import: ' . $e->getMessage());
        } finally {
            $reader->close();
        }
    }
}