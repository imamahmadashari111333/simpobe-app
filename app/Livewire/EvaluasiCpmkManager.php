<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use App\Models\RelasiCapaian;
use App\Models\MetodePenilaian;
use App\Models\Portofolio;
use App\Models\PortofolioDetail;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\Url;

class EvaluasiCpmkManager extends Component
{
    #[Url] 
    public $angkatan;
    
    #[Url]
    public $kode_mk;

    // Data Utama
    public $list_cpmk;
    public $metadata = [];
    public $prodi_login; 
    
    // Properti Portofolio (UI)
    public $confirmingPortofolio = false;
    public $hasPortofolio = false;
    
    // Input Portofolio (Main)
    public $link_rps;
    public $lik_jurnal_pengajaran;
    public $link_presensi_kehadiran_mahasiswa;
    public $link_bahan_ajar;
    public $link_analisis_soal;
    public $link_sampel_pekerjaan_mahasiswa;
    public $link_nilai_panjang;

    // Integrasi & Checkbox Logic
    public $has_penelitian = false;
    public $has_pengabmas = false;
    public $integrasi_penelitian;
    public $integrasi_pengabmas;
    
    // Input Portofolio (Detail per CPMK)
    public $cpmk_inputs = []; 

    public function mount()
    {
        $this->list_cpmk = collect();
        $this->prodi_login = Auth::user()->profil->prodi ?? null;

        if ($this->kode_mk && $this->angkatan) {
            $this->loadData();
        }
    }

    public function cari()
    {
        if ($this->angkatan && $this->kode_mk) {
            return redirect()->to(route('penilaian.evaluasi_cpmk_hasil', [
                'angkatan' => $this->angkatan,
                'kode_mk' => $this->kode_mk
            ]));
        }
    }

    public function loadData()
    {
        $prodiUser = $this->prodi_login;

        $mk_check = MataKuliah::where('kode_mk', $this->kode_mk)
                    ->where('prodi', $prodiUser)
                    ->first();

        if (!$mk_check) {
            $this->metadata = [
                'semester' => '-',
                'tahun_akademik' => '-',
                'mata_kuliah' => 'Mata Kuliah Tidak Ditemukan di Prodi Anda',
                'dosen_koordinator' => '-',
            ];
            return;
        }

        $info = DB::table('penilaian_komponens')
                    ->where('kode_mk', $this->kode_mk)
                    ->whereExists(function ($query) {
                        $query->select(DB::raw(1))
                              ->from('mahasiswas')
                              ->whereColumn('mahasiswas.nim', 'penilaian_komponens.nim')
                              ->where('mahasiswas.angkatan', $this->angkatan);
                    })
                    ->first();

        $this->metadata = [
            'semester' => $info->semester ?? $info->smt ?? '-', 
            'tahun_akademik' => $info->tahun_akademik ?? $info->thn_akademik ?? '-',
            'mata_kuliah' => $mk_check->nama_mk,
            'dosen_koordinator' => $info->dosen1 ?? '-',
            'dosen_anggota' => $info->dosen2 ?? '-',
            'dosen_anggota2' => $info->dosen3 ?? null,
        ];

        $this->list_cpmk = RelasiCapaian::where('kode_mk', $this->kode_mk)->orderBy('kode_cpl', 'asc')
    ->orderBy('kode_cpmk', 'asc')
    ->get();

        $portofolio = Portofolio::with('details')
            ->where('kode_mk', $this->kode_mk)
            ->where('angkatan', $this->angkatan)
            ->first();

        if ($portofolio) {
            $this->hasPortofolio = true;
            $this->link_rps = $portofolio->link_rps;
            $this->lik_jurnal_pengajaran = $portofolio->lik_jurnal_pengajaran;
            
            // Load Integrasi & Set Checkbox
            $this->integrasi_penelitian = $portofolio->integrasi_penelitian;
            $this->has_penelitian = !empty($portofolio->integrasi_penelitian);
            
            $this->integrasi_pengabmas = $portofolio->integrasi_pengabmas;
            $this->has_pengabmas = !empty($portofolio->integrasi_pengabmas);

            $this->link_presensi_kehadiran_mahasiswa = $portofolio->link_presensi_kehadiran_mahasiswa;
            $this->link_bahan_ajar = $portofolio->link_bahan_ajar;
            $this->link_analisis_soal = $portofolio->link_analisis_soal;
            $this->link_sampel_pekerjaan_mahasiswa = $portofolio->link_sampel_pekerjaan_mahasiswa;
            $this->link_nilai_panjang = $portofolio->link_nilai_panjang;

            foreach ($portofolio->details as $detail) {
                $this->cpmk_inputs[$detail->kode_cpmk] = [
                    'refleksi' => $detail->refleksi_analisis,
                    'perbaikan' => $detail->program_perbaikan,
                ];
            }
        } else {
            $this->hasPortofolio = false;
            $this->resetPortofolioForm();
        }
    }

