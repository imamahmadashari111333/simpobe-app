<div wire:key="evaluasi-cpmk-main-container" class="p-4 bg-white min-h-screen">
    {{-- 1. BAGIAN FILTER (Hidden saat print) --}}
    <div class="bg-gray-50 p-6 rounded-xl border mb-8 print:hidden">
        <h2 class="text-lg font-bold mb-4">Filter Evaluasi CPMK</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 items-end">
            <div>
                <label class="block text-xs font-bold text-gray-500 uppercase mb-1">Angkatan</label>
                <input list="list_angkatan" wire:model="angkatan" 
                    class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 sm:text-sm">
                <datalist id="list_angkatan">
                    @foreach($daftar_angkatan as $th) 
                        <option value="{{ $th }}"> 
                    @endforeach
                </datalist>
            </div>

            <div>
                <label class="block text-xs font-bold text-gray-500 uppercase mb-1">Mata Kuliah</label>
                <input list="list_mk" wire:model="kode_mk" 
                    class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 sm:text-sm">
                <datalist id="list_mk">
                    @foreach($daftar_mk as $mk) 
                        <option value="{{ $mk->kode_mk }}">{{ $mk->nama_mk }}</option> 
                    @endforeach
                </datalist>
            </div>

            <div style="padding-top:20px;">
                <button wire:click="cari" class="w-full bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700 transition font-bold shadow-sm">
                    Cari Data
                </button>
            </div>
        </div>
    </div>

    {{-- 2. TAMPILAN DATA (Muncul setelah tombol cari diklik) --}}
    @if($kode_mk && $angkatan)
        {{-- Di sini tempat tabel nilai dan statistik yang sudah kita bahas sebelumnya --}}
        <div class="mt-4">
             <p class="text-sm text-gray-600 italic">Menampilkan data untuk MK: {{ $kode_mk }} Angkatan: {{ $angkatan }}</p>
             {{-- Tambahkan tabel Anda di sini --}}
        </div>
    @endif


        @if($kode_mk && $angkatan && count($students) > 0)
        {{-- TOMBOL PRINT & HEADER LAPORAN --}}
        <div class="flex flex-wrap items-center gap-2 print:hidden mb-6">
            <button wire:click="$set('confirmingPortofolio', true)" 
            class="inline-flex items-center px-4 py-2 bg-indigo-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-indigo-700 transition shadow-sm">
            <svg class="w-4 h-4 me-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
            {{ $hasPortofolio ? 'Edit Portofolio' : 'Buat Laporan Portofolio' }}
        </button>

        @if($hasPortofolio)
        <a href="{{ route('portofolio.download', ['kode_mk' => $kode_mk, 'angkatan' => $angkatan]) }}" 
         target="_blank"
         class="inline-flex items-center px-4 py-2 bg-emerald-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-emerald-700 shadow-sm">
         <svg class="w-4 h-4 me-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
         Download Portofolio (PDF)
     </a>
     @endif
     
     <div class="flex items-center gap-2 print:hidden">
    {{-- Tombol Print --}}
    <button onclick="window.print()" class="bg-gray-800 text-white px-4 py-2 rounded-md hover:bg-gray-700 transition flex items-center">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
        </svg>
    </button>

    {{-- Tombol Kembali (Dengan Inline Style untuk Memastikan Warna Muncul) --}}
    <a href="{{ route('penilaian.evaluasi_cpmk') }}" 
       style="background-color: #f59e0b;" 
       class="inline-flex items-center px-4 py-2 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:opacity-90 transition shadow-sm">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 me-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
        </svg>
        Kembali
    </a>
</div>
</div>

{{-- 2. METADATA --}}
@if(!empty($metadata))
<div class="mb-6 p-4 bg-white rounded-lg border grid grid-cols-1 md:grid-cols-2 gap-2 text-sm shadow-sm border-l-4 border-indigo-500">
    <table class="w-full">
        <tr><td class="font-bold w-40">Semester</td><td>: {{ $metadata['semester'] }}</td></tr>
        <tr><td class="font-bold">Tahun Akademik</td><td>: {{ $metadata['tahun_akademik'] }}</td></tr>
        <tr><td class="font-bold">Mata Kuliah</td><td>: {{ $metadata['mata_kuliah'] }} ({{ $kode_mk }})</td></tr>
    </table>
    <table class="w-full">
        <tr><td class="font-bold w-40">Dosen Koordinator</td><td>: {{ $metadata['dosen_koordinator'] ?? '-' }}</td></tr>
        <tr>
            <td class="font-bold">Dosen Anggota</td>
            <td>: {{ $metadata['dosen_anggota'] ?? '-' }}
                @if(isset($metadata['dosen_anggota2']) && $metadata['dosen_anggota2'] != '-') , {{ $metadata['dosen_anggota2'] }} @endif
            </td>
        </tr>
        <tr><td class="font-bold">Total Mahasiswa</td><td>: {{ count($students) }} Orang</td></tr>
    </table>
