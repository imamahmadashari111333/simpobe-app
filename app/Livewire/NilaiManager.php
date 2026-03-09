<?php

namespace App\Livewire;

use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use App\Models\PenilaianKomponen;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use OpenSpout\Reader\XLSX\Reader;

class NilaiManager extends Component
{
    use WithFileUploads, WithPagination;

    // Properti Form & Modal
    public $showModal = false;
    public $selected_id;
    public $nama_mhs_edit, $nim_edit, $mk_edit;
    
    // Properti Nilai untuk Diedit
    public $kehadiran, $tugas, $kuiz, $praktik, $uts, $uas, $nilai_akhir, $nilai_huruf;
    public $smt, $kode_mk, $tahun_akademik, $dosen1, $dosen2, $dosen3;

    // Properti File Import
    public $file_import;

    // Properti Filter
    public $search = '';
    public $filter_tahun = '';
    public $filter_dosen = '';

    /**
     * Fungsi untuk mendownload file template yang ada di public/templates/
     */
    public function exportTemplate()
    {
        $filePath = public_path('templates/Template Nilai OBE.xlsx');

        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_Nilai_OBE.xlsx');
        }

        session()->flash('error', 'File template tidak ditemukan di folder public/templates/');
    }

public function render()
{
    // Mengambil data Prodi, NIK, dan Role dari user yang login
    $prodiUser = Auth::user()->profil->prodi ?? null;
    $nikUser = Auth::user()->profil->nik ?? null;
    $isKaprodi = Auth::user()->role === 'Kaprodi';

    // 1. Query Utama: Filter wajib berdasarkan Prodi
    $query = PenilaianKomponen::with(['mahasiswa', 'mata_kuliah'])
        ->where('prodi', $prodiUser);

    // 2. Hak Akses: Jika BUKAN Kaprodi, batasi hanya data milik NIK-nya sendiri
    $query->when(!$isKaprodi, function($q) use ($nikUser) {
        $q->where('nik', $nikUser);
    });

    // 3. Logika Pencarian (Grouping) agar filter hak akses tidak bocor
    if (!empty($this->search)) {
        $query->where(function($q) {
            $searchTerm = '%' . $this->search . '%';
            $q->where('nim', 'like', $searchTerm)
              ->orWhereHas('mahasiswa', function($m) use ($searchTerm) {
                  $m->where('nama', 'like', $searchTerm);
              })
              ->orWhereHas('mata_kuliah', function($mk) use ($searchTerm) {
                  $mk->where('nama_mk', 'like', $searchTerm);
              });
        });
    }

    // 4. Filter Tambahan (Tahun Akademik & Dosen Koordinator)
    $query->when($this->filter_tahun, fn($q) => $q->where('tahun_akademik', $this->filter_tahun))
          ->when($this->filter_dosen, fn($q) => $q->where('dosen1', $this->filter_dosen));

    // 5. Eksekusi Pagination
    $data_nilai = $query->orderBy('tahun_akademik', 'desc')
                        ->orderBy('smt', 'asc')
                        ->paginate(20);

    return view('livewire.nilai-manager', [
        'data_nilai' => $data_nilai,
        'daftar_mk' => MataKuliah::where('prodi', $prodiUser)->get(),
        
        // List Tahun: Kaprodi melihat semua tahun di prodi, Dosen hanya melihat tahun yang mereka input
        'list_tahun' => PenilaianKomponen::where('prodi', $prodiUser)
                        ->when(!$isKaprodi, fn($q) => $q->where('nik', $nikUser))
                        ->distinct()
                        ->orderBy('tahun_akademik', 'desc')
                        ->pluck('tahun_akademik'),

        // List Dosen: Kaprodi melihat semua dosen di prodi, Dosen hanya melihat namanya sendiri
        'list_dosen_pernah_input' => PenilaianKomponen::where('prodi', $prodiUser)
                                    ->when(!$isKaprodi, fn($q) => $q->where('nik', $nikUser))
                                    ->distinct()
                                    ->whereNotNull('dosen1')
                                    ->where('dosen1', '!=', '')
                                    ->pluck('dosen1')
    ]);
}