    public function resetPortofolioForm()
    {
        $this->reset([
            'link_rps', 
            'lik_jurnal_pengajaran', 
            'integrasi_penelitian', 
            'integrasi_pengabmas', 
            'has_penelitian', 
            'has_pengabmas',
            'link_presensi_kehadiran_mahasiswa',
            'link_bahan_ajar',
            'link_analisis_soal',
            'link_sampel_pekerjaan_mahasiswa',
            'link_nilai_panjang',
            'cpmk_inputs'
        ]);
    }

public function savePortofolio()
{
    // 1. Validasi
    $this->validate([
        'link_rps' => 'required|url',
        'lik_jurnal_pengajaran' => 'required|url',
        'link_presensi_kehadiran_mahasiswa' => 'required|url',
        'link_bahan_ajar' => 'required|url',
        'link_analisis_soal' => 'required|url',
        'link_sampel_pekerjaan_mahasiswa' => 'required|url',
        'link_nilai_panjang' => 'required|url',
        
        'integrasi_penelitian' => $this->has_penelitian ? 'required|min:5' : 'nullable',
        'integrasi_pengabmas' => $this->has_pengabmas ? 'required|min:5' : 'nullable',

        'cpmk_inputs.*.refleksi' => 'required|min:5',
        'cpmk_inputs.*.perbaikan' => 'required|min:5',
    ], [
        'cpmk_inputs.*.refleksi.required' => 'Refleksi harus diisi.',
        'cpmk_inputs.*.refleksi.min' => 'Refleksi minimal 5 karakter.',
        'cpmk_inputs.*.perbaikan.required' => 'Perbaikan harus diisi.',
        'integrasi_penelitian.required' => 'Judul penelitian integrasi harus diisi jika dicentang.',
        'integrasi_pengabmas.required' => 'Judul pengabmas integrasi harus diisi jika dicentang.',
    ]);

    // 2. Pastikan prodi terisi (Fallback ke profil user jika kosong)
    if (!$this->prodi_login) {
        $this->prodi_login = Auth::user()->profil->prodi ?? null;
    }

    try {
        // 3. Simpan Portofolio Utama
        $portofolio = Portofolio::updateOrCreate(
            [
                'kode_mk' => $this->kode_mk, 
                'angkatan' => $this->angkatan,
                // Masukkan prodi ke search condition agar data per prodi terpisah jika MK-nya sama
                'prodi' => $this->prodi_login, 
            ],
            [
                'link_rps' => $this->link_rps,
                'lik_jurnal_pengajaran' => $this->lik_jurnal_pengajaran,
                'integrasi_penelitian' => $this->has_penelitian ? $this->integrasi_penelitian : null,
                'integrasi_pengabmas' => $this->has_pengabmas ? $this->integrasi_pengabmas : null,
                'link_presensi_kehadiran_mahasiswa' => $this->link_presensi_kehadiran_mahasiswa,
                'link_bahan_ajar' => $this->link_bahan_ajar,
                'link_analisis_soal' => $this->link_analisis_soal,
                'link_sampel_pekerjaan_mahasiswa' => $this->link_sampel_pekerjaan_mahasiswa,
                'link_nilai_panjang' => $this->link_nilai_panjang,
            ]
        );

        // 4. Simpan Detail
        if (!empty($this->cpmk_inputs)) {
            foreach ($this->cpmk_inputs as $kode_cpmk => $input) {
                PortofolioDetail::updateOrCreate(
                    [
                        'portofolio_id' => $portofolio->id, 
                        'kode_cpmk' => $kode_cpmk
                    ],
                    [
                        // Pastikan kolom 'prodi' ada di tabel portofolio_details
                        'prodi' => $this->prodi_login, 
                        'refleksi_analisis' => $input['refleksi'], 
                        'program_perbaikan' => $input['perbaikan']
                    ]
                );
            }
        }

        $this->confirmingPortofolio = false;
        
        if (method_exists($this, 'loadData')) {
            $this->loadData();
        }

        session()->flash('message', 'Berhasil disimpan untuk Prodi ' . $this->prodi_login);
        
    } catch (\Exception $e) {
        session()->flash('error', 'Terjadi kesalahan: ' . $e->getMessage());
    }
}