</div>
@endif

{{-- 3. TABEL NILAI PER CPMK --}}
@if($kode_mk && $angkatan && count($students) > 0)

    {{-- TABEL I: SUB CPMK --}}
    <h3 class="text-[11px] font-bold text-gray-700 mb-2 uppercase tracking-tight">I. Evaluasi Nilai Sub-CPMK</h3>
    <div class="overflow-x-auto shadow-sm border border-gray-300 rounded-md mb-6">
        <table class="w-full text-left border-collapse bg-white">
            {{-- Menggunakan bg-blue-600 agar lebih kompatibel dengan build Tailwind standar --}}
            <thead class="bg-blue-600 text-[10px] uppercase text-white font-bold">
                <tr>
                    <th class="py-1 px-2 border border-blue-700 text-center w-8">No</th>
                    <th class="py-1 px-2 border border-blue-700 text-center w-24">NIM</th>
                    <th class="py-1 px-2 border border-blue-700">Nama Mahasiswa</th>
                    @foreach($all_metodes as $m)
                    <th class="py-1 px-2 border border-blue-700 text-center min-w-[50px]">
                        {{ $m->kode_sub_cpmk }}
                    </th>
                    @endforeach
                </tr>
            </thead>
            <tbody class="text-[10px]">
                @foreach($students as $index => $s)
                <tr class="border-b hover:bg-blue-50 transition-colors">
                    <td class="py-1 px-2 border text-center text-gray-400">{{ $index + 1 }}</td>
                    <td class="py-1 px-2 border text-center font-mono font-semibold">{{ $s->nim }}</td>
                    <td class="py-1 px-2 border uppercase whitespace-nowrap">{{ $s->nama }}</td>
                    @foreach($all_metodes as $m)
                    <td class="py-1 px-2 border text-center font-bold text-gray-700">
                        {{ number_format($this->hitungNilaiSub($s, $m), 2) }}
                    </td>
                    @endforeach
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    {{-- TABEL II: CPMK --}}
    <h3 class="text-[11px] font-bold text-gray-700 mb-2 uppercase tracking-tight">II. Rekapitulasi Ketercapaian CPMK</h3>
    <div class="overflow-x-auto shadow-sm border border-gray-300 rounded-md mb-10">
        <table class="w-full text-left border-collapse bg-white">
            {{-- Biru sedikit lebih gelap untuk membedakan dengan Tabel I --}}
           <thead class="bg-blue-600 text-[10px] uppercase text-white font-bold">   
                <tr>
                    <th class="py-1 px-2 border border-blue-900 text-center w-8">No</th>
                    <th class="py-1 px-2 border border-blue-900 text-center w-24">NIM</th>
                    <th class="py-1 px-2 border border-blue-900">Nama Mahasiswa</th>
                    @foreach($list_cpmk as $c)
                    <th class="py-1 px-2 border border-blue-900 text-center">
                        <div>{{ $c->kode_cpl }}</div>
                        <div class="text-[8px] font-normal opacity-80">({{ $c->kode_cpmk }})</div>
                    </th>
                    @endforeach
                </tr>
            </thead>
            <tbody class="text-[10px]">
                @foreach($students as $index => $s)
                <tr class="border-b hover:bg-blue-50 transition-colors">
                    <td class="py-1 px-2 border text-center text-gray-400">{{ $index + 1 }}</td>
                    <td class="py-1 px-2 border text-center font-mono font-semibold">{{ $s->nim }}</td>
                    <td class="py-1 px-2 border uppercase whitespace-nowrap">{{ $s->nama ?? '-' }}</td>
                    @foreach($list_cpmk as $c)
                        @php 
                            $nilaiCpmk = $this->hitungNilai($s, $c->kode_cpmk);
                            $status = $this->getKetercapaian($nilaiCpmk);
                        @endphp
                        <td class="py-1 px-2 border text-center">
                            <div class="font-bold text-gray-800">{{ number_format($nilaiCpmk, 2) }}</div>
                            <div class="{{ $status['color'] }} text-[6px] font-black leading-none">{{ $status['label'] }}</div>
                        </td>
                    @endforeach
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

