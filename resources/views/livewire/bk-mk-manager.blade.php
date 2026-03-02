<div>
    {{-- Notifikasi --}}
    @if (session()->has('message'))
        <div class="mb-4 bg-green-100 border-l-4 border-green-500 text-green-700 p-3 text-sm rounded shadow-sm">{{ session('message') }}</div>
    @endif
    @if (session()->has('error'))
        <div class="mb-4 bg-red-100 border-l-4 border-red-500 text-red-700 p-3 text-sm rounded shadow-sm">{{ session('error') }}</div>
    @endif

    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <div>
            <h3 class="text-lg font-semibold text-gray-800">Pemetaan Bahan Kajian (BK) ke Mata Kuliah</h3>
            <p class="text-xs text-gray-500 font-medium italic">Prodi: {{ $prodi }}</p>
        </div>

        <div class="flex flex-wrap w-full md:w-auto gap-3 justify-end items-center">
            {{-- Search Bar --}}
            <div class="relative flex-grow max-w-xs">
                <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-gray-400">
                    <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                </span>
                <input type="text" wire:model.live.debounce.300ms="search" placeholder="Cari MK atau BK..." class="pl-10 block w-full text-sm border-gray-300 rounded-md focus:ring-slate-500">
            </div>

            @if(Auth::user()->role === 'Kaprodi')
                <x-secondary-button wire:click="showImportModal" class="h-10">IMPORT</x-secondary-button>
                <button wire:click="showModal" class="bg-slate-800 hover:bg-slate-900 text-white font-bold py-2 px-4 rounded-md shadow-sm uppercase text-xs tracking-widest transition h-10">
                    Tambah Pemetaan
                </button>
            @endif
        </div>
    </div>

    {{-- Tabel Pemetaan --}}
    <div class="overflow-x-auto shadow-md sm:rounded-lg border border-gray-100">
        <table class="w-full text-left border-collapse bg-white">
            <thead>
                <tr class="bg-gray-100 text-[11px] uppercase text-gray-700 border-b font-bold">
                    <th class="p-3 border text-center w-12">NO</th>
                    <th class="p-3 border w-32">KODE MK</th>
                    <th class="p-3 border">NAMA MATA KULIAH</th>
                    <th class="p-3 border w-32 text-indigo-700">KODE BK</th>
                    <th class="p-3 border">NAMA BAHAN KAJIAN</th>
                    @if(Auth::user()->role === 'Kaprodi')
                        <th class="p-3 border text-center w-24">AKSI</th>
                    @endif
                </tr>
            </thead>
            <tbody class="text-xs">
                @php $no = 1; @endphp
                @forelse($bk_mks as $kode_mk => $items)
                    @foreach($items as $index => $item)
                    <tr class="hover:bg-gray-50 border-b transition">
                        @if($index === 0)
                            <td class="p-3 border text-center align-top bg-white font-medium text-gray-400" rowspan="{{ count($items) }}">{{ $no++ }}</td>
                            <td class="p-3 border font-bold align-top bg-white text-slate-700 font-mono" rowspan="{{ count($items) }}">
                                {{ $kode_mk }}
                                <div class="text-[9px] text-gray-400 font-normal uppercase tracking-tighter">Smt {{ $item->mataKuliah->smt ?? '?' }}</div>
                            </td>
                            <td class="p-3 border align-top bg-white font-semibold text-gray-800" rowspan="{{ count($items) }}">
                                {{ $item->mataKuliah->nama_mk ?? '-' }}
                            </td>
                        @endif
                        
                        <td class="p-3 border font-bold text-indigo-600 bg-white font-mono">{{ $item->kode_bk }}</td>
                        <td class="p-3 border text-gray-600 bg-white">{{ $item->bahanKajian->bahan_kajian ?? '-' }}</td>
                        
                        @if(Auth::user()->role === 'Kaprodi')
                        <td class="p-3 border text-center bg-white">
                            <div class="flex justify-center space-x-1">
                                <button wire:click="edit({{ $item->id }})" class="text-blue-600 hover:text-blue-800 p-1 hover:bg-blue-50 rounded transition">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                                </button>
                                <button wire:click="confirmDelete({{ $item->id }})" class="text-red-600 hover:text-red-800 p-1 hover:bg-red-50 rounded transition">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                </button>
                            </div>
                        </td>
                        @endif
                    </tr>
                    @endforeach
                @empty
                <tr><td colspan="6" class="p-8 text-center text-gray-400 italic bg-white border">Data pemetaan BK ke MK belum tersedia.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>

    {{-- MODAL IMPORT --}}
    <x-dialog-modal wire:model="confirmingImport">
        <x-slot name="title">Import Pemetaan BK-MK</x-slot>
        <x-slot name="content">
            <div class="mb-4">
                <x-secondary-button wire:click="downloadTemplate" class="text-xs">Download Template</x-secondary-button>
                <p class="mt-2 text-[10px] text-gray-500 italic">*Format Excel: ID, Kode MK, Kode BK, Prodi.</p>
            </div>
            <div class="mt-4">
                <x-label value="Upload File Excel" />
                <input type="file" wire:model="file_import" class="mt-1 block w-full text-xs text-gray-500" />
                <x-input-error for="file_import" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingImport', false)">Batal</x-secondary-button>
            <x-button class="ml-2" wire:click="importProses">Import Data</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL TAMBAH/EDIT & HAPUS (Gunakan yang sudah ada di prompt Anda) --}}
</div>