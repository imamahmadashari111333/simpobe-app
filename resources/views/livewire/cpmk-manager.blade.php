<div>
    {{-- Notifikasi --}}
    @if (session()->has('message'))
        <div class="mb-4 p-2 bg-green-100 border border-green-400 text-green-700 rounded text-xs shadow-sm">
            {{ session('message') }}
        </div>
    @endif
    @if (session()->has('error'))
        <div class="mb-4 p-2 bg-red-100 border border-red-400 text-red-700 rounded text-xs shadow-sm">
            {{ session('error') }}
        </div>
    @endif

    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <div>
            <h3 class="text-lg font-semibold text-gray-800">Data CPMK</h3>
            <p class="text-[10px] text-gray-500 uppercase tracking-widest font-medium">Prodi: {{ $prodi }} | Capaian Pembelajaran Mata Kuliah</p>
        </div>

        <div class="flex flex-wrap items-center gap-2 w-full md:w-auto justify-end">
            <div class="relative w-full md:w-64">
                <input wire:model.live.debounce.300ms="search" type="text" placeholder="Cari Kode atau Deskripsi..." 
                    class="w-full text-xs border-gray-300 focus:ring-slate-500 rounded-md shadow-sm">
            </div>

            @if(Auth::user()->role === 'Kaprodi')
                <x-secondary-button wire:click="showImportModal" class="h-9">Import</x-secondary-button>
                <x-button wire:click="showModal" class="h-9 bg-slate-800"> Tambah CPMK </x-button>
            @endif
        </div>
    </div>

    <div class="overflow-hidden shadow-md sm:rounded-lg border border-gray-200">
        <table class="w-full text-left border-collapse bg-white">
            <thead>
                <tr class="bg-gray-100 text-gray-700 uppercase text-[11px] font-bold tracking-wider border-b">
                    <th class="p-3 border text-center w-12">No</th>
                    <th class="p-3 border w-1/3">CPL Prodi (Referensi)</th>
                    <th class="p-3 border w-32">Kode CPMK</th>
                    <th class="p-3 border">Deskripsi CPMK</th>
                    @if(Auth::user()->role === 'Kaprodi')
                        <th class="p-3 border text-center w-24">Aksi</th>
                    @endif
                </tr>
            </thead>
            <tbody class="text-sm text-gray-700">
                @php
                    // Logika pengelompokan berdasarkan pola kode CPL (asumsi: CPMK-01 masuk ke CPL01)
                    $groups = $cpmks->groupBy(function($item) {
                         return 'CPL' . substr(preg_replace('/[^0-9]/', '', $item->kode_cpmk), 0, 2);
                    });
                    $mainNo = 1;
                @endphp

                @forelse($groups as $cpl_code => $items)
                    @php
                        $cpl_data = \App\Models\Cpl::where('kode_cpl', $cpl_code)->where('prodi', $prodi)->first();
                        $rowCount = count($items);
                    @endphp
                    
                    @foreach($items as $index => $cp)
                    <tr class="hover:bg-gray-50 border-b transition">
                        @if($index === 0)
                        <td class="p-3 border text-center font-bold align-top bg-gray-50/30" rowspan="{{ $rowCount }}">
                            {{ $mainNo++ }}
                        </td>
                        <td class="p-3 border align-top bg-indigo-50/10" rowspan="{{ $rowCount }}">
                            @if($cpl_data)
                                <div class="flex flex-col">
                                    <span class="text-xs font-bold text-indigo-700 mb-1">{{ $cpl_data->kode_cpl }}</span>
                                    <span class="text-[11px] leading-relaxed text-gray-600 italic">{{ $cpl_data->deskripsi_cpl }}</span>
                                </div>
                            @else
                                <span class="text-gray-400 italic text-[10px]">Referensi CPL ({{ $cpl_code }}) tidak ditemukan di prodi ini</span>
                            @endif
                        </td>
                        @endif

                        <td class="p-3 border font-mono whitespace-nowrap align-top">
                            <span class="text-blue-600 font-bold bg-blue-50 px-1.5 py-0.5 rounded border border-blue-100 text-[11px]">
                                {{ $cp->kode_cpmk }}
                            </span>
                        </td>

                        <td class="p-3 border leading-relaxed text-gray-800 align-top text-xs">
                            {{ $cp->deskripsi_cpmk }}
                        </td>
                        
                        @if(Auth::user()->role === 'Kaprodi')
                        <td class="p-3 border text-center whitespace-nowrap align-top">
                            <div class="flex justify-center space-x-1">
                                <button wire:click="edit({{ $cp->id }})" class="text-blue-600 hover:text-blue-800 p-1">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                                </button>
                                <button wire:click="confirmDelete({{ $cp->id }})" class="text-red-600 hover:text-red-800 p-1">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                </button>
                            </div>
                        </td>
                        @endif
                    </tr>
                    @endforeach
                @empty
                    <tr>
                        <td colspan="5" class="p-10 text-center text-gray-500 italic border">Data CPMK tidak ditemukan.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    {{-- MODAL IMPORT --}}
    <x-dialog-modal wire:model="confirmingImport">
        <x-slot name="title">Import CPMK</x-slot>
        <x-slot name="content">
            <div class="mb-4">
                <x-secondary-button wire:click="downloadTemplate" class="text-xs">Download Template</x-secondary-button>
            </div>
            <div class="mt-4">
                <x-label value="File Excel" />
                <input type="file" wire:model="file_import" class="mt-1 block w-full text-xs" />
                <x-input-error for="file_import" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingImport', false)">Batal</x-secondary-button>
            <x-button class="ml-2 bg-slate-800" wire:click="importProses">Proses Import</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL TAMBAH/EDIT --}}
    <x-dialog-modal wire:model="confirmingItemAddEdit">
        <x-slot name="title">{{ $selected_id ? 'Edit CPMK' : 'Tambah CPMK Baru' }}</x-slot>
        <x-slot name="content">
            <div class="mt-4">
                <x-label for="kode_cpmk" value="Kode CPMK (Contoh: CPMK-01)" />
                <x-input type="text" class="mt-1 block w-full font-mono text-sm" wire:model.defer="kode_cpmk" placeholder="CPMK-01" />
                <x-input-error for="kode_cpmk" class="mt-2" />
            </div>
            <div class="mt-4">
                <x-label for="deskripsi_cpmk" value="Deskripsi CPMK" />
                <textarea class="mt-1 block w-full border-gray-300 focus:ring-slate-500 rounded-md shadow-sm text-sm" 
                          rows="4" wire:model.defer="deskripsi_cpmk"></textarea>
                <x-input-error for="deskripsi_cpmk" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemAddEdit', false)">Batal</x-secondary-button>
            <x-button class="ml-2 bg-slate-800" wire:click="save">Simpan Data</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL HAPUS --}}
    <x-confirmation-modal wire:model="confirmingItemDeletion">
        <x-slot name="title">Hapus CPMK</x-slot>
        <x-slot name="content">Apakah Anda yakin ingin menghapus CPMK ini?</x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemDeletion', false)">Batal</x-secondary-button>
            <x-danger-button class="ml-2" wire:click="delete">Hapus</x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>