    // --- Helper Penilaian ---
    public function getKetercapaian($total)
    {
        if ($total >= 80) return ['label' => 'Tinggi', 'color' => 'text-green-600 font-bold'];
        if ($total >= 60) return ['label' => 'Sedang', 'color' => 'text-emerald-500 font-bold'];
        if ($total >= 40) return ['label' => 'Rendah', 'color' => 'text-yellow-600 font-bold'];
        return ['label' => 'Tidak Tercapai', 'color' => 'text-red-600 font-bold'];
    }

    public function hitungNilaiSub($student, $m)
    {
        $nilai_mhs = $student->penilaian->first();
        if (!$nilai_mhs || !$m) return 0;

        $akumulasi = 0;
        $total_bobot = 0;
        
        $map_kolom = [
            'kehadiran' => 'kehadiran',
            'tugas'     => 'tugas',
            'quiz'      => 'kuiz',
            'praktik'   => 'praktik',
            'uts'       => 'uts',
            'uas'       => 'uas',
            'mbkm'      => 'nilai_mbkm'
        ];

        foreach ($map_kolom as $k_metode => $k_penilaian) {
            $bobot = (float) ($m->$k_metode ?? 0);
            if ($bobot > 0) {
                $nilai_mentah = (float) ($nilai_mhs->$k_penilaian ?? 0);
                $akumulasi += ($nilai_mentah * ($bobot / 100));
                $total_bobot += ($bobot / 100);
            }
        }

        return $total_bobot > 0 ? round($akumulasi / $total_bobot, 2) : 0;
    }

    public function hitungNilai($student, $kode_cpmk)
    {
        $metodes = MetodePenilaian::where('kode_mk', $this->kode_mk)
            ->where('prodi', $this->prodi_login)
            ->where('kode_cpmk', $kode_cpmk)
            ->get();

        $nilai_mhs = $student->penilaian->first();
        
        if (!$nilai_mhs || $metodes->isEmpty()) return 0;

        $akumulasi_nilai_bobot = 0;
        $total_bobot_kontribusi = 0;

        $map_kolom = [
            'kehadiran' => 'kehadiran',
            'tugas'     => 'tugas',
            'quiz'      => 'kuiz', 
            'praktik'   => 'praktik',
            'uts'       => 'uts',
            'uas'       => 'uas',
            'mbkm'      => 'nilai_mbkm'
        ];

        foreach ($metodes as $m) {
            foreach ($map_kolom as $kolom_metode => $kolom_penilaian) {
                $bobot_senilai = (float) ($m->$kolom_metode ?? 0);
                if ($bobot_senilai > 0) {
                    $nilai_mentah = (float) ($nilai_mhs->$kolom_penilaian ?? 0);
                    $akumulasi_nilai_bobot += ($nilai_mentah * ($bobot_senilai / 100));
                    $total_bobot_kontribusi += ($bobot_senilai / 100);
                }
            }
        }

        return $total_bobot_kontribusi > 0 
            ? round($akumulasi_nilai_bobot / $total_bobot_kontribusi, 2) 
            : 0;
    }

    public function render()
    {
        if (!$this->prodi_login) {
            $this->prodi_login = Auth::user()->profil->prodi ?? null;
        }

        $students = [];
        $stats = []; 
        $all_metodes = []; 

        if ($this->kode_mk && $this->angkatan) {
            $students = Mahasiswa::where('angkatan', $this->angkatan)
                ->where('prodi', $this->prodi_login)
                ->with(['penilaian' => function($q) {
                    $q->where('kode_mk', $this->kode_mk);
                }])->get();

            $all_metodes = MetodePenilaian::where('kode_mk', $this->kode_mk)
                ->where('prodi', $this->prodi_login)
                ->orderBy('kode_cpmk', 'asc')
                ->get();

            foreach ($this->list_cpmk as $c) {
                $stats[$c->kode_cpmk] = ['Tinggi' => 0, 'Sedang' => 0, 'Rendah' => 0, 'Tidak Tercapai' => 0, 'Total' => 0];
            }

            foreach ($students as $s) {
                foreach ($this->list_cpmk as $c) {
                    $nilaiCpmk = $this->hitungNilai($s, $c->kode_cpmk);
                    $status = $this->getKetercapaian($nilaiCpmk);
                    $stats[$c->kode_cpmk][$status['label']]++;
                    $stats[$c->kode_cpmk]['Total']++;
                }
            }
        }

        return view('livewire.evaluasi-cpmk-manager', [
            'students' => $students,
            'stats' => $stats,
            'all_metodes' => $all_metodes,
            'daftar_mk' => MataKuliah::where('prodi', $this->prodi_login)->get(),
            'daftar_angkatan' => Mahasiswa::where('prodi', $this->prodi_login)
                                ->select('angkatan')->distinct()->orderBy('angkatan', 'desc')->pluck('angkatan')
        ]);
    }
}