@endif

{{-- 4. VISUALISASI GRAFIK PER CPMK --}}
<div class="mt-8">
    <h3 class="text-[10px] font-black text-gray-400 uppercase mb-5 tracking-[0.2em] text-center italic">Grafik Ketercapaian per Indikator CPMK</h3>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        @foreach($list_cpmk as $c)
        <div class="bg-white border border-gray-200 rounded-lg p-3 shadow-sm hover:shadow-md transition">
            <div class="flex justify-between items-center mb-3 border-b border-gray-50 pb-2">
                <span class="font-black text-indigo-700 text-xs">{{ $c->kode_cpmk }}</span>
                <span class="text-[8px] bg-indigo-50 px-1.5 py-0.5 rounded font-bold text-indigo-500 border border-indigo-100 uppercase tracking-tighter">{{ $c->kode_cpl }}</span>
            </div>

            <div class="flex flex-wrap gap-1 mb-4 justify-center">
                <div class="flex items-center px-1.5 py-0.5 bg-green-100 border border-green-200 rounded">
                    <span class="text-[8px] font-bold text-green-800">Tinggi: {{ $stats[$c->kode_cpmk]['Tinggi'] }}</span>
                </div>
                <div class="flex items-center px-1.5 py-0.5 bg-emerald-100 border border-emerald-200 rounded">
                    <span class="text-[8px] font-bold text-emerald-800">Sedang: {{ $stats[$c->kode_cpmk]['Sedang'] }}</span>
                </div>
                <div class="flex items-center px-1.5 py-0.5 bg-amber-100 border border-amber-200 rounded">
                    <span class="text-[8px] font-bold text-amber-800">Rendah: {{ $stats[$c->kode_cpmk]['Rendah'] }}</span>
                </div>
                <div class="flex items-center px-1.5 py-0.5 bg-red-100 border border-red-200 rounded">
                    <span class="text-[8px] font-bold text-red-800">Tidak Tercapai: {{ $stats[$c->kode_cpmk]['Tidak Tercapai'] }}</span>
                </div>
            </div>

            <div style="height: 140px;" wire:ignore>
                <canvas id="chart-{{ $c->kode_cpmk }}"></canvas>
            </div>
        </div>
        @endforeach
        @foreach($list_cpmk as $c)
    {{-- AREA GRAFIK --}}
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 items-center mt-4">
        {{-- BAGIAN KIRI: Bar Chart (Biarkan sesuai kode Anda sebelumnya) --}}
        
        {{-- RADAR CPMK --}}
        <div class="border rounded-xl p-4 bg-white shadow-sm">
            <div class="flex justify-between items-center mb-3 border-b border-gray-50 pb-2">
                <span class="font-black text-indigo-700 text-xs">{{ $c->kode_cpmk }}</span>
                <span class="text-[8px] bg-indigo-50 px-1.5 py-0.5 rounded font-bold text-indigo-500 border border-indigo-100 uppercase tracking-tighter">{{ $c->kode_cpl }}</span>
            </div>
            <div class="flex justify-center items-center" style="height: 300px;" wire:ignore>
                <canvas id="radar-{{ $c->kode_cpmk }}"></canvas>
            </div>
        </div>
    </div>
@endforeach
    </div>

</div>

@elseif($kode_mk && $angkatan)
<div class="text-center py-20 bg-gray-50 border-2 border-dashed rounded-xl mt-6">
    <p class="text-gray-400 font-medium">Data tidak ditemukan untuk Angkatan {{ $angkatan }} dan MK {{ $kode_mk }}.</p>
</div>
@else
<div class="text-center py-20 bg-gray-50 border-2 border-dashed rounded-xl mt-6">
    <p class="text-gray-400 font-medium italic">Silakan pilih Angkatan dan Mata Kuliah, lalu klik "Cari Data" untuk melihat evaluasi.</p>
</div>
@endif

