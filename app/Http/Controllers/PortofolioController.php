<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Portofolio;
use App\Models\MataKuliah;
use App\Models\Mahasiswa;
use App\Models\RelasiCapaian;
use App\Models\PemetaanMkCplCpmk;
use App\Models\MetodePenilaian;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use PDF;

class PortofolioController extends Controller
{
public function index(Request $request)
{
    $prodiUser = Auth::user()->profil->prodi ?? null;
    $filterTahun = $request->get('tahun');

    $list_tahun = DB::table('penilaian_komponens')
        ->join('mata_kuliah', 'mata_kuliah.kode_mk', '=', 'penilaian_komponens.kode_mk')
        ->where('mata_kuliah.prodi', $prodiUser)
        ->distinct()
        ->orderBy('penilaian_komponens.tahun_akademik', 'desc')
        ->pluck('penilaian_komponens.tahun_akademik');

    $query = DB::table('mata_kuliah')
        ->join('penilaian_komponens', 'mata_kuliah.kode_mk', '=', 'penilaian_komponens.kode_mk')
        ->where('mata_kuliah.prodi', $prodiUser);

    if ($filterTahun) {
        $query->where('penilaian_komponens.tahun_akademik', $filterTahun);
    }

    $data_portofolio = $query->select(
            'mata_kuliah.nama_mk',
            'mata_kuliah.kode_mk',
            'penilaian_komponens.tahun_akademik',
            'penilaian_komponens.smt as semester',
            'mata_kuliah.prodi'
        )
        ->distinct()
        ->get();

    $data_portofolio = $data_portofolio->map(function ($item) {
        $angkatan_item = substr($item->tahun_akademik, 0, 4);

        $portofolio = Portofolio::where('kode_mk', $item->kode_mk)
            ->where('angkatan', $angkatan_item)
            ->first();

        if ($portofolio) {
            $item->hasPortofolio = true;
            $item->angkatan = $portofolio->angkatan;
            // TAMBAHKAN LOGIKA CHECK DI SINI
            $item->is_penelitian = !empty($portofolio->integrasi_penelitian);
            $item->is_pengabmas = !empty($portofolio->integrasi_pengabmas);
        } else {
            $item->hasPortofolio = false;
            $item->angkatan = $angkatan_item;
            $item->is_penelitian = false;
            $item->is_pengabmas = false;
        }
        return $item;
    });

    return view('portofolio.index', compact('data_portofolio', 'list_tahun', 'filterTahun'));
}

public function download(Request $request, $kode_mk, $angkatan)
{
    $prodiUser = Auth::user()->profil->prodi ?? null;

    // 1. Metadata
    $info = DB::table('penilaian_komponens')
        ->where('kode_mk', $kode_mk)
        ->where('prodi', $prodiUser)
        ->first();

    $metadata = $info ? [
        'semester'          => $info->semester ?? $info->smt ?? '-',
        'tahun_akademik'    => $info->tahun_akademik ?? '-',
        'dosen_koordinator' => $info->dosen1 ?? '-',
        'dosen_anggota'     => $info->dosen2 ?? '-',
        'dosen_anggota2'    => $info->dosen3 ?? null,
    ] : [
        'semester' => '-', 'tahun_akademik' => '-', 'dosen_koordinator' => '-', 'dosen_anggota' => '-', 'dosen_anggota2' => null,
    ];

    // 2. Data Master
    $mk = MataKuliah::where('kode_mk', $kode_mk)->first();
    $dekan = User::with('profil')->whereHas('profil', fn($q) => $q->where('jabatan_struktural', 'Dekan'))->first();
    $kaprodi = User::with('profil')->whereHas('profil', fn($q) => $q->where('jabatan_struktural', 'Kaprodi')->where('prodi', $prodiUser))->first();

    // 3. Relasi & Metode
    $relasis = RelasiCapaian::with(['cpl', 'cpmk', 'subCpmk'])->where('kode_mk', $kode_mk)->get();
    $relasi_grouped = $relasis->groupBy(['kode_cpl', 'kode_cpmk']);
    $metode_penilaians = MetodePenilaian::where('kode_mk', $kode_mk)->where('prodi', $prodiUser)->get();

    // 4. Mahasiswa & Nilai
    $portofolio = Portofolio::with('details')->where('kode_mk', $kode_mk)->where('angkatan', $angkatan)->firstOrFail();
    $list_cpmk = PemetaanMkCplCpmk::where('kode_mk', $kode_mk)->get();

    $students = Mahasiswa::where('angkatan', $angkatan)
        ->where('prodi', $prodiUser)
        ->with(['penilaian' => fn($q) => $q->where('kode_mk', $kode_mk)])
        ->get();

    $stats = [];
    $cpmk_stats = [];

    foreach ($list_cpmk as $c) {
        $kode_cpmk = $c->kode_cpmk;
        $stats[$kode_cpmk] = ['Tinggi' => 0, 'Sedang' => 0, 'Rendah' => 0, 'Tidak Tercapai' => 0];
        
        $totalNilaiCPMK = 0;
        $jumlahMhs = $students->count();

        // Ambil total bobot untuk normalisasi (Sesuai kolom tabel metode_penilaian)
        $totalBobotCPMK = MetodePenilaian::where('kode_mk', $kode_mk)
            ->where('prodi', $prodiUser)
            ->where('kode_cpmk', $kode_cpmk)
            ->selectRaw('SUM(mbkm + kehadiran + tugas + quiz + uts + uas + praktik) as total')
            ->value('total');

        foreach ($students as $student) {
            // Hitung nilai kontribusi menggunakan fungsi yang sudah diperbaiki mappingnya
            $nilaiKontribusi = $this->hitungNilai($student, $kode_cpmk, $kode_mk, $prodiUser);

            // NORMALISASI ke skala 100
            $nilaiSkala100 = ($totalBobotCPMK > 0) 
                ? ($nilaiKontribusi / ($totalBobotCPMK / 100)) 
                : 0;

            $totalNilaiCPMK += $nilaiSkala100;

            if ($nilaiSkala100 >= 80) {
                $stats[$kode_cpmk]['Tinggi']++;
            } elseif ($nilaiSkala100 >= 60) {
                $stats[$kode_cpmk]['Sedang']++;
            } elseif ($nilaiSkala100 >= 40) {
                $stats[$kode_cpmk]['Rendah']++;
            } else {
                $stats[$kode_cpmk]['Tidak Tercapai']++;
            }
        }

        $cpmk_stats[$kode_cpmk] = [
            'rerata' => $jumlahMhs > 0 ? round($totalNilaiCPMK / $jumlahMhs, 2) : 0,
            'persentase' => $jumlahMhs > 0 ? round((($stats[$kode_cpmk]['Tinggi'] + $stats[$kode_cpmk]['Sedang']) / $jumlahMhs) * 100, 2) : 0,
            'total' => $jumlahMhs
        ];
    }

    // --- LOGO & GRAFIK PDF ---
    $chartPieBase64 = $request->chartPieData;
    $chartBarBase64 = $request->chartBarData;
    $logoPath = public_path('img/logo.png');
    $logoBase64 = file_exists($logoPath) ? 'data:image/png;base64,' . base64_encode(file_get_contents($logoPath)) : null;

    $data = compact(
        'metadata', 'mk', 'dekan', 'kaprodi', 'portofolio', 'logoBase64',
        'cpmk_stats', 'relasis', 'relasi_grouped', 'metode_penilaians',
        'list_cpmk', 'students', 'stats', 'chartPieBase64', 'chartBarBase64'
    );

    if ($request->isMethod('post')) {
        $pdf = PDF::loadView('pdf.portofolio_full', $data);
        $pdf->setPaper('a4', 'portrait');
        return $pdf->stream('Portofolio_' . $kode_mk . '.pdf');
    }

    return view('pdf.portofolio_full', $data);
}

public function hitungNilai($student, $kode_cpmk, $kode_mk_input = null, $prodi_input = null)
{
    // Mengamankan parameter untuk controller atau livewire
    $mk = $kode_mk_input ?? ($this->kode_mk ?? null);
    $prodi = $prodi_input ?? ($this->prodi_login ?? null);

    $nilai_mhs = $student->penilaian->first();
    if (!$nilai_mhs) return 0;

    $metodes = MetodePenilaian::where('kode_mk', $mk)
        ->where('prodi', $prodi)
        ->where('kode_cpmk', $kode_cpmk)
        ->get();

    $total_kontribusi = 0;
    
    // Mapping yang sudah dicocokkan antar tabel
    $map_kolom = [
        'kehadiran' => 'kehadiran',
        'tugas'     => 'tugas',
        'quiz'      => 'kuiz',        // Kunci: metode_penilaian, Nilai: penilaian_komponens
        'praktik'   => 'praktik',
        'uts'       => 'uts',
        'uas'       => 'uas',
        'mbkm'      => 'nilai_mbkm'   // Kunci: metode_penilaian, Nilai: penilaian_komponens
    ];

    foreach ($metodes as $m) {
        foreach ($map_kolom as $kolom_metode => $kolom_penilaian) {
            $bobot = (float) ($m->$kolom_metode ?? 0);
            if ($bobot > 0) {
                $nilai_mentah = (float) ($nilai_mhs->$kolom_penilaian ?? 0);
                // Rumus: (Bobot / 100) * Nilai Mahasiswa
                $total_kontribusi += ($bobot / 100) * $nilai_mentah;
            }
        }
    }

    return $total_kontribusi;
}

    public function getKetercapaian($nilai)
    {
        if ($nilai >= 80) return ['label' => 'Tinggi', 'color' => 'color: #059669;'];
        if ($nilai >= 60) return ['label' => 'Sedang', 'color' => 'color: #10B981;'];
        if ($nilai >= 40) return ['label' => 'Rendah', 'color' => 'color: #D97706;'];
        return ['label' => 'Tidak Tercapai', 'color' => 'color: #DC2626;'];
    }
}