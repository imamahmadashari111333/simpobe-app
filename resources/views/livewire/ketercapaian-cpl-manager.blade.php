<div>
    <style>
        @media print {
            .no-print { display: none !important; }
            .print-only { display: block !important; }
            body { background-color: white !important; padding: 0 !important; }
            .shadow-xl { shadow: none !important; border: 1px solid #ddd; }
        }
    </style>

    <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-6">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-gray-800 border-b-2 border-blue-500 pb-2">Ketercapaian CPL Mahasiswa</h2>
            
            @if(count($search_results) > 0)
                <button onclick="window.print()" class="no-print inline-flex items-center px-4 py-2 bg-gray-800 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 transition shadow-md">
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"></path></svg>
                    Cetak Laporan
                </button>
            @endif
        </div>

        <div class="no-print grid grid-cols-1 md:grid-cols-4 gap-4 mb-8 bg-gray-50 p-6 rounded-xl border border-gray-200 shadow-sm">
            <div>
                <x-label value="Angkatan" class="font-bold mb-1" />
                <select wire:model="angkatan" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                    <option value="">-- Pilih --</option>
                    @foreach($options_angkatan as $year) <option value="{{ $year }}">{{ $year }}</option> @endforeach
                </select>
            </div>

            <div>
    <label class="block text-sm font-medium text-gray-700">Program Studi</label>
    <select wire:model="prodi" 
            disabled 
            class="mt-1 block w-full bg-gray-100 border-gray-300 rounded-md shadow-sm focus:ring-emerald-500 focus:border-emerald-500 sm:text-sm cursor-not-allowed">
        @foreach($options_prodi as $p)
            <option value="{{ $p }}">{{ $p }}</option>
        @endforeach
    </select>
    <p class="mt-1 text-xs text-gray-500">*Prodi terkunci sesuai profil login Anda.</p>
</div>

            <div>
                <x-label value="Cari Mahasiswa (Nama/NIM)" class="font-bold mb-1" />
                <x-input type="text" wire:model.live="search" placeholder="Tidak wajib diisi ..." class="mt-1 block w-full" />
            </div>

            <div class="flex items-end">
                <button wire:click="cari" class="w-full inline-flex justify-center items-center px-4 py-2.5 bg-blue-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-blue-700 transition shadow-md">
                    Tampilkan
                </button>
            </div>
        </div>

        <div class="hidden print-only mb-4 text-center">
            <h1 class="text-xl font-bold uppercase">Laporan Ketercapaian CPL Mahasiswa</h1>
            <p>Angkatan: {{ $angkatan }} | Prodi: {{ $prodi }}</p>
            <hr class="mt-2 border-black">
        </div>

        <div class="overflow-x-auto border border-gray-200 rounded-lg">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="px-4 py-3 text-left text-xs font-bold text-gray-700 uppercase border-r">NIM</th>
                        <th class="px-4 py-3 text-left text-xs font-bold text-gray-700 uppercase border-r">Nama</th>
                        @foreach($list_cpl as $cpl)
                            <th class="px-2 py-3 text-center text-xs font-bold text-blue-800 uppercase border-r bg-blue-50">
                                {{ $cpl->kode_cpl }}
                            </th>
                        @endforeach
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-100">
                    @forelse($search_results as $mhs)
                        <tr class="hover:bg-blue-50 transition">
                            <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900 border-r">{{ $mhs['nim'] }}</td>
                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-700 border-r">{{ $mhs['nama'] }}</td>
                            @foreach($list_cpl as $cpl)
                                <td class="px-2 py-3 whitespace-nowrap text-sm text-center border-r font-mono">
                                    @php $val = $mhs['cpl'][$cpl->kode_cpl]; @endphp
                                    <span class="{{ $val != '-' && $val < 60 ? 'text-red-600 font-bold' : 'text-gray-800' }}">
                                        {{ $val }}
                                    </span>
                                </td>
                            @endforeach
                        </tr>
                    @empty
                        <tr>
                            <td colspan="{{ 2 + count($list_cpl) }}" class="px-4 py-16 text-center text-gray-400 italic">
                                Data tidak ditemukan.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-8">
    {{-- Grafik Batang --}}
    <div class="bg-white p-4 border border-gray-200 rounded-lg shadow-sm">
        <h3 class="text-sm font-bold text-gray-700 mb-4 uppercase">Grafik Batang Ketercapaian CPL (%)</h3>
        <div style="height: 350px;" wire:ignore>
            <canvas id="barCpl"></canvas>
        </div>
    </div>

    {{-- Grafik Radar --}}
    <div class="bg-white p-4 border border-gray-200 rounded-lg shadow-sm">
        <h3 class="text-sm font-bold text-gray-700 mb-4 uppercase">Radar Ketercapaian CPL</h3>
        <div style="height: 350px;" wire:ignore>
            <canvas id="radarCpl"></canvas>
        </div>
    </div>
</div>

{{-- Script Chart.js --}}
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    let barChart, radarChart;

    function renderCharts(labels, data) {
        const ctxBar = document.getElementById('barCpl').getContext('2d');
        const ctxRadar = document.getElementById('radarCpl').getContext('2d');

        // Hapus chart lama jika ada
        if (barChart) barChart.destroy();
        if (radarChart) radarChart.destroy();

        // Konfigurasi Bar Chart dengan Logika Warna
        barChart = new Chart(ctxBar, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Rata-rata Nilai CPL',
                    data: data,
                    // LOGIKA WARNA DINAMIS
                    backgroundColor: function(context) {
                        const value = context.dataset.data[context.dataIndex];
                        return value < 60 ? 'rgba(239, 68, 68, 0.7)' : 'rgba(59, 130, 246, 0.7)'; // Merah jika < 60, Biru jika >= 60
                    },
                    borderColor: function(context) {
                        const value = context.dataset.data[context.dataIndex];
                        return value < 60 ? 'rgb(239, 68, 68)' : 'rgb(59, 130, 246)';
                    },
                    borderWidth: 1,
                    borderRadius: 5
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false }, // Sembunyikan legend karena warna berbeda-beda
                    // Tambahkan garis ambang batas (Optional)
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                let label = context.dataset.label || '';
                                if (label) label += ': ';
                                label += context.parsed.y;
                                return context.parsed.y < 60 ? label + ' (Tidak Tercapai)' : label;
                            }
                        }
                    }
                },
                scales: {
                    y: { 
                        beginAtZero: true, 
                        max: 100,
                        grid: {
                            color: function(context) {
                                if (context.tick.value === 60) return 'rgba(220, 38, 38, 0.5)'; // Garis merah di angka 60
                                return 'rgba(0, 0, 0, 0.1)';
                            },
                            lineWidth: function(context) {
                                if (context.tick.value === 60) return 2; // Tebalkan garis di angka 60
                                return 1;
                            }
                        }
                    }
                }
            }
        });

        // Konfigurasi Radar Chart (Tetap menggunakan satu warna jaring agar rapi)
        radarChart = new Chart(ctxRadar, {
            type: 'radar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Profil Ketercapaian',
                    data: data,
                    fill: true,
                    backgroundColor: 'rgba(79, 70, 229, 0.2)',
                    borderColor: 'rgb(79, 70, 229)',
                    pointBackgroundColor: function(context) {
                        const value = context.dataset.data[context.dataIndex];
                        return value < 60 ? 'rgb(239, 68, 68)' : 'rgb(79, 70, 229)';
                    },
                    pointBorderColor: '#fff',
                    pointRadius: 5
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    r: { 
                        min: 0, 
                        max: 100, 
                        ticks: { stepSize: 20 },
                        grid: {
                            color: 'rgba(0, 0, 0, 0.1)'
                        }
                    }
                }
            }
        });
    }

    window.addEventListener('update-charts', event => {
        renderCharts(event.detail.labels, event.detail.data);
    });
</script>
        
        <div class="hidden print-only mt-10">
            <div class="flex justify-end">
                <div class="text-center">
                    <p>Dicetak pada: {{ date('d/m/Y') }}</p>
                    <br><br><br>
                    <p class="font-bold underline">( ____________________ )</p>
                    <p>Dosen Pembimbing/Kaprodi</p>
                </div>
            </div>
        </div>
    </div>
</div>