<style>
    @media print {
        .print\:hidden { display: none !important; }
        body { padding: 0; margin: 0; background: white; }
        .shadow-md, .shadow-sm { box-shadow: none !important; border: 1px solid #ddd !important; }
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
{{-- Plugin datalabels biasanya kurang terbaca di Radar, tapi tetap saya sertakan jika Anda ingin --}}
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

<script>
    function initCharts() {
        const stats = @json($stats);
        const labels = ['Tinggi', 'Sedang', 'Rendah', 'Tidak Tercapai'];
        // Warna solid untuk Bar
        const colors = ['#059669', '#10B981', '#D97706', '#DC2626'];
        // Warna transparan untuk Radar Area
        const radarColor = 'rgba(79, 70, 229, 0.2)'; 
        const radarBorder = 'rgba(79, 70, 229, 1)';

        let totalTinggi = 0, totalSedang = 0, totalRendah = 0, totalTidak = 0;

    /* ===============================
       1. BAR CHART PER CPMK (AS IS)
    =============================== */
        Object.keys(stats).forEach(id => {
            const ctx = document.getElementById(`chart-${id}`);
            if (!ctx) return;

            totalTinggi += stats[id]['Tinggi'] || 0;
            totalSedang += stats[id]['Sedang'] || 0;
            totalRendah += stats[id]['Rendah'] || 0;
            totalTidak += stats[id]['Tidak Tercapai'] || 0;

            let existingChart = Chart.getChart(ctx);
            if (existingChart) existingChart.destroy();

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['T', 'S', 'R', 'TT'],
                    datasets: [{
                        data: [
                            stats[id]['Tinggi'] || 0,
                            stats[id]['Sedang'] || 0,
                            stats[id]['Rendah'] || 0,
                            stats[id]['Tidak Tercapai'] || 0
                        ],
                        backgroundColor: colors,
                        borderRadius: 4
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { display: false } },
                    scales: {
                        y: { beginAtZero: true, ticks: { stepSize: 1, font: { size: 8 } } },
                        x: { ticks: { font: { size: 9, weight: 'bold' } } }
                    }
                }
            });
        });

    /* ===============================
       2. RADAR CHART PER CPMK (MODIFIED)
    =============================== */
        Object.keys(stats).forEach(id => {
            const ctxRadarCPMK = document.getElementById(`radar-${id}`);
            if (!ctxRadarCPMK) return;

            let radarExist = Chart.getChart(ctxRadarCPMK);
            if (radarExist) radarExist.destroy();

            new Chart(ctxRadarCPMK, {
                type: 'radar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Jumlah Mahasiswa',
                        data: [
                            stats[id]['Tinggi'] || 0,
                            stats[id]['Sedang'] || 0,
                            stats[id]['Rendah'] || 0,
                            stats[id]['Tidak Tercapai'] || 0
                        ],
                        fill: true,
                        backgroundColor: radarColor,
                        borderColor: radarBorder,
                        pointBackgroundColor: radarBorder,
                        pointBorderColor: '#fff',
                        pointHoverBackgroundColor: '#fff',
                        pointHoverBorderColor: radarBorder
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false },
                        datalabels: { display: false } // Radar lebih bersih tanpa datalabels
                    },
                    scales: {
                        r: {
                            angleLines: { display: true },
                            suggestedMin: 0,
                            ticks: { stepSize: 1, font: { size: 8 } },
                            pointLabels: { font: { size: 10, weight: 'bold' } }
                        }
                    }
                }
            });
        });

    /* ===============================
       3. PIE AKUMULASI (AS IS)
    =============================== */
        const ctxPie = document.getElementById('cpmkChartPie');
        if (ctxPie) {
            let pieTotal = Chart.getChart(ctxPie);
            if (pieTotal) pieTotal.destroy();

            new Chart(ctxPie, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        data: [totalTinggi, totalSedang, totalRendah, totalTidak],
                        backgroundColor: colors,
                        borderWidth: 2,
                        borderColor: '#fff'
                    }]
                },
                plugins: [ChartDataLabels],
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { position: 'bottom' },
                        datalabels: {
                            color: '#fff',
                            formatter: (val, ctx) => {
                                const sum = ctx.dataset.data.reduce((a, b) => a + b, 0);
                                return val > 0 ? ((val / sum) * 100).toFixed(1) + '%' : '';
                            }
                        }
                    }
                }
            });
        }
    }

    document.addEventListener('DOMContentLoaded', initCharts);
    document.addEventListener('livewire:navigated', initCharts);
    window.addEventListener('render-charts', initCharts);
