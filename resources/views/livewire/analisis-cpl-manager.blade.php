<div class="w-full">
    <div class="bg-white shadow-xl sm:rounded-lg p-6 w-full">
        <div class="text-center mb-8">
            <h1 class="text-2xl font-extrabold uppercase tracking-wider text-gray-900">
                Laporan Analisis CPL ({{ $selected_cpl ?? '...' }})
            </h1>
            <p class="text-gray-600 font-medium italic">Program Studi: {{ $prodi ?? '-' }} | Angkatan: {{ $angkatan ?? '-' }}</p>
            <div class="mt-2 h-1.5 w-40 bg-blue-600 mx-auto rounded-full"></div>
        </div>

        <div class="no-print grid grid-cols-1 md:grid-cols-4 gap-4 mb-8 bg-gray-50 p-5 rounded-xl border border-gray-200 shadow-sm">
            <div>
                <x-label value="Angkatan" class="font-bold" />
                <select wire:model.live="angkatan" class="mt-1 w-full border-gray-300 rounded-md">
                    <option value="">-- Pilih --</option>
                    @foreach($options_angkatan as $y) <option value="{{ $y }}">{{ $y }}</option> @endforeach
                </select>
            </div>
           <div>
    <x-label value="Program Studi" class="font-bold" />
    <select wire:model.live="prodi" disabled class="mt-1 w-full border-gray-300 bg-gray-100 rounded-md cursor-not-allowed">
        @foreach($options_prodi as $p) 
            <option value="{{ $p }}">{{ $p }}</option> 
        @endforeach
    </select>
</div>

<div class="hidden print:block mt-16">
    <div class="flex justify-end">
        <div class="text-center w-80">
            <p>Dicetak Pada: {{ date('d F Y') }}</p>
            <p class="mt-2">Ketua Program Studi {{ $prodi_login }},</p>
            <div class="h-20"></div>
            <p class="font-bold underline uppercase">
                ( 
                @if($kaprodi)
                    {{ ($kaprodi->profil->gelar_depan ? $kaprodi->profil->gelar_depan . ' ' : '') . $kaprodi->name . ($kaprodi->profil->gelar_belakang ? ', ' . $kaprodi->profil->gelar_belakang : '') }}
                @else
                    __________________________
                @endif
                )
            </p>
            <p>NIDN. {{ $kaprodi->profil->nidn ?? '..........................' }}</p>
        </div>
    </div>
