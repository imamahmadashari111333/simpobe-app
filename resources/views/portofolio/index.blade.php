<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Daftar Portofolio Mata Kuliah') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                
<div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
    <h2 class="text-2xl font-bold text-gray-800">Portofolio OBE</h2>
    
    <div class="flex flex-row w-full md:w-2/3 gap-2">
        {{-- Filter Tahun Ajaran --}}
        <div class="w-1/2">
            <select onchange="location = this.value;" 
                class="w-full py-2 px-3 border border-gray-300 rounded-lg text-sm focus:ring-emerald-500 focus:border-emerald-500">
                <option value="{{ route('portofolio.index') }}">-- Semua Tahun Ajaran --</option>
                @foreach($list_tahun as $tahun)
                    <option value="{{ route('portofolio.index', ['tahun' => $tahun]) }}" 
                        {{ $filterTahun == $tahun ? 'selected' : '' }}>
                        {{ $tahun }}
                    </option>
                @endforeach
            </select>
        </div>

        {{-- Input Pencarian --}}
        <div class="relative w-1/2">
            <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
            </span>
            <input type="text" id="searchInput" onkeyup="searchTable()" 
                placeholder="Cari Mata Kuliah..." 
                class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg w-full focus:ring-emerald-500 focus:border-emerald-500 text-sm">
        </div>
    </div>
</div>
                
                <div class="w-full overflow-x-auto shadow-sm border border-gray-200 rounded-lg">
    <table class="w-full min-w-full divide-y divide-gray-200" id="portofolioTable">
        <thead class="bg-gray-50">
            <tr>
                <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase w-12">No</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Mata Kuliah</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Tahun Ajaran</th>
                <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase">Penelitian</th>
                <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase">pengabmas</th>
                <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase">Aksi</th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            @forelse($data_portofolio as $index => $dt)
            <tr class="hover:bg-gray-50 transition">
                <td class="px-4 py-4 text-sm text-gray-500 text-center font-medium">{{ $index + 1 }}</td>
                <td class="px-6 py-4">
                    <div class="text-sm font-medium text-gray-900 search-target">{{ $dt->nama_mk }}</div>
                    <div class="text-sm text-gray-500 font-mono search-target">{{ $dt->kode_mk }}</div>
                </td>
                <td class="px-6 py-4 text-sm text-gray-600">
                    {{ $dt->tahun_akademik }} 
                    <span class="text-xs text-gray-400">({{ $dt->semester }})</span>
                </td>
                
                {{-- KOLOM INTEGRASI PENELITIAN --}}
                <td class="px-6 py-4 text-center">
                    @if($dt->is_penelitian)
                        <span class="text-emerald-600 bg-emerald-100 rounded-full p-1 inline-block">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path></svg>
                        </span>
                    @else
                        <span class="text-gray-200">—</span>
                    @endif
                </td>

                {{-- KOLOM INTEGRASI pengabmas --}}
                <td class="px-6 py-4 text-center">
                    @if($dt->is_pengabmas)
                        <span class="text-blue-600 bg-blue-100 rounded-full p-1 inline-block">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path></svg>
                        </span>
                    @else
                        <span class="text-gray-200">—</span>
                    @endif
                </td>

                <td class="px-6 py-4 text-center">
                    @if($dt->hasPortofolio)
                        <a href="{{ route('portofolio.download', ['kode_mk' => $dt->kode_mk, 'angkatan' => $dt->angkatan]) }}" 
                           target="_blank"
                           class="inline-flex items-center px-4 py-2 bg-emerald-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-emerald-700 shadow-sm transition">
                            <svg class="w-4 h-4 me-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path>
                            </svg>
                            Download - {{ $dt->angkatan }}
                        </a>
                    @else
                        <div class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-amber-50 text-amber-700 border border-amber-200">
                            Belum Terisi ({{ $dt->angkatan }})
                        </div>
                    @endif
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="6" class="px-6 py-12 text-center">
                    <p class="text-sm text-gray-500">Tidak ada data mata kuliah ditemukan.</p>
                </td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>
            </div>
        </div>
    </div>

    <script>
        function searchTable() {
            let input = document.getElementById("searchInput");
            let filter = input.value.toUpperCase();
            let table = document.getElementById("portofolioTable");
            let tr = table.getElementsByTagName("tr");

            for (let i = 1; i < tr.length; i++) {
                let td = tr[i].getElementsByClassName("search-target");
                let found = false;
                for (let j = 0; j < td.length; j++) {
                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                        found = true;
                        break;
                    }
                }
                tr[i].style.display = found ? "" : "none";
            }
        }
    </script>
</x-app-layout>