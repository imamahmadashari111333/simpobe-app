<div>
    {{-- Notifikasi Flash --}}
    @if (session()->has('message'))
        <div class="mb-4 bg-green-100 border-l-4 border-green-500 text-green-700 p-3 text-sm rounded shadow-sm">
            {{ session('message') }}
        </div>
    @endif

    @if (session()->has('error'))
        <div class="mb-4 bg-red-100 border-l-4 border-red-500 text-red-700 p-3 text-sm rounded shadow-sm">
            {{ session('error') }}
        </div>
    @endif

    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <div>
            <h3 class="text-lg font-semibold text-gray-800">Data Bahan Kajian (Prodi: {{ $prodi }})</h3>
            <p class="text-xs text-gray-500 italic">Daftar Body of Knowledge (BoK) Kurikulum</p>
        </div>

        <div class="flex flex-wrap w-full md:w-auto gap-3 justify-end items-center">
            {{-- Input Pencarian --}}
            <div class="relative flex-grow max-w-xs">
                <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-gray-400">
                    <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                </span>
                <input type="text" wire:model.live.debounce.300ms="search" placeholder="Cari BK atau Area..." class="pl-10 block w-full text-sm border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500">
            </div>

            {{-- Fitur Khusus Kaprodi --}}
            @if(Auth::user()->role === 'Kaprodi')
                <x-secondary-button wire:click="showImportModal" class="h-10">
                    IMPORT DATA
                </x-secondary-button>

                <button wire:click="showModal" class="bg-slate-800 hover:bg-slate-900 text-white font-bold py-2 px-4 rounded-md shadow-sm uppercase text-xs tracking-widest transition whitespace-nowrap h-10">
                    TAMBAH BK
                </button>
            @endif
        </div>
    </div>

    {{-- Tabel --}}
    <div class="overflow-x-auto shadow-md sm:rounded-lg border border-gray-100">
        <table class="w-full text-left border-collapse bg-white">
            <thead>
                <tr class="bg-gray-100 text-[11px] uppercase text-gray-700 border-b">
                    <th class="p-3 border text-center w-12">NO</th>
                    <th class="p-3 border w-24 font-bold">KODE BK</th>
                    <th class="p-3 border">NAMA BAHAN KAJIAN</th>
                    <th class="p-3 border">DESKRIPSI</th>
                    <th class="p-3 border w-40 text-center">KNOWLEDGE AREA</th>
                    @if(Auth::user()->role === 'Kaprodi')
                        <th class="p-3 border text-center w-24">AKSI</th>
                    @endif
                </tr>
            </thead>
            <tbody class="text-xs">
                @forelse($bks as $bk)
                <tr class="hover:bg-gray-50 border-b transition">
                    <td class="p-3 border text-center text-gray-500">{{ $loop->iteration }}</td>
                    <td class="p-3 border font-bold text-slate-700 font-mono">{{ $bk->kode_bk }}</td>
                    <td class="p-3 border font-medium text-gray-800">{{ $bk->bahan_kajian }}</td>
                    <td class="p-3 border text-gray-600 leading-relaxed text-justify">{{ Str::limit($bk->deskripsi, 120) }}</td>
                    <td class="p-3 border text-center">
                        <span class="px-2 py-1 bg-indigo-50 text-indigo-700 rounded-md text-[10px] font-bold uppercase border border-indigo-100">
                            {{ $bk->knowledge_area }}
                        </span>
                    </td>
                    @if(Auth::user()->role === 'Kaprodi')
                    <td class="p-3 border text-center">
                        <div class="flex justify-center space-x-2">
                            <button wire:click="edit({{ $bk->id }})" class="text-blue-600 hover:text-blue-800 transition p-1 hover:bg-blue-50 rounded">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                            </button>
                            <button wire:click="confirmDelete({{ $bk->id }})" class="text-red-600 hover:text-red-800 transition p-1 hover:bg-red-50 rounded">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                            </button>
                        </div>
                    </td>
                    @endif
                </tr>
                @empty
                <tr>
                    <td colspan="{{ Auth::user()->role === 'Kaprodi' ? 6 : 5 }}" class="p-8 text-center text-gray-500 italic">Tidak ada data Bahan Kajian yang ditemukan.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    {{-- MODAL IMPORT --}}
    <x-dialog-modal wire:model="confirmingImport">
        <x-slot name="title">Import Bahan Kajian</x-slot>
        <x-slot name="content">
            <div class="mb-4">
                <x-secondary-button wire:click="downloadTemplate" class="text-xs">
                    Download Template Excel
                </x-secondary-button>
                <p class="mt-2 text-[10px] text-gray-500 italic">
                    *Gunakan template <strong>bahan_kajian.xlsx</strong>. Sistem akan mengabaikan kolom ID dan memetakan Kode BK, Nama, Deskripsi, Knowledge Area, Referensi, dan Prodi secara berurutan.
                </p>
            </div>
            <div class="mt-4">
                <x-label for="file_import" value="Upload File (.xlsx)" />
                <input type="file" id="file_import" wire:model="file_import" class="mt-1 block w-full text-xs text-gray-500" />
                <x-input-error for="file_import" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingImport', false)">Batal</x-secondary-button>
            <x-button class="ml-2" wire:click="importProses" wire:loading.attr="disabled">Import</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL TAMBAH/EDIT --}}
    <x-dialog-modal wire:model="confirmingItemAddEdit">
        <x-slot name="title">{{ $selected_id ? 'Edit Bahan Kajian' : 'Tambah Bahan Kajian' }}</x-slot>
        <x-slot name="content">
            <div class="grid grid-cols-2 gap-4 mt-2">
                <div class="col-span-1">
                    <x-label for="kode_bk" value="Kode BK" />
                    <x-input id="kode_bk" type="text" class="w-full mt-1" wire:model.defer="kode_bk" placeholder="BK-01" />
                    <x-input-error for="kode_bk" class="mt-1" />
                </div>
                <div class="col-span-1">
                    <x-label for="knowledge_area" value="Knowledge Area" />
                    <x-input id="knowledge_area" type="text" class="w-full mt-1" wire:model.defer="knowledge_area" placeholder="Software Engineering" />
                    <x-input-error for="knowledge_area" class="mt-1" />
                </div>
                <div class="col-span-2">
                    <x-label for="bahan_kajian" value="Nama Bahan Kajian" />
                    <x-input id="bahan_kajian" type="text" class="w-full mt-1" wire:model.defer="bahan_kajian" placeholder="Algoritma dan Struktur Data" />
                    <x-input-error for="bahan_kajian" class="mt-1" />
                </div>
                <div class="col-span-2">
                    <x-label for="deskripsi_bk" value="Deskripsi" />
                    <textarea id="deskripsi_bk" wire:model.defer="deskripsi" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm focus:ring-indigo-500" rows="3" placeholder="Jelaskan ruang lingkup bahan kajian ini..."></textarea>
                    <x-input-error for="deskripsi" class="mt-1" />
                </div>
                <div class="col-span-2">
                    <x-label for="referensi" value="Referensi (Opsional)" />
                    <textarea id="referensi" wire:model.defer="referensi" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm focus:ring-indigo-500" rows="2" placeholder="Contoh: IEEE SWEBOK v3.0, dsb..."></textarea>
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemAddEdit', false)">Batal</x-secondary-button>
            <x-button class="ml-2 bg-slate-800" wire:click="save">Simpan Bahan Kajian</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL HAPUS --}}
    <x-confirmation-modal wire:model="confirmingItemDeletion">
        <x-slot name="title">Hapus Bahan Kajian</x-slot>
        <x-slot name="content">Apakah Anda yakin ingin menghapus Bahan Kajian ini?</x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemDeletion', false)">Batal</x-secondary-button>
            <x-danger-button class="ml-2" wire:click="delete">Hapus</x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>