</div>
            <div>
                <x-label value="Pilih CPL" class="font-bold text-blue-700" />
                <select wire:model.live="selected_cpl" class="mt-1 w-full border-blue-400 rounded-md font-bold">
                    <option value="">-- Pilih CPL --</option>
                    @foreach($list_cpl as $c) <option value="{{ $c->kode_cpl }}">{{ $c->kode_cpl }}</option> @endforeach
                </select>
            </div>
            <div class="flex items-end">
                <button onclick="window.print()" class="w-full bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md transition shadow font-bold">
                    PRINT KE WINDOWS/PDF
                </button>
            </div>
        </div>

        @if($selected_cpl && $angkatan && $prodi)
            <div class="mb-10">
                <h3 class="font-bold text-lg mb-4 text-blue-900 uppercase border-b-2 border-blue-900 inline-block">I. Integrasi CPL dan CPMK (Struktur Bobot)</h3>
                <div class="overflow-x-auto w-full">
                    <table class="w-full border-collapse border border-gray-400 text-[11px]">
                        <thead class="bg-gray-100 text-center font-bold">
                            <tr>
                                <th class="border border-gray-400 px-2 py-2">CPL</th>
                                <th class="border border-gray-400 px-2 py-2">Nama Mata Kuliah</th>
                                <th class="border border-gray-400 px-2 py-2">CPMK</th>
                                <th class="border border-gray-400 px-1 py-2">MBKM</th>
                                <th class="border border-gray-400 px-1 py-2">Part.</th>
                                <th class="border border-gray-400 px-1 py-2">Obs.</th>
                                <th class="border border-gray-400 px-1 py-2">Quiz</th>
                                <th class="border border-gray-400 px-1 py-2">UTS</th>
                                <th class="border border-gray-400 px-1 py-2">UAS</th>
                                <th class="border border-gray-400 px-1 py-2">Prak.</th>
                                <th class="border border-gray-400 px-2 py-2 bg-blue-50">Skor Maks</th>
                                <th class="border border-gray-400 px-2 py-2 bg-green-50">Bobot (%)</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($komponen_penilaian as $kp)
                                @php 
                                    $skor_row = ($kp->mbkm + $kp->kehadiran + $kp->tugas + $kp->quiz + $kp->uts + $kp->uas + $kp->praktik);
                                    $bobot_row = $this->total_skor_maks > 0 ? ($skor_row / $this->total_skor_maks) * 100 : 0;
                                @endphp
                                <tr class="text-center">
                                    <td class="border border-gray-400 px-2 py-1 font-bold">{{ $selected_cpl }}</td>
                                    <td class="border border-gray-400 px-2 py-1 text-left">{{ $kp->mataKuliah->nama_mk }}</td>
                                    <td class="border border-gray-400 px-2 py-1 font-bold">{{ $kp->kode_cpmk }}</td>
                                    <td class="border border-gray-400 px-1 py-1">{{ $kp->mbkm }}</td>
                                    <td class="border border-gray-400 px-1 py-1">{{ $kp->kehadiran }}</td>
                                    <td class="border border-gray-400 px-1 py-1">{{ $kp->tugas }}</td>
                                    <td class="border border-gray-400 px-1 py-1">{{ $kp->quiz }}</td>
                                    <td class="border border-gray-400 px-1 py-1">{{ $kp->uts }}</td>
                                    <td class="border border-gray-400 px-1 py-1">{{ $kp->uas }}</td>
                                    <td class="border border-gray-400 px-1 py-1">{{ $kp->praktik }}</td>
                                    <td class="border border-gray-400 px-2 py-1 font-bold bg-blue-50">{{ $skor_row }}</td>
                                    <td class="border border-gray-400 px-2 py-1 font-bold bg-green-50">{{ number_format($bobot_row, 1) }}%</td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot class="bg-gray-100 font-bold">
                            <tr>
                                <td colspan="10" class="border border-gray-400 px-2 py-2 text-right uppercase">Total Skor Maks & Bobot Kontribusi</td>
                                <td class="border border-gray-400 px-2 py-2 text-center bg-blue-100">{{ $this->total_skor_maks }}</td>
                                <td class="border border-gray-400 px-2 py-2 text-center bg-green-100">100%</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
<div class="mb-10 flex flex-col lg:flex-row gap-6 items-stretch">
    
    <div class="w-full lg:w-1/3 border rounded-xl p-4 bg-white shadow-sm">
        <h3 class="font-bold text-sm mb-3 text-gray-700 uppercase">II. Predikat Ketercapaian</h3>
        <table class="w-full border-collapse border border-gray-300 text-[11px]">
            <thead class="bg-gray-50">
                <tr>
                    <th class="border border-gray-300 p-2">Rentang Skor</th>
                    <th class="border border-gray-300 p-2">Predikat</th>
                </tr>
            </thead>
            <tbody class="text-center font-medium">
                <tr><td class="border p-2">80 - 100</td><td class="border p-2 text-green-600 bg-green-50 font-bold">Tinggi</td></tr>
                <tr><td class="border p-2">60 - 79</td><td class="border p-2 text-blue-600 bg-blue-50 font-bold">Sedang</td></tr>
                <tr><td class="border p-2">40 - 59</td><td class="border p-2 text-yellow-600 bg-yellow-50 font-bold">Rendah</td></tr>
                <tr><td class="border p-2">0 - 39</td><td class="border p-2 text-red-600 bg-red-50 font-bold">Tidak Tercapai</td></tr>
            </tbody>
        </table>
    </div>

    <div class="w-full lg:w-2/3 border border-dashed border-gray-300 rounded-xl p-4 flex flex-col items-center justify-center bg-white shadow-sm">
        <h4 class="text-[10px] font-bold uppercase text-gray-400 mb-2">Radar Kompetensi</h4>
        <div class="w-full h-full flex justify-center items-center">
            <canvas id="radarChart" style="max-height: 180px !important; width: auto !important;"></canvas>
        </div>
    </div>