// Tambahkan ini agar saat mengetik, pagination kembali ke halaman 1
public function updatingSearch()
{
    $this->resetPage();
}

    public function edit($id)
    {
        $prodiUser = Auth::user()->profil->prodi ?? null;
        $data = PenilaianKomponen::whereHas('mahasiswa', function($q) use ($prodiUser) {
                $q->where('prodi', $prodiUser);
            })->with('mahasiswa', 'mata_kuliah')->findOrFail($id);
        
        $this->selected_id     = $id;
        $this->nim_edit        = $data->nim;
        $this->nama_mhs_edit   = $data->mahasiswa->nama ?? '-';
        $this->mk_edit         = $data->mata_kuliah->nama_mk ?? '-';
        $this->kehadiran       = $data->kehadiran;
        $this->tugas           = $data->tugas;
        $this->kuiz            = $data->kuiz;
        $this->praktik         = $data->praktik;
        $this->uts             = $data->uts;
        $this->uas             = $data->uas;
        $this->nilai_akhir     = $data->nilai_akhir;
        $this->nilai_huruf     = $data->nilai_huruf;

        $this->showModal = true;
    }

    public function closeModal()
    {
        $this->showModal = false;
        $this->reset(['selected_id', 'nim_edit', 'nama_mhs_edit', 'kehadiran', 'tugas', 'kuiz', 'praktik', 'uts', 'uas']);
    }

    public function updateNilai()
    {
        $this->validate([
            'kehadiran' => 'required|numeric',
            'tugas' => 'required|numeric',
            'kuiz' => 'required|numeric',
            'uts' => 'required|numeric',
            'uas' => 'required|numeric',
        ]);

        $prodiUser = Auth::user()->profil->prodi ?? null;
        $data = PenilaianKomponen::whereHas('mahasiswa', function($q) use ($prodiUser) {
            $q->where('prodi', $prodiUser);
        })->find($this->selected_id);

        if ($data) {
            $data->update([
                'kehadiran' => $this->kehadiran,
                'tugas'     => $this->tugas,
                'kuiz'      => $this->kuiz,
                'praktik'   => $this->praktik,
                'uts'       => $this->uts,
                'uas'       => $this->uas,
                'nilai_akhir' => $this->nilai_akhir,
                'nilai_huruf' => $this->nilai_huruf,
            ]);
            session()->flash('message', 'Nilai berhasil diperbarui!');
        }
        $this->closeModal();
    }

public function importProses()
{
    $this->validate([
        'file_import' => 'required|mimes:xlsx,xls,csv|max:10240',
        'kode_mk' => 'required',
        'tahun_akademik' => 'required',
        'smt' => 'required',
    ]);

    // Mengambil NIK dan Prodi dari profil user yang login
    $nikUser = Auth::user()->profil->nik ?? null;
    $prodiUser = Auth::user()->profil->prodi ?? null;

    // Validasi tambahan jika NIK atau Prodi tidak ditemukan di profil
    if (!$nikUser || !$prodiUser) {
        session()->flash('error', 'Gagal: Data NIK atau Prodi Anda tidak ditemukan di profil. Silakan lengkapi profil terlebih dahulu.');
        return;
    }

    $reader = new Reader();
    $errors = []; 
    $successCount = 0;

    try {
        $reader->open($this->file_import->getRealPath());
        DB::beginTransaction();

        foreach ($reader->getSheetIterator() as $sheet) {
            foreach ($sheet->getRowIterator() as $index => $row) {
                if ($index === 1) continue; 

                $cells = $row->toArray();
                $nim = isset($cells[1]) ? trim((string)$cells[1]) : null;
                
                if (!$nim) continue;

                // Validasi NIM terhadap prodi user
                if (!Mahasiswa::where('nim', $nim)->where('prodi', $prodiUser)->exists()) {
                    $errors[] = "Baris $index: NIM $nim bukan dari prodi $prodiUser.";
                    continue;
                }

                PenilaianKomponen::updateOrCreate(
                    [
                        'nim' => $nim, 
                        'kode_mk' => $this->kode_mk, 
                        'tahun_akademik' => $this->tahun_akademik
                    ],
                    [
                        'smt' => $this->smt,
                        'user_id' => Auth::id(),
                        'nik' => $nikUser,
                        'prodi' => $prodiUser, // TAMBAHKAN INI AGAR PRODI TERSEDIA DI TABEL PENILAIAN
                        'kehadiran' => $cells[4] ?? 0,
                        'tugas' => $cells[5] ?? 0,
                        'kuiz' => $cells[6] ?? 0,
                        'praktik' => $cells[7] ?? 0,
                        'uts' => $cells[8] ?? 0,
                        'uas' => $cells[9] ?? 0,
                        'dosen1' => $this->dosen1,
                        'dosen2' => $this->dosen2 ?? '-',
                        'dosen3' => $this->dosen3 ?? '-',
                        'nilai_akhir' => $cells[10] ?? 0,
                        'nilai_huruf' => $cells[11] ?? '-',
                    ]
                );
                $successCount++;
            }
        }
        
        DB::commit();
        $this->reset(['file_import']);
        
        session()->flash('message', "Berhasil! $successCount data prodi $prodiUser diimport oleh NIK: $nikUser.");
        if (count($errors) > 0) session()->flash('error_list', $errors);

    } catch (\Exception $e) {
        if(DB::transactionLevel() > 0) DB::rollBack();
        session()->flash('error', 'Gagal: ' . $e->getMessage());
    } finally {
        $reader->close();
    }
}

    public function delete($id)
    {
        $prodiUser = Auth::user()->profil->prodi ?? null;
        $data = PenilaianKomponen::whereHas('mahasiswa', function($q) use ($prodiUser) {
            $q->where('prodi', $prodiUser);
        })->find($id);

        if ($data) {
            $data->delete();
            session()->flash('message', 'Data berhasil dihapus.');
        }
    }
}