</script>

{{-- MODAL PORTOFOLIO --}}
{{-- MODAL PORTOFOLIO --}}
<x-dialog-modal wire:model="confirmingPortofolio">
    <x-slot name="title">
        <div class="flex flex-col">
            <div class="flex items-center gap-2 text-indigo-600 uppercase tracking-widest text-sm font-bold">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                </svg>
                <span>Laporan Portofolio Mata Kuliah</span>
            </div>
            <div class="mt-1 text-[10px] text-gray-500 font-medium lowercase">
                Otoritas Prodi: <span class="font-bold text-red-500 uppercase">{{ Auth::user()->profil->prodi ?? 'PRODI TIDAK TERDETEKSI' }}</span>
            </div>
        </div>
    </x-slot>

    <x-slot name="content">
        <div class="space-y-6">
            {{-- Info Mata Kuliah --}}
            <div class="bg-gray-100 p-3 rounded border border-gray-200 text-[11px]">
                <span class="text-indigo-700 font-bold uppercase">Mata Kuliah:</span> 
                <span class="text-gray-700 font-semibold">{{ $metadata['mata_kuliah'] ?? '-' }} ({{ $kode_mk }})</span>
            </div>

            {{-- 1. PENETAPAN --}}
            <div class="bg-indigo-50 p-3 rounded border border-indigo-100">
                <h3 class="text-[11px] font-black text-indigo-700 mb-3 tracking-widest uppercase">1. PENETAPAN</h3>
                <div>
                    <x-label value="Link URL RPS" class="text-[10px] uppercase font-bold text-gray-500" />
                    <x-input type="url" class="w-full mt-1 text-sm" wire:model.defer="link_rps" placeholder="https://..." />
                    <x-input-error for="link_rps" class="mt-1" />
                </div>
            </div>

            {{-- 2. PELAKSANAAN --}}
            <div class="bg-indigo-50 p-3 rounded border border-indigo-100">
                <h3 class="text-[11px] font-black text-indigo-700 mb-3 tracking-widest uppercase">2. PELAKSANAAN</h3>
                <div class="space-y-4">
                    {{-- Link Jurnal --}}
                    <div>
                        <x-label value="Link Jurnal Pengajaran" class="text-[10px] uppercase font-bold text-gray-500" />
                        <x-input type="url" class="w-full mt-1 text-sm" wire:model.defer="lik_jurnal_pengajaran" placeholder="https://..." />
                        <x-input-error for="lik_jurnal_pengajaran" class="mt-1" />
                    </div>

                    {{-- Checkbox Integrasi Menggunakan Alpine.js --}}
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        {{-- Integrasi Penelitian --}}
                        <div x-data="{ open: @entangle('has_penelitian') }" class="bg-white p-2 rounded border border-indigo-200">
                            <label class="flex items-center space-x-2 cursor-pointer">
                                <input type="checkbox" x-model="open" class="rounded border-gray-300 text-indigo-600 shadow-sm focus:ring-indigo-500">
                                <span class="text-[10px] uppercase font-bold text-gray-600">Integrasi Penelitian</span>
                            </label>
                            <div x-show="open" x-transition class="mt-2">
                                <x-input type="text" class="w-full text-xs" wire:model.defer="integrasi_penelitian" placeholder="Input Judul Penelitian..." />
                                <x-input-error for="integrasi_penelitian" class="mt-1" />
                            </div>
                        </div>

                        {{-- Integrasi Pengabmas --}}
                        <div x-data="{ open: @entangle('has_pengabmas') }" class="bg-white p-2 rounded border border-indigo-200">
                            <label class="flex items-center space-x-2 cursor-pointer">
                                <input type="checkbox" x-model="open" class="rounded border-gray-300 text-indigo-600 shadow-sm focus:ring-indigo-500">
                                <span class="text-[10px] uppercase font-bold text-gray-600">Integrasi Pengabmas</span>
                            </label>
                            <div x-show="open" x-transition class="mt-2">
                                <x-input type="text" class="w-full text-xs" wire:model.defer="integrasi_pengabmas" placeholder="Input Judul Pengabmas..." />
                                <x-input-error for="integrasi_pengabmas" class="mt-1" />
                            </div>
                        </div>
                    </div>

                    {{-- Presensi & Bahan Ajar --}}
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <x-label value="Link Presensi Mahasiswa" class="text-[10px] uppercase font-bold text-gray-500" />
                            <x-input type="url" class="w-full mt-1 text-sm" wire:model.defer="link_presensi_kehadiran_mahasiswa" placeholder="https://..." />
                            <x-input-error for="link_presensi_kehadiran_mahasiswa" class="mt-1" />
                        </div>
                        <div>
                            <x-label value="Link Bahan Ajar" class="text-[10px] uppercase font-bold text-gray-500" />
                            <x-input type="url" class="w-full mt-1 text-sm" wire:model.defer="link_bahan_ajar" placeholder="https://..." />
                            <x-input-error for="link_bahan_ajar" class="mt-1" />
                        </div>
                    </div>

                    {{-- Analisis Soal & Sampel Pekerjaan --}}
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <x-label value="Link Analisis Soal" class="text-[10px] uppercase font-bold text-gray-500" />
                            <x-input type="url" class="w-full mt-1 text-sm" wire:model.defer="link_analisis_soal" placeholder="https://..." />
                            <x-input-error for="link_analisis_soal" class="mt-1" />
                        </div>
                        <div>
                            <x-label value="Link Sampel Pekerjaan Mahasiswa" class="text-[10px] uppercase font-bold text-gray-500" />
                            <x-input type="url" class="w-full mt-1 text-sm" wire:model.defer="link_sampel_pekerjaan_mahasiswa" placeholder="https://..." />
                            <x-input-error for="link_sampel_pekerjaan_mahasiswa" class="mt-1" />
                        </div>
                    </div>
                </div>
            </div>

            {{-- 3. EVALUASI --}}
            <div class="bg-indigo-50 p-3 rounded border border-indigo-100">
                <h3 class="text-[11px] font-black text-indigo-700 mb-3 tracking-widest uppercase">3. EVALUASI</h3>
                <div>
                    <x-label value="Link Nilai Panjang" class="text-[10px] uppercase font-bold text-gray-500" />
                    <x-input type="url" class="w-full mt-1 text-sm" wire:model.defer="link_nilai_panjang" placeholder="https://..." />
                    <x-input-error for="link_nilai_panjang" class="mt-1" />
                </div>
            </div>

            {{-- 4. PENGENDALIAN DAN PENINGKATAN --}}
            <div class="bg-indigo-50 p-3 rounded border border-indigo-100">
                <h3 class="text-[11px] font-black text-indigo-700 mb-3 tracking-widest uppercase">4. PENGENDALIAN & PENINGKATAN</h3>
                
                @foreach($list_cpmk as $c)
                <div class="mb-4 p-3 bg-white rounded-lg border border-gray-200">
                    <div class="font-bold text-gray-700 text-[10px] mb-2 uppercase italic">
                        {{ $c->kode_cpmk }} : {{ $c->nama_cpmk }}
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <textarea wire:model.defer="cpmk_inputs.{{ $c->kode_cpmk }}.refleksi" 
                                placeholder="Refleksi & Analisis" 
                                class="w-full text-xs border-gray-300 rounded-md shadow-sm focus:border-indigo-500" rows="3"></textarea>
                            <x-input-error for="cpmk_inputs.{{ $c->kode_cpmk }}.refleksi" class="mt-1" />
                        </div>
                        <div>
                            <textarea wire:model.defer="cpmk_inputs.{{ $c->kode_cpmk }}.perbaikan" 
                                placeholder="Rencana Perbaikan" 
                                class="w-full text-xs border-gray-300 rounded-md shadow-sm focus:border-indigo-500" rows="3"></textarea>
                            <x-input-error for="cpmk_inputs.{{ $c->kode_cpmk }}.perbaikan" class="mt-1" />
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </x-slot>

    <x-slot name="footer">
        <x-secondary-button wire:click="$set('confirmingPortofolio', false)" wire:loading.attr="disabled">
            Batal
        </x-secondary-button>

        <x-button class="ml-2" wire:click="savePortofolio" wire:loading.attr="disabled">
            {{ __('Simpan Portofolio') }}
        </x-button>
    </x-slot>
</x-dialog-modal>
    </div>
    </div>