</div>

            <div class="w-full">
                <h3 class="font-bold text-lg mb-4 text-green-900 uppercase border-b-2 border-green-900 inline-block">III. Daftar Nilai Ketercapaian Mahasiswa</h3>
                <div class="overflow-x-auto w-full">
                    <table class="w-full border-collapse border border-gray-500 text-[10px]">
                        <thead class="bg-gray-800 text-white text-center">
                            <tr>
                                <th class="border border-gray-500 px-2 py-3" rowspan="2">NIM</th>
                                <th class="border border-gray-500 px-2 py-3" rowspan="2">Nama Lengkap Mahasiswa</th>
                                <th class="border border-gray-500 px-2 py-1" colspan="{{ count($komponen_penilaian) }}">Detail Penilaian Per Mata Kuliah & CPMK</th>
                                <th class="border border-gray-500 px-2 py-3 bg-blue-700" rowspan="2">Nilai Akhir</th>
                                <th class="border border-gray-500 px-2 py-3" rowspan="2">Hasil Capaian</th>
                            </tr>
                            <tr class="bg-gray-700">
                                @foreach($komponen_penilaian as $kp)
                                    <th class="border border-gray-500 px-1 py-2 font-normal text-[9px]">
                                        {{ $kp->mataKuliah->nama_mk }}<br><b>({{ $kp->kode_cpmk }})</b>
                                    </th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($mahasiswa_list as $m)
                                <tr class="hover:bg-gray-50 transition border-b border-gray-300">
                                    <td class="border border-gray-300 px-2 py-1 font-mono text-center">{{ $m['nim'] }}</td>
                                    <td class="border border-gray-300 px-2 py-1 uppercase">{{ $m['nama'] }}</td>
                                    @foreach($m['items'] as $item)
                                        <td class="border border-gray-300 px-1 py-1 text-center font-mono">{{ $item['skor'] }}</td>
                                    @endforeach
                                    <td class="border border-gray-300 px-2 py-1 text-center font-bold bg-blue-50">{{ $m['nilai_akhir'] }}</td>
                                    <td class="border border-gray-300 px-2 py-1 text-center font-bold uppercase text-[9px]">
                                        @php
                                            $cl = match($m['predikat']) {
                                                'Tinggi' => 'text-green-600',
                                                'Sedang' => 'text-blue-600',
                                                'Rendah' => 'text-yellow-600',
                                                default => 'text-red-600',
                                            };
                                        @endphp
                                        <span class="{{ $cl }}">{{ $m['predikat'] }}</span>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="hidden print:block mt-16">
                <div class="flex justify-end">
                    <div class="text-center w-64">
                        <p>Dicetak Pada: {{ date('d F Y') }}</p>
                        <p class="mt-2">Ketua Program Studi,</p>
                        <div class="h-20"></div>
                        <p class="font-bold underline uppercase">( __________________________ )</p>
                        <p>NIDN. ..........................</p>
                    </div>
                </div>
            </div>
        @else
            <div class="py-40 text-center text-gray-400 italic">
                Pilih parameter filter untuk menampilkan analisis data.
            </div>
        @endif
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        let radarChart, barChart;
        function updateCharts(data) {
            const labels = ['Tinggi', 'Sedang', 'Rendah', 'Tidak Tercapai'];
            const colors = ['#16a34a', '#2563eb', '#ca8a04', '#dc2626'];

            // Radar
            const ctxR = document.getElementById('radarChart');
            if (radarChart) radarChart.destroy();
            radarChart = new Chart(ctxR, {
                type: 'radar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Skala Capaian',
                        data: data,
                        backgroundColor: 'rgba(37, 99, 235, 0.1)',
                        borderColor: '#2563eb',
                        borderWidth: 2
                    }]
                },
                options: { scales: { r: { beginAtZero: true, ticks: { display: false } } }, plugins: { legend: { display: false } } }
            });
        }
        window.addEventListener('updateCharts', e => updateCharts(e.detail.data));
    </script>
</div>