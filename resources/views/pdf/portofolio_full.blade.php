<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portofolio - SMT {{ $metadata['semester'] }} - {{ $mk->nama_mk }} - {{ $metadata['tahun_akademik'] }}</title>
    <link rel="icon" type="image/png" href="{{ asset('img/simpobe.png') }}">
    <style>
    /* CSS KHUSUS PREVIEW BROWSER */
    body { 
        font-family: 'Helvetica', 'Arial', sans-serif; 
        line-height: 1.3; 
        font-size: 11px; 
        color: #000; 
        background-color: #f3f4f6;
        margin: 0;
        padding: 20px;
    }

    .paper {
        background: white;
        width: 210mm;
        margin: 0 auto 20px auto;
        padding: 2.5cm 2cm;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        min-height: 297mm;
        box-sizing: border-box; /* Memastikan padding tidak merusak ukuran A4 */
    }

    .floating-menu {
        position: fixed;
        top: 20px;
        right: 20px;
        display: flex;
        gap: 10px;
        z-index: 1000;
    }

    .btn-action {
        padding: 10px 15px;
        border-radius: 8px;
        text-decoration: none;
        font-family: sans-serif;
        font-weight: bold;
        font-size: 13px;
        display: flex;
        align-items: center;
        gap: 8px;
        border: none;
        cursor: pointer;
        transition: 0.3s;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    .btn-back { background-color: #6b7280; color: white; }
    .btn-back:hover { background-color: #4b5563; }

    .btn-print { background-color: #2563eb; color: white; }
    .btn-print:hover { background-color: #1d4ed8; }

    /* CSS UNTUK STRUKTUR PDF */
    .page-break { page-break-after: always; }
    .text-center { text-align: center; }
    .font-bold { font-weight: bold; }
    
    table { 
        width: 100%; 
        border-collapse: collapse; 
        margin-bottom: 15px; 
        table-layout: fixed;
        /* Menambahkan sedikit margin top agar tabel tidak menempel ke batas atas saat auto-break */
        margin-top: 10px; 
    }

    th, td { 
        border: 1px solid #000; 
        padding: 6px; 
        vertical-align: top; /* Berubah ke top agar lebih rapi saat teks panjang */
        word-wrap: break-word; 
    }

    /* Trik agar header tabel muncul kembali di halaman baru */
    thead { display: table-header-group; }
    tfoot { display: table-footer-group; }

    .no-border td { border: none !important; padding: 2px 0; }
    .bg-blue { background-color: #e6f2ff; }
    .bg-orange { background-color: #fff2e6; }
    .bg-gray { background-color: #f2f2f2; }
    
    h2, h3 { 
        margin-bottom: 10px; 
        border-bottom: 2px solid #000; 
        padding-bottom: 5px; 
        font-size: 14px;
        orphans: 3; /* Mencegah judul tertinggal sendirian di dasar halaman */
        widows: 3;
    }

    .text-red { color: #d9534f; }
    .text-green { color: #059669; }

    @media print {
        @page {
            size: A4;
            /* Memberikan margin pada level kertas @page agar halaman 2 dst punya jarak */
            margin: 1.5cm 0; 
        }

        .no-print { display: none !important; }

        body { 
            background: white !important; 
            padding: 0 !important; 
            margin: 0 !important;
            width: 100% !important;
        }

        .paper { 
            box-shadow: none !important; 
            margin: 0 !important; 
            width: 100% !important; 
            max-width: none !important;
            /* Padding tetap ada sebagai margin konten utama */
            padding: 1.5cm 2cm !important; 
            min-height: auto !important;
            box-sizing: border-box;
        }

        /* Memastikan tabel tidak terpotong secara paksa di tengah baris */
        table { page-break-inside: auto; }
        tr { page-break-inside: avoid; page-break-after: auto; }
        
        /* Memberikan napas pada paragraf yang terpotong */
        p { orphans: 3; widows: 3; }

        * {
            -webkit-print-color-adjust: exact !important;
            print-color-adjust: exact !important;
        }
    }

    .portfolio-wrapper {
        font-family: 'Times New Roman', Times, serif;
        color: #000;
        padding: 40px;
        max-content: 800px;
        margin: auto;
        line-height: 1.5;
    }

    .header-title {
        text-align: center;
        border-bottom: 2px solid #000;
        padding-bottom: 10px;
        margin-bottom: 30px;
    }

    .header-title h2 {
        margin: 0;
        text-transform: uppercase;
        font-size: 1.4rem;
    }

    .bab-container {
        margin-bottom: 20px;
    }

    .bab-title {
        font-weight: bold;
        text-transform: uppercase;
        display: flex;
        gap: 10px;
        font-size: 1.1rem;
        margin-bottom: 5px;
    }

    .sub-list {
        list-style-type: none;
        padding-left: 0;
        margin: 0;
    }

    .sub-item {
        display: flex;
        gap: 12px;
        padding: 2px 0 2px 30px; 
        font-size: 1rem;
    }

    .num-col {
        min-width: 35px; 
    }
</style>
</head>
<body>
    <div class="floating-menu no-print">
        <a href="https://simpobe.uhb.ac.id/penilaian-obe/evaluasi-cpmk" class="btn-action btn-back">
            <span>⬅</span> Kembali
        </a>

        <button onclick="window.print()" class="btn-action btn-print">
            <span>🖨️</span> Cetak Portofolio
        </button>
    </div>
    <div class="paper page-break text-center">
        @if($logoBase64) 
        <img src="{{ $logoBase64 }}" style="width: 120px; height: auto;"> 
        @endif
        
        <h2 style="margin-top: 80px; border:none; font-size: 20px;">PORTOFOLIO MATA KULIAH</h2>
        <div style="margin-top: 15px; padding: 15px; background-color: #f9fafb; border: 1px solid #ddd; font-size: 20px;">
            {{ $mk->nama_mk }}
        </div>
        
        <div style="margin-top: 400px; font-size: 18px;">
            {{-- Ganti teks statis Anda dengan ini --}}
            <p class="font-bold">Program Studi {{ $mk->prodi ?? '................' }}</p>
            <p class="font-bold">Fakultas {{ $mk->fakultas ?? 'Sains dan Teknologi' }}</p>
            <p class="font-bold">Universitas Harapan Bangsa</p>
            <p class="font-bold" style="margin-top: 20px;">Tahun Akademik: {{ $metadata['tahun_akademik'] }}</p>
        </div>
    </div>

{{-- IDENTITAS MATA KULIAH --}}
<div class="paper page-break">
    <div class="content-wrapper">
        <h3 class="text-center" style="border:none; text-decoration: underline; font-size: 16px; margin-bottom: 25px;">
            IDENTITAS MATA KULIAH
        </h3>

        <table style="width: 100%; border-collapse: collapse; font-size: 12px; margin-bottom: 50px;">
            <tr>
                <td width="30%" style="border: 1px solid #000; padding: 10px; background-color: #f9fafb; font-weight: bold;">NAMA MATA KULIAH</td>
                <td style="border: 1px solid #000; padding: 10px;">{{ $mk->nama_mk ?? '-' }}</td>
            </tr>
            <tr>
                <td style="border: 1px solid #000; padding: 10px; background-color: #f9fafb; font-weight: bold;">KODE MATA KULIAH</td>
                <td style="border: 1px solid #000; padding: 10px;">{{ $mk->kode_mk ?? '-' }}</td>
            </tr>
            <tr>
                <td style="border: 1px solid #000; padding: 10px; background-color: #f9fafb; font-weight: bold;">SEMESTER</td>
                <td style="border: 1px solid #000; padding: 10px;">{{ $metadata['semester'] }}</td>
            </tr>
            <tr>
                <td style="border: 1px solid #000; padding: 10px; background-color: #f9fafb; font-weight: bold;">NAMA DOSEN / TIM</td>
                <td style="border: 1px solid #000; padding: 10px;">
                    @php 
                    $tim = array_filter([
                        $metadata['dosen_koordinator'], 
                        ($metadata['dosen_anggota'] !== '-' ? $metadata['dosen_anggota'] : null), 
                        (($metadata['dosen_anggota2'] ?? '-') !== '-' ? $metadata['dosen_anggota2'] : null)
                    ]); 
                    echo implode(', ', $tim); 
                    @endphp
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #000; padding: 10px; background-color: #f9fafb; font-weight: bold;">DOSEN KOORDINATOR</td>
                <td style="border: 1px solid #000; padding: 10px;">{{ $metadata['dosen_koordinator'] }}</td>
            </tr>
        </table>

        {{-- Section Tanda Tangan --}}
        <div style="margin-top: 60px;">
            <table class="no-border" style="width: 100%; font-size: 12px; border: none !important;">
                <tr>
                    <td width="33%" style="text-align: center; border: none !important;">
                        Mengetahui,<br>Dekan FST
                    </td>
                    <td width="33%" style="text-align: center; border: none !important;">
                        Dosen Koordinator MK
                    </td>
                    <td width="33%" style="text-align: center; border: none !important;">
                        Kaprodi {{ $mk->prodi ?? '................' }}
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 80px; text-align: center; border: none !important;">
                        <p class="font-bold" style="margin-bottom: 0;">
                            <u>( 
                            @if($dekan)
                                {{ ($dekan->profil->gelar_depan ? $dekan->profil->gelar_depan . ' ' : '') . $dekan->name . ($dekan->profil->gelar_belakang ? ', ' . $dekan->profil->gelar_belakang : '') }}
                            @else
                                ____________________
                            @endif
                            )</u>
                        </p>
                        <p style="margin-top: 5px;">NIDN. {{ $dekan->profil->nidn ?? '__________' }}</p>
                    </td>
                    <td style="padding-top: 80px; text-align: center; border: none !important;">
                        <p class="font-bold" style="margin-bottom: 0;">
                            <u>( {{ $metadata['dosen_koordinator'] }} )</u>
                        </p>
                        <p style="margin-top: 5px;">&nbsp;</p> {{-- Spasi agar sejajar --}}
                    </td>
                    <td style="padding-top: 80px; text-align: center; border: none !important;">
                        <p class="font-bold" style="margin-bottom: 0;">
                            <u>( 
                            @if($kaprodi)
                                {{ ($kaprodi->profil->gelar_depan ? $kaprodi->profil->gelar_depan . ' ' : '') . $kaprodi->name . ($kaprodi->profil->gelar_belakang ? ', ' . $kaprodi->profil->gelar_belakang : '') }}
                            @else
                                ____________________
                            @endif
                            )</u>
                        </p>
                        <p style="margin-top: 5px;">NIDN. {{ $kaprodi->profil->nidn ?? '__________' }}</p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<<div class="paper page-break">
    <div class="portfolio-wrapper">
        <div class="header-title">
            <h2>DAFTAR ISI PORTOFOLIO PERKULIAHAN</h2>
        </div>
        
        {{-- 1. PENETAPAN --}}
        <div class="bab-container">
            <div class="bab-title">
                <span>1.</span> <span>PENETAPAN</span>
            </div>
            <div class="sub-list">
                <div class="sub-item">
                    <span class="num-col">1.1</span>
                    <span>Rencana Pembelajaran Semester (RPS)</span>
                </div>
                <div class="sub-item">
                    <span class="num-col">1.2</span>
                    <span>Integrasi Capaian Pembelajaran dan Asesmen</span>
                </div>
            </div>
        </div>

        {{-- 2. PELAKSANAAN --}}
        <div class="bab-container">
            <div class="bab-title">
                <span>2.</span> <span>PELAKSANAAN</span>
            </div>
            <div class="sub-list">
                <div class="sub-item">
                    <span class="num-col">2.1</span>
                    <span>Jurnal Pengajaran, Bukti PBM & Daftar Hadir Mahasiswa</span>
                </div>
                <div class="sub-item">
                    <span class="num-col">2.2</span>
                    <span>Integrasi Hasil Penelitian dan Pengabdian Masyarakat</span>
                </div>
                <div class="sub-item">
                    <span class="num-col">2.3</span>
                    <span>Bahan Ajar / Modul Kuliah</span>
                </div>
                <div class="sub-item">
                    <span class="num-col">2.4</span>
                    <span>Instrumen Asesmen & Analisis Butir Soal</span>
                </div>
                <div class="sub-item">
                    <span class="num-col">2.5</span>
                    <span>Sampel Hasil Pekerjaan Mahasiswa & Feedback</span>
                </div>
            </div>
        </div>

        {{-- 3. EVALUASI --}}
        <div class="bab-container">
            <div class="bab-title">
                <span>3.</span> <span>EVALUASI</span>
            </div>
            <div class="sub-list">
                <div class="sub-item">
                    <span class="num-col">3.1</span>
                    <span>Rekap Nilai Mahasiswa (Versi Lengkap/Panjang)</span>
                </div>
                <div class="sub-item">
                    <span class="num-col">3.2</span>
                    <span>Analisis Ketercapaian CPMK</span>
                </div>
            </div>
        </div>

        {{-- 4. PENGENDALIAN --}}
        <div class="bab-container">
            <div class="bab-title">
                <span>4.</span> <span>PENGENDALIAN & PENINGKATAN</span>
            </div>
            <div class="sub-list">
                <div class="sub-item">
                    <span class="num-col">4.1</span>
                    <span>Laporan Pengukuran CPMK dan Analisis Tindak Lanjut</span>
                </div>
            </div>
        </div>

    </div>
</div>
    {{-- BAB 1. PENETAPAN --}}
<div class="paper page-break">
    <div class="bab-header">
        <h2 style="text-transform: uppercase; border-bottom: 2px solid #000; padding-bottom: 5px;">Bab 1. Penetapan</h2>
    </div>

    {{-- 1.1 Rencana Pembelajaran Semester --}}
    <div class="section-container" style="margin-bottom: 30px;">
        <h3 style="font-size: 14px; margin-bottom: 10px;">1.1 Rencana Pembelajaran Semester (RPS)</h3>
        <p style="text-align: justify; margin-bottom: 15px; font-size: 12px; line-height: 1.5;">
            Rencana Pembelajaran Semester (RPS) disusun sebagai panduan operasional proses pembelajaran selama satu semester. Dokumen ini memuat identitas mata kuliah, capaian pembelajaran, materi, metode pembelajaran, hingga komponen penilaian. Seluruh perencanaan ini dapat diakses melalui tautan dokumen resmi di bawah ini:
        </p>
        <div style="background-color: #f8fafc; padding: 10px; border: 1px solid #e2e8f0; border-radius: 4px; margin-bottom: 20px;">
            <p style="font-size: 12px; margin: 0;">
                <strong>Tautan Dokumen RPS:</strong> 
                <a href="{{ $portofolio->link_rps }}" target="_blank" style="color: #4f46e5; text-decoration: underline;">
                    {{ $portofolio->link_rps }}
                </a>
            </p>
        </div>

        {{-- Deskripsi Tabel --}}
        <p style="text-align: justify; margin-bottom: 10px; font-size: 12px; line-height: 1.5;">
            Berdasarkan dokumen RPS di atas, berikut adalah rincian pemetaan Capaian Pembelajaran Lulusan (CPL), Capaian Pembelajaran Mata Kuliah (CPMK), hingga materi pembelajaran yang diampu:
        </p>

        {{-- Tabel Relasi --}}
        <table style="width: 100%; border-collapse: collapse; font-size: 10px;">
            <thead>
                <tr style="background-color: #f3f4f6; text-align: center;">
                    <th style="border: 1px solid #000; padding: 8px;" width="20%">CPL yang dibebankan pada MK</th>
                    <th style="border: 1px solid #000; padding: 8px;" width="25%">Capaian Pembelajaran Mata Kuliah (CPMK)</th>
                    <th style="border: 1px solid #000; padding: 8px;" width="25%">Sub-CPMK</th>
                    <th style="border: 1px solid #000; padding: 8px;" width="30%">Materi Pembelajaran</th>
                </tr>
            </thead>
            <tbody>
                @foreach($relasis as $relasi)
                <tr>
                    <td style="border: 1px solid #000; padding: 8px; vertical-align: top;">
                        <span style="font-weight: bold;">{{ $relasi->cpl->kode_cpl ?? '-' }}</span>: {{ $relasi->cpl->deskripsi_cpl ?? '-' }}
                    </td>
                    <td style="border: 1px solid #000; padding: 8px; vertical-align: top;">
                        <span style="font-weight: bold;">{{ $relasi->cpmk->kode_cpmk ?? '-' }}</span>: {{ $relasi->cpmk->deskripsi_cpmk ?? '-' }}
                    </td>
                    <td style="border: 1px solid #000; padding: 8px; vertical-align: top;">
                        <span style="font-weight: bold;">{{ $relasi->subCpmk->kode_sub_cpmk ?? '-' }}</span>: {{ $relasi->subCpmk->uraian_sub_cpmk ?? '-' }}
                    </td>
                    <td style="border: 1px solid #000; padding: 8px; vertical-align: top;">
                        {{ $relasi->subCpmk->materi_pembelajaran ?? '-' }}
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <hr style="border: 0; border-top: 1px solid #eee; margin: 25px 0;">

    {{-- 1.2 Integrasi Capaian Pembelajaran dan Asesmen --}}
    <div class="section-container">
        <h3 style="font-size: 14px; margin-bottom: 10px;">1.2 Integrasi Capaian Pembelajaran dan Asesmen</h3>
        <p style="text-align: justify; margin-bottom: 10px; font-size: 12px; line-height: 1.5;">
            Bagian ini menjabarkan keterkaitan erat antara indikator capaian pembelajaran dengan metode penilaian yang digunakan selama masa perkuliahan. 
            Setiap instrumen asesmen dirancang untuk mengukur tingkat keberhasilan mahasiswa dalam mencapai kompetensi yang spesifik pada level Sub-CPMK. 
            Proporsi bobot penilaian pada setiap komponen mencerminkan tingkat kedalaman dan kontribusi materi tersebut terhadap nilai akhir mata kuliah. 
            Integrasi ini berfungsi sebagai penjamin mutu agar evaluasi hasil belajar dilakukan secara objektif, transparan, dan akuntabel.
        </p>
        
        <p style="font-size: 11px; margin-bottom: 8px;">Berikut adalah pemetaan kontribusi setiap komponen penilaian berdasarkan Sub-CPMK:</p>

        <table style="width: 100%; border-collapse: collapse; font-size: 9px;">
            <thead>
                <tr style="text-align: center; background-color: #f3f4f6;">
                    <th style="border: 1px solid #000; padding: 5px;" width="8%">Kode CPL</th>
                    <th style="border: 1px solid #000; padding: 5px;" width="8%">Kode CPMK</th>
                    <th style="border: 1px solid #000; padding: 5px;" width="12%">Sub-CPMK</th>
                    <th style="border: 1px solid #000; padding: 5px; background-color: #ebf8ff;">MBK</th>
                    <th style="border: 1px solid #000; padding: 5px; background-color: #ebf8ff;">PRT</th>
                    <th style="border: 1px solid #000; padding: 5px; background-color: #ebf8ff;">OBS</th>
                    <th style="border: 1px solid #000; padding: 5px; background-color: #ebf8ff;">QUI</th>
                    <th style="border: 1px solid #000; padding: 5px; background-color: #ebf8ff;">UTS</th>
                    <th style="border: 1px solid #000; padding: 5px; background-color: #ebf8ff;">UAS</th>
                    <th style="border: 1px solid #000; padding: 5px; background-color: #ebf8ff;">PRK</th>
                    <th style="border: 1px solid #000; padding: 5px; background-color: #fffaf0;" width="10%">Total Bobot</th>
                </tr>
            </thead>
            <tbody>
                @php $grand_total_bobot = 0; @endphp
                @foreach($relasi_grouped as $kode_cpl => $cpmks)
                    @php $cpl_rowspan = $cpmks->flatten(1)->count(); @endphp
                    @foreach($cpmks as $kode_cpmk => $items)
                        @php $cpmk_rowspan = $items->count(); @endphp
                        @foreach($items as $index => $relasi)
                            @php 
                                $metode = $metode_penilaians->where('kode_sub_cpmk', $relasi->kode_sub_cpmk)->first() 
                                          ?? $metode_penilaians->where('kode_cpmk', $relasi->kode_cpmk)->first();
                                $row_sum = 0;
                                if($metode) {
                                    $row_sum = ($metode->mbkm ?? 0) + ($metode->kehadiran ?? 0) + ($metode->tugas ?? 0) + 
                                               ($metode->quiz ?? 0) + ($metode->uts ?? 0) + ($metode->uas ?? 0) + ($metode->praktik ?? 0);
                                    $grand_total_bobot += $row_sum;
                                }
                            @endphp
                            <tr>
                                @if($loop->parent->first && $index == 0)
                                    <td rowspan="{{ $cpl_rowspan }}" style="border: 1px solid #000; text-align: center; font-weight: bold; background-color: #f3f4f6;">{{ $kode_cpl }}</td>
                                @endif
                                @if($index == 0)
                                    <td rowspan="{{ $cpmk_rowspan }}" style="border: 1px solid #000; text-align: center; font-weight: bold;">{{ $kode_cpmk }}</td>
                                @endif
                                <td style="border: 1px solid #000; text-align: center; font-weight: bold;">{{ $relasi->subCpmk->kode_sub_cpmk ?? '-' }}</td>
                                <td style="border: 1px solid #000; text-align: center;">{{ $metode->mbkm ?? 0 }}%</td>
                                <td style="border: 1px solid #000; text-align: center;">{{ $metode->kehadiran ?? 0 }}%</td>
                                <td style="border: 1px solid #000; text-align: center;">{{ $metode->tugas ?? 0 }}%</td>
                                <td style="border: 1px solid #000; text-align: center;">{{ $metode->quiz ?? 0 }}%</td>
                                <td style="border: 1px solid #000; text-align: center;">{{ $metode->uts ?? 0 }}%</td>
                                <td style="border: 1px solid #000; text-align: center;">{{ $metode->uas ?? 0 }}%</td>
                                <td style="border: 1px solid #000; text-align: center;">{{ $metode->praktik ?? 0 }}%</td>
                                <td style="border: 1px solid #000; text-align: center; font-weight: bold; background-color: #fffaf0;">{{ $row_sum }}%</td>
                            </tr>
                        @endforeach
                    @endforeach
                @endforeach
            </tbody>
            <tfoot>
                <tr style="background-color: #f3f4f6; font-weight: bold;">
                    <td colspan="3" style="border: 1px solid #000; text-align: center;">TOTAL KONTRIBUSI TERHADAP NILAI MK</td>
                    <td style="border: 1px solid #000; text-align: center;">{{ $metode_penilaians->sum('mbkm') }}%</td>
                    <td style="border: 1px solid #000; text-align: center;">{{ $metode_penilaians->sum('kehadiran') }}%</td>
                    <td style="border: 1px solid #000; text-align: center;">{{ $metode_penilaians->sum('tugas') }}%</td>
                    <td style="border: 1px solid #000; text-align: center;">{{ $metode_penilaians->sum('quiz') }}%</td>
                    <td style="border: 1px solid #000; text-align: center;">{{ $metode_penilaians->sum('uts') }}%</td>
                    <td style="border: 1px solid #000; text-align: center;">{{ $metode_penilaians->sum('uas') }}%</td>
                    <td style="border: 1px solid #000; text-align: center;">{{ $metode_penilaians->sum('praktik') }}%</td>
                    <td style="border: 1px solid #000; text-align: center; background-color: #fffaf0;">{{ $grand_total_bobot }}%</td>
                </tr>
            </tfoot>
        </table>
        <p style="font-size: 8px; margin-top: 5px;">* MBK: MBKM, PRT: Partisipatif, OBS: Observasi/Tugas, QUI: Quiz, UTS: Tengah Semester, UAS: Akhir Semester, PRK: Praktik/Proyek</p>
    </div>
    <div style="margin-top: 15px;">
            <table style="width: 70%; font-size: 10px;">
                <thead>
                    <tr class="bg-gray">
                        <th width="20%" class="text-center">Kode Jenis</th>
                        <th width="80%">Penjelasan Jenis Komponen Penilaian</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="text-center font-bold">UTS</td>
                        <td>Ujian Tengah Semester</td>
                    </tr>
                    <tr>
                        <td class="text-center font-bold">UAS</td>
                        <td>Ujian Akhir Semester</td>
                    </tr>
                    <tr>
                        <td class="text-center font-bold">OBS</td>
                        <td>Tugas teori seperti pengerjaan soal di buku/ bahan ajar, studi kasus, atau lainnya</td>
                    </tr>
                    <tr>
                        <td class="text-center font-bold">QUI</td>
                        <td>Quiz</td>
                    </tr>
                    <tr>
                        <td class="text-center font-bold">PRK</td>
                        <td>Praktik/Praktikum/Project untuk kerja atau lainnya</td>
                    </tr>
                    <tr>
                        <td class="text-center font-bold">PRT</td>
                        <td>Aktivitas Partisipatif/Kehadiran</td>
                    </tr>
                    <tr>
                        <td class="text-center font-bold">MBK</td>
                        <td>Kegiatan MBKM pembelajaran di luar kelas</td>
                    </tr>
                </tbody>
            </table>
        </div>
</div>

    {{-- BAB 2. PELAKSANAAN --}}
<div class="paper page-break">
    <div class="bab-header">
        <h2 style="text-transform: uppercase; border-bottom: 2px solid #000; padding-bottom: 5px;">Bab 2. Pelaksanaan</h2>
    </div>

    {{-- 2.1 Jurnal Pengajaran, Bukti PBM & Daftar Hadir --}}
    <div class="section-container" style="margin-bottom: 25px;">
        <h3 style="font-size: 14px; margin-bottom: 8px;">2.1 Jurnal Pengajaran, Bukti PBM & Daftar Hadir Mahasiswa</h3>
        <p style="text-align: justify; margin-bottom: 10px; font-size: 12px; line-height: 1.5;">
            Seluruh aktivitas tatap muka atau daring telah dicatat secara sistematis dalam jurnal pengajaran serta daftar kehadiran mahasiswa sebagai bukti otentik pelaksanaan proses belajar mengajar.
        </p>
        <div style="background-color: #f8fafc; padding: 10px; border: 1px solid #e2e8f0; border-radius: 4px;">
            <p style="font-size: 11px; margin: 0 0 5px 0;">
                <strong>Tautan Jurnal Pengajaran:</strong> 
                <a href="{{ $portofolio->lik_jurnal_pengajaran }}" target="_blank" style="color: #4f46e5; text-decoration: underline;">
                    {{ $portofolio->lik_jurnal_pengajaran ?? 'Belum ada tautan' }}
                </a>
            </p>
            <p style="font-size: 11px; margin: 0;">
                <strong>Tautan Presensi Mahasiswa:</strong> 
                <a href="{{ $portofolio->link_presensi_kehadiran_mahasiswa }}" target="_blank" style="color: #4f46e5; text-decoration: underline;">
                    {{ $portofolio->link_presensi_kehadiran_mahasiswa ?? 'Belum ada tautan' }}
                </a>
            </p>
        </div>
    </div>

    {{-- 2.2 Integrasi Hasil Penelitian dan Pengabdian Masyarakat --}}
<div class="section-container" style="margin-bottom: 25px;">
    <h3 style="font-size: 14px; margin-bottom: 8px;">2.2 Integrasi Hasil Penelitian dan Pengabdian Masyarakat</h3>
    
    <div style="text-align: justify; margin-bottom: 10px; font-size: 12px; line-height: 1.6;">
        {{-- Logika Narasi Penelitian --}}
        @if($portofolio->integrasi_penelitian)
            <p style="margin-bottom: 5px;">Terdapat Penelitian yang terintegrasi dengan mata kuliah ini, sehingga <strong>ada</strong> materi pembelajaran yang diperkaya dengan hasil riset terkini.</p>
        @else
            <p style="margin-bottom: 5px;"><strong>Tidak ada</strong> Penelitian yang terintegrasi dengan mata kuliah ini.</p>
        @endif

        {{-- Logika Narasi Pengabdian --}}
        @if($portofolio->integrasi_pengabmas)
            <p style="margin-bottom: 10px;">Terdapat Pengabdian Masyarakat yang terintegrasi dengan mata kuliah ini, sehingga <strong>ada</strong> relevansi praktis lapangan yang disampaikan kepada mahasiswa.</p>
        @else
            <p style="margin-bottom: 10px;"><strong>Tidak ada</strong> Pengabdian Masyarakat yang terintegrasi dengan mata kuliah ini.</p>
        @endif
    </div>

    <div style="background-color: #f8fafc; padding: 10px; border: 1px solid #e2e8f0; border-radius: 4px;">
        <p style="font-size: 11px; margin: 0 0 5px 0;">
            <strong>Tautan Hasil Penelitian:</strong> 
            @if($portofolio->integrasi_penelitian)
                <a href="{{ $portofolio->integrasi_penelitian }}" target="_blank" style="color: #4f46e5; text-decoration: underline;">
                    {{ $portofolio->integrasi_penelitian }}
                </a>
            @else
                <span style="color: #94a3b8; font-style: italic;">Belum ada tautan</span>
            @endif
        </p>
        <p style="font-size: 11px; margin: 0;">
            <strong>Tautan Pengabdian Masyarakat:</strong> 
            @if($portofolio->integrasi_pengabmas)
                <a href="{{ $portofolio->integrasi_pengabmas }}" target="_blank" style="color: #4f46e5; text-decoration: underline;">
                    {{ $portofolio->integrasi_pengabmas }}
                </a>
            @else
                <span style="color: #94a3b8; font-style: italic;">Belum ada tautan</span>
            @endif
        </p>
    </div>
</div>

    {{-- 2.3 Bahan Ajar / Modul --}}
    <div class="section-container" style="margin-bottom: 25px;">
        <h3 style="font-size: 14px; margin-bottom: 8px;">2.3 Bahan Ajar / Modul Kuliah</h3>
        <p style="text-align: justify; margin-bottom: 10px; font-size: 12px; line-height: 1.5;">
            Penyampaian materi didukung oleh penggunaan bahan ajar atau modul yang telah disusun untuk mempermudah pemahaman substansi perkuliahan.
        </p>
        <div style="background-color: #f8fafc; padding: 10px; border: 1px solid #e2e8f0; border-radius: 4px;">
            <p style="font-size: 11px; margin: 0;">
                <strong>Tautan Bahan Ajar:</strong> 
                <a href="{{ $portofolio->link_bahan_ajar }}" target="_blank" style="color: #4f46e5; text-decoration: underline;">
                    {{ $portofolio->link_bahan_ajar ?? 'Belum ada tautan' }}
                </a>
            </p>
        </div>
    </div>

    {{-- 2.4 Instrumen Asesmen & Analisis Butir Soal --}}
    <div class="section-container" style="margin-bottom: 25px;">
        <h3 style="font-size: 14px; margin-bottom: 8px;">2.4 Instrumen Asesmen & Analisis Butir Soal</h3>
        <p style="text-align: justify; margin-bottom: 10px; font-size: 12px; line-height: 1.5;">
            Instrumen penilaian yang digunakan telah dilengkapi dengan analisis butir soal untuk memastikan kualitas pengukuran kompetensi mahasiswa.
        </p>
        <div style="background-color: #f8fafc; padding: 10px; border: 1px solid #e2e8f0; border-radius: 4px;">
            <p style="font-size: 11px; margin: 0;">
                <strong>Tautan Analisis Soal:</strong> 
                <a href="{{ $portofolio->link_analisis_soal }}" target="_blank" style="color: #4f46e5; text-decoration: underline;">
                    {{ $portofolio->link_analisis_soal ?? 'Belum ada tautan' }}
                </a>
            </p>
        </div>
    </div>

    {{-- 2.5 Sampel Hasil Pekerjaan --}}
    <div class="section-container">
        <h3 style="font-size: 14px; margin-bottom: 8px;">2.5 Sampel Hasil Pekerjaan Mahasiswa & Feedback</h3>
        <p style="text-align: justify; margin-bottom: 10px; font-size: 12px; line-height: 1.5;">
            Mendokumentasikan sampel hasil pekerjaan mahasiswa beserta bukti umpan balik (feedback) yang diberikan oleh dosen.
        </p>
        <div style="background-color: #f8fafc; padding: 10px; border: 1px solid #e2e8f0; border-radius: 4px;">
            <p style="font-size: 11px; margin: 0;">
                <strong>Tautan Sampel Pekerjaan:</strong> 
                <a href="{{ $portofolio->link_sampel_pekerjaan_mahasiswa }}" target="_blank" style="color: #4f46e5; text-decoration: underline;">
                    {{ $portofolio->link_sampel_pekerjaan_mahasiswa ?? 'Belum ada tautan' }}
                </a>
            </p>
        </div>
    </div>
</div>

{{-- BAB 3. EVALUASI --}}
<div class="paper page-break">
    <div class="bab-header">
        <h2 style="text-transform: uppercase; border-bottom: 2px solid #000; padding-bottom: 5px;">Bab 3. Evaluasi</h2>
    </div>

    {{-- 3.1 Rekap Nilai Mahasiswa (Versi Lengkap/Panjang) --}}
    <div class="section-container" style="margin-bottom: 30px;">
        <h3 style="font-size: 14px; margin-bottom: 10px;">3.1 Rekap Nilai Mahasiswa (Versi Lengkap/Panjang)</h3>
        <p style="text-align: justify; margin-bottom: 15px; font-size: 12px; line-height: 1.5;">
            Bagian ini menyajikan rekapitulasi nilai mahasiswa secara mendalam, mencakup seluruh komponen penilaian yang telah ditetapkan. Data ini digunakan sebagai dasar untuk melakukan analisis ketercapaian kompetensi mahasiswa pada setiap tahap pembelajaran.
        </p>
        
        <div style="background-color: #f8fafc; padding: 10px; border: 1px solid #e2e8f0; border-radius: 4px;">
            <p style="font-size: 12px; margin: 0;">
                <strong>Tautan Rekap Nilai Lengkap:</strong> 
                <a href="{{ $portofolio->link_nilai_panjang }}" target="_blank" style="color: #4f46e5; text-decoration: underline;">
                    {{ $portofolio->link_nilai_panjang ?? 'Belum ada tautan' }}
                </a>
            </p>
        </div>
    </div>

    <hr style="border: 0; border-top: 1px solid #eee; margin: 25px 0;">

    {{-- 3.2 Analisis Ketercapaian CPMK --}}
    <div class="section-container">
        <h3 style="font-size: 14px; margin-bottom: 10px;">3.2 Analisis Ketercapaian CPMK</h3>
        <p style="text-align: justify; margin-bottom: 15px; font-size: 12px; line-height: 1.5;">
            Analisis ketercapaian Capaian Pembelajaran Mata Kuliah (CPMK) dilakukan untuk mengevaluasi sejauh mana mahasiswa telah menguasai kompetensi yang diharapkan. Hasil analisis ini menjadi dasar untuk melakukan perbaikan dan peningkatan kualitas pembelajaran pada periode berikutnya.
        </p>

        {{-- TABEL I: EVALUASI NILAI SUB-CPMK --}}
<h3 style="font-size: 11px; font-weight: bold; color: #374151; margin-bottom: 8px; text-transform: uppercase;">
    I. Evaluasi Nilai Sub-CPMK
</h3>
<table class="w-full border-collapse" style="width: 100%; border: 1px solid #d1d5db; margin-bottom: 20px; table-layout: fixed;">
    <thead>
        <tr style="background-color: #0284c7; color: white; font-size: 10px; text-transform: uppercase;">
            <th style="border: 1px solid #0369a1; padding: 4px; width: 30px; text-align: center;">No</th>
            <th style="border: 1px solid #0369a1; padding: 4px; width: 85px; text-align: center;">NIM</th>
            <th style="border: 1px solid #0369a1; padding: 4px; width: 180px; text-align: left;">Nama Mahasiswa</th>
            
            {{-- Loop Sub-CPMK unik --}}
            @foreach($metode_penilaians->unique('kode_sub_cpmk') as $m)
            <th style="border: 1px solid #0369a1; padding: 4px; text-align: center;">
                {{ $m->kode_sub_cpmk }}
            </th>
            @endforeach
        </tr>
    </thead>
    <tbody style="font-size: 10px;">
        @foreach($students as $index => $s)
        <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="border: 1px solid #e5e7eb; padding: 6px 4px; text-align: center; color: #6b7280;">{{ $index + 1 }}</td>
            <td style="border: 1px solid #e5e7eb; padding: 6px 4px; text-align: center; font-family: monospace;">{{ $s->nim }}</td>
            
            {{-- Bagian Perbaikan: Menghapus white-space:nowrap dan mengatur word-wrap --}}
            <td style="border: 1px solid #e5e7eb; padding: 6px 4px; text-transform: uppercase; line-height: 1.2; word-wrap: break-word; overflow-wrap: break-word;">
                {{ $s->nama ?? '-' }}
            </td>

            @foreach($metode_penilaians->unique('kode_sub_cpmk') as $m)
                @php
                    $nilai_mhs = $s->penilaian->first();
                    $akumulasi_sub = 0;
                    $total_bobot_sub = 0;

                    $map_kolom = [
                        'kehadiran' => 'kehadiran',
                        'tugas'     => 'tugas',
                        'quiz'      => 'kuiz',
                        'praktik'   => 'praktik',
                        'uts'       => 'uts',
                        'uas'       => 'uas',
                        'mbkm'      => 'nilai_mbkm'
                    ];

                    if ($nilai_mhs) {
                        $komponen_sub = $metode_penilaians->where('kode_sub_cpmk', $m->kode_sub_cpmk);
                        foreach ($komponen_sub as $ks) {
                            foreach ($map_kolom as $kolom_metode => $kolom_penilaian) {
                                $bobot_senilai = (float) ($ks->$kolom_metode ?? 0);
                                if ($bobot_senilai > 0) {
                                    $nilai_mentah = (float) ($nilai_mhs->$kolom_penilaian ?? 0);
                                    $akumulasi_sub += $nilai_mentah * ($bobot_senilai / 100);
                                    $total_bobot_sub += ($bobot_senilai / 100);
                                }
                            }
                        }
                    }

                    $nilaiSubFinal = $total_bobot_sub > 0 
                        ? round($akumulasi_sub / $total_bobot_sub, 2) 
                        : 0;
                @endphp
                <td style="border: 1px solid #e5e7eb; padding: 6px 4px; text-align: center; font-weight: bold; color: #374151;">
                    {{ number_format($nilaiSubFinal, 2) }}
                </td>
            @endforeach
        </tr>
        @endforeach
    </tbody>
</table>

    {{-- TABEL REKAPITULASI CPMK --}}
<h3 style="font-size: 11px; font-weight: bold; color: #374151; margin-bottom: 8px; text-transform: uppercase;">
    II. Rekapitulasi Ketercapaian CPMK
</h3>
<table class="w-full border-collapse" style="width: 100%; border: 1px solid #d1d5db; margin-bottom: 20px; table-layout: fixed;">
    <thead>
        <tr style="background-color: #0284c7; color: white; font-size: 10px; text-transform: uppercase;">
            <th style="border: 1px solid #0369a1; padding: 4px; width: 30px; text-align: center;">No</th>
            <th style="border: 1px solid #0369a1; padding: 4px; width: 85px; text-align: center;">NIM</th>
            <th style="border: 1px solid #0369a1; padding: 4px; width: 180px; text-align: left;">Nama Mahasiswa</th>
            
            @foreach($list_cpmk as $c)
            <th style="border: 1px solid #0369a1; padding: 4px; text-align: center;">
                {{ $c->kode_cpmk }}
            </th>
            @endforeach
        </tr>
    </thead>
    <tbody style="font-size: 10px;">
        @foreach($students as $index => $s)
        <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="border: 1px solid #e5e7eb; padding: 6px 4px; text-align: center; color: #6b7280;">{{ $index + 1 }}</td>
            <td style="border: 1px solid #e5e7eb; padding: 6px 4px; text-align: center; font-family: monospace;">{{ $s->nim }}</td>
            
            {{-- Perbaikan: Teks akan otomatis ke bawah jika panjang --}}
            <td style="border: 1px solid #e5e7eb; padding: 6px 4px; text-transform: uppercase; line-height: 1.2; word-wrap: break-word; overflow-wrap: break-word;">
                {{ $s->nama ?? '-' }}
            </td>

            @foreach($list_cpmk as $c)
                @php
                    $nilai_mhs = $s->penilaian->first();
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

                    if ($nilai_mhs) {
                        foreach ($metode_penilaians->where('kode_cpmk', $c->kode_cpmk) as $m) {
                            foreach ($map_kolom as $kolom_metode => $kolom_penilaian) {
                                $bobot_senilai = (float) ($m->$kolom_metode ?? 0);
                                if ($bobot_senilai > 0) {
                                    $nilai_mentah = (float) ($nilai_mhs->$kolom_penilaian ?? 0);
                                    $akumulasi_nilai_bobot += $nilai_mentah * ($bobot_senilai / 100);
                                    $total_bobot_kontribusi += ($bobot_senilai / 100);
                                }
                            }
                        }
                    }

                    $nilaiCpmk = $total_bobot_kontribusi > 0
                        ? round($akumulasi_nilai_bobot / $total_bobot_kontribusi, 2)
                        : 0;

                    if ($nilaiCpmk >= 80) {
                        $label = 'Tinggi';
                        $color = 'color:#059669;';
                    } elseif ($nilaiCpmk >= 60) {
                        $label = 'Sedang';
                        $color = 'color:#10B981;';
                    } elseif ($nilaiCpmk >= 40) {
                        $label = 'Rendah';
                        $color = 'color:#D97706;';
                    } else {
                        $label = 'Tidak Tercapai';
                        $color = 'color:#DC2626;';
                    }
                @endphp

                <td style="border: 1px solid #e5e7eb; padding: 6px 4px; text-align: center; vertical-align: middle;">
                    <div style="font-weight: bold;">{{ number_format($nilaiCpmk, 2) }}</div>
                    <div style="font-size: 7px; font-weight: bold; text-transform: uppercase; {{ $color }}">
                        {{ $label }}
                    </div>
                </td>
            @endforeach
        </tr>
        @endforeach
    </tbody>
</table>
{{-- ================== HITUNG ULANG STATISTIK CPMK ================== --}}
@php
$cpmk_stats = [];
$totalMahasiswa = $students->count();

foreach ($list_cpmk as $c) {

    $totalNilai = 0;
    $jumlahTinggi = 0;

    foreach ($students as $s) {

        $nilai_mhs = $s->penilaian->first();
        $akumulasi_nilai_bobot = 0;
        $total_bobot_kontribusi = 0;

        $komponen = ['kehadiran','tugas','quiz','praktik','uts','uas','prk','obs'];

        if ($nilai_mhs) {
            foreach ($metode_penilaians->where('kode_cpmk', $c->kode_cpmk) as $m) {
                foreach ($komponen as $k) {

                    $bobot = (float) ($m->$k ?? 0);

                    if ($bobot > 0) {
                        $akumulasi_nilai_bobot += ($nilai_mhs->$k ?? 0) * ($bobot / 100);
                        $total_bobot_kontribusi += ($bobot / 100);
                    }
                }
            }
        }

        $nilaiCpmk = $total_bobot_kontribusi > 0
        ? ($akumulasi_nilai_bobot / $total_bobot_kontribusi)
        : 0;

        $totalNilai += $nilaiCpmk;

        if ($nilaiCpmk >= 80) {
            $jumlahTinggi++;
        }
    }

    $rerata = $totalMahasiswa > 0 ? $totalNilai / $totalMahasiswa : 0;
    $persentase = $totalMahasiswa > 0 ? ($jumlahTinggi / $totalMahasiswa) * 100 : 0;

    $cpmk_stats[$c->kode_cpmk] = [
    'rerata' => round($rerata, 2),
    'persentase' => round($persentase, 2),
    'total' => $totalMahasiswa
    ];
}
@endphp
{{-- ================================================================ --}}

<div style="margin: 20px 0;">
    @foreach($list_cpmk as $c)
    <div style="margin-bottom:15px; padding:10px; border:1px solid #ddd;">
        <strong>{{ $c->kode_cpmk }}</strong><br>

        @foreach(['Tinggi','Sedang','Rendah','Tidak Tercapai'] as $lab)
        <span style="margin-right:15px;">
            {{ $lab }} :
            <strong>{{ $stats[$c->kode_cpmk][$lab] }}</strong>
        </span>
        @endforeach
    </div>
    @endforeach
{{-- Visualisasi Section --}}
<div class="section-container">

    <h3 style="font-size: 11px; font-weight: bold; color: #374151; margin-bottom: 8px; text-transform: uppercase;">
    III. Visualisasi Ketercapaian Per CPMK
</h3>
    @foreach($list_cpmk as $c)
    <div style="margin-bottom:50px; page-break-inside: avoid;">
        <h4 style="font-size:11px; text-align:center; margin-bottom:15px; background: #f3f4f6; padding: 5px;">
            ANALISIS KETERCAPAIAN: {{ $c->kode_cpmk }}
        </h4>

        <div style="display:flex; gap:20px; justify-content: center; align-items: center;">
            {{-- Radar Chart Container --}}
            <div style="flex:1; height:280px;">
                <canvas id="radar-{{ $c->kode_cpmk }}"></canvas>
            </div>
            {{-- Bar Chart Container --}}
            <div style="flex:1; height:280px;">
                <canvas id="bar-{{ $c->kode_cpmk }}"></canvas>
            </div>
        </div>
    </div>
    @endforeach
</div>

    @foreach($list_cpmk as $c)

    @php
    $tinggi = 0;
    $sedang = 0;
    $rendah = 0;
    $tidak = 0;

    foreach ($students as $s) {

        $nilai_mhs = $s->penilaian->first();
        $akumulasi_nilai_bobot = 0;
        $total_bobot_kontribusi = 0;

        $komponen = ['kehadiran','tugas','quiz','praktik','uts','uas','prk','obs'];

        if ($nilai_mhs) {
            foreach ($metode_penilaians->where('kode_cpmk', $c->kode_cpmk) as $m) {
                foreach ($komponen as $k) {

                    $bobot = (float) ($m->$k ?? 0);

                    if ($bobot > 0) {
                        $akumulasi_nilai_bobot += ($nilai_mhs->$k ?? 0) * ($bobot / 100);
                        $total_bobot_kontribusi += ($bobot / 100);
                    }
                }
            }
        }

        $nilaiCpmk = $total_bobot_kontribusi > 0
        ? ($akumulasi_nilai_bobot / $total_bobot_kontribusi)
        : 0;

        if ($nilaiCpmk >= 80) {
            $tinggi++;
        } elseif ($nilaiCpmk >= 60) {
            $sedang++;
        } elseif ($nilaiCpmk >= 40) {
            $rendah++;
        } else {
            $tidak++;
        }
    }
    @endphp


    <div style="margin-top: 15px; padding: 15px; background-color: #f9fafb; border: 1px solid #ddd; font-size: 11px;">
        <p class="font-bold" style="margin-bottom: 5px;">
            Kesimpulan {{ $c->kode_cpmk }}:
        </p>
        <ol style="margin: 0; padding-left: 20px; line-height: 1.5; text-align: justify;">
            <li>Berdasarkan visualisasi, terdapat sebanyak 
                <strong>{{ $tinggi }}</strong> mahasiswa yang mencapai level <strong>Tinggi</strong>.
            </li>
            <li>Sebanyak <strong>{{ $sedang }}</strong> mahasiswa berada pada kategori <strong>Sedang</strong>.</li>
            <li>Terdapat <strong>{{ $rendah }}</strong> mahasiswa pada kategori <strong>Rendah</strong>.</li>
            <li>Dan sebanyak <strong>{{ $tidak }}</strong> mahasiswa termasuk kategori <strong>Tidak Tercapai</strong>.</li>
            <li>Distribusi ini menjadi dasar dalam menentukan strategi peningkatan mutu pembelajaran untuk CPMK {{ $c->kode_cpmk }}.</li>
        </ol>
    </div>

    @endforeach
    </div>
</div>
</div>

{{-- BAB 4. PENGENDALIAN & PENINGKATAN --}}
<div class="paper page-break">
    <div class="bab-header">
        <h2 style="text-transform: uppercase; border-bottom: 2px solid #000; padding-bottom: 5px;">Bab 4. Pengendalian & Peningkatan</h2>
    </div>

    {{-- 4.1 Laporan Pengukuran CPMK dan Analisis Tindak Lanjut --}}
    <div class="section-container" style="margin-bottom: 20px;">
        <h3 style="font-size: 14px; margin-bottom: 10px;">4.1 Laporan Pengukuran CPMK dan Analisis Tindak Lanjut</h3>
        <p style="text-align: justify; margin-bottom: 15px; font-size: 12px; line-height: 1.6;">
            Bagian ini menyajikan laporan komprehensif mengenai tingkat ketercapaian kompetensi mahasiswa pada setiap Capaian Pembelajaran Mata Kuliah (CPMK). 
            Data statistik yang disajikan merupakan instrumen kendali mutu untuk mengukur efektivitas proses pembelajaran yang telah dilaksanakan. 
            Melalui analisis tindak lanjut ini, dosen pengampu melakukan refleksi mendalam terhadap kendala yang dihadapi serta merumuskan strategi peningkatan (rencana aksi) untuk memastikan kualitas pembelajaran yang berkelanjutan pada periode berikutnya.
        </p>

        <h4 style="font-size: 12px; margin-bottom: 10px; color: #334155; text-transform: uppercase; letter-spacing: 0.5px;">
            Matriks Evaluasi dan Rencana Peningkatan
        </h4>
        <p style="text-align: justify; margin-bottom: 15px; font-size: 11px; line-height: 1.5; color: #4b5563;">
            Tabel berikut merangkum hasil asesmen ketercapaian target, refleksi analitis terhadap proses PBM, serta butir-butir program perbaikan yang diusulkan sebagai bentuk peningkatan kualitas instruksional.
        </p>

        <table style="width: 100%; border-collapse: collapse; font-size: 10px;">
            <thead>
                <tr style="background-color: #f3f4f6; text-align: center;">
                    <th style="border: 1px solid #000; padding: 8px;" width="8%">CPMK</th>
                    <th style="border: 1px solid #000; padding: 8px;" width="20%">Target Ketercapaian</th>
                    <th style="border: 1px solid #000; padding: 8px;" width="22%">Hasil & Evaluasi</th>
                    <th style="border: 1px solid #000; padding: 8px;" width="25%">Refleksi & Analisis</th>
                    <th style="border: 1px solid #000; padding: 8px;" width="25%">Program Perbaikan</th>
                </tr>
            </thead>
            <tbody>
                @foreach($list_cpmk as $c)
                @php 
                    $d = $portofolio->details->where('kode_cpmk', $c->kode_cpmk)->first();

                    $cpmkData = $cpmk_stats[$c->kode_cpmk] ?? [
                        'rerata' => 0,
                        'persentase' => 0,
                    ];

                    $rerata = round($cpmkData['rerata'] ?? 0, 2);
                    $persentase = round($cpmkData['persentase'] ?? 0, 2);

                    // Logika Status: Rerata >= 70 DAN % Kategori Tinggi >= 60
                    $isLulus = ($rerata >= 70 && $persentase >= 60);

                    $statusLabel = $isLulus ? 'Tercapai (Pertahankan)' : 'Belum Tercapai (Tindak Lanjut)';
                    $statusColor = $isLulus ? '#059669' : '#dc2626'; 
                @endphp

                <tr>
                    <td style="border: 1px solid #000; padding: 10px; text-align: center; vertical-align: top; font-weight: bold; background-color: #f9fafb;">
                        {{ $c->kode_cpmk }}
                    </td>

                    <td style="border: 1px solid #000; padding: 10px; vertical-align: top; font-size: 9px;">
                        <ul style="margin: 0; padding-left: 12px; line-height: 1.5;">
                            <li>Min. 60% mhs Capaian Tinggi</li>
                            <li>Rerata nilai kelas &ge; 70</li>
                        </ul>
                    </td>

                    <td style="border: 1px solid #000; padding: 10px; vertical-align: top;">
                        <table style="width: 100%; border: none; font-size: 10px; border-collapse: collapse;">
                            <tr>
                                <td width="55%" style="padding: 2px 0;">Rerata Nilai</td>
                                <td style="padding: 2px 0;">: <strong>{{ $rerata }}</strong></td>
                            </tr>
                            <tr>
                                <td style="padding: 2px 0;">% Kat. Tinggi</td>
                                <td style="padding: 2px 0;">: <strong>{{ $persentase }}%</strong></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="padding-top: 5px;">
                                    <div style="font-size: 9px; font-weight: bold; color: {{ $statusColor }}; border-top: 1px solid #e5e7eb; padding-top: 3px;">
                                        {{ $statusLabel }}
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>

                    <td style="border: 1px solid #000; padding: 10px; vertical-align: top; text-align: justify; line-height: 1.4;">
                        {{ $d->refleksi_analisis ?? '-' }}
                    </td>
                    
                    <td style="border: 1px solid #000; padding: 10px; vertical-align: top; text-align: justify; line-height: 1.4;">
                        {{ $d->program_perbaikan ?? '-' }}
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

{{-- Scripts --}}
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

<script>
    function initChart() {
        // Mengambil data stats dari backend (asumsi data dikirim via controller)
        const stats = @json($stats); 
        const labels = ['Tinggi', 'Sedang', 'Rendah', 'Tidak Tercapai'];
        
        // Warna spesifik untuk Bar
        const barColors = ['#059669', '#10B981', '#D97706', '#DC2626'];

        Object.keys(stats).forEach(id => {
            const values = [
                stats[id]['Tinggi'] || 0,
                stats[id]['Sedang'] || 0,
                stats[id]['Rendah'] || 0,
                stats[id]['Tidak Tercapai'] || 0
            ];

            // 1. RADAR CHART (Menggantikan Pie)
            const ctxRadar = document.getElementById(`radar-${id}`);
            if (ctxRadar) {
                new Chart(ctxRadar, {
                    type: 'radar',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Jumlah Mahasiswa',
                            data: values,
                            fill: true,
                            backgroundColor: 'rgba(79, 70, 229, 0.2)', // Indigo transparan
                            borderColor: '#4f46e5',
                            pointBackgroundColor: '#4f46e5',
                            pointBorderColor: '#fff',
                            pointHoverBackgroundColor: '#fff',
                            pointHoverBorderColor: '#4f46e5'
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            r: {
                                angleLines: { display: true },
                                suggestedMin: 0,
                                ticks: { stepSize: 1, display: false } // Sembunyikan angka di garis radar agar bersih
                            }
                        },
                        plugins: {
                            legend: { display: false },
                            datalabels: {
                                backgroundColor: '#f3f4f6',
                                borderRadius: 4,
                                color: '#1f2937',
                                font: { weight: 'bold', size: 10 },
                                formatter: (value) => value > 0 ? value : '' // Munculkan angka jika > 0
                            }
                        }
                    }
                });
            }

            // 2. BAR CHART
            const ctxBar = document.getElementById(`bar-${id}`);
            if (ctxBar) {
                new Chart(ctxBar, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                            data: values,
                            backgroundColor: barColors,
                            borderRadius: 4
                        }]
                    },
                    plugins: [ChartDataLabels],
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        indexAxis: 'y', // Bar Horizontal agar lebih variatif dibanding Radar
                        plugins: {
                            legend: { display: false },
                            datalabels: {
                                anchor: 'end',
                                align: 'right',
                                color: '#4b5563',
                                font: { size: 10 }
                            }
                        },
                        scales: {
                            x: { grid: { display: false }, ticks: { display: false } },
                            y: { grid: { display: false } }
                        }
                    }
                });
            }
        });
    }

    document.addEventListener('DOMContentLoaded', initChart);
</script>

</body>
</html>