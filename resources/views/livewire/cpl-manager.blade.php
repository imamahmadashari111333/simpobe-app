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
        <div class="flex flex-col w-full md:w-1/3">
            <h3 class="text-lg font-medium text-gray-900 uppercase">Data CPL: {{ $prodi }}</h3>
            <p class="text-xs text-gray-500">Manajemen Capaian Pembelajaran Lulusan</p>
        </div>
        
        <div class="flex flex-wrap w-full md:w-2/3 justify-end items-center gap-3">
            <div class="relative w-full max-w-xs">
                <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-gray-400">
                    <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                </span>
                <input type="text" wire:model.live.debounce.300ms="search" placeholder="Cari..." class="pl-10 block w-full text-sm border-gray-300 rounded-md">
            </div>
            
            {{-- HANYA KAPRODI: Tombol Import dan Tambah --}}
            @if(Auth::user()->role === 'Kaprodi')
                <x-secondary-button wire:click="showImportModal" class="h-10">
                    Import Data
                </x-secondary-button>

                <x-button wire:click="showModal" class="h-10"> Tambah CPL </x-button>
            @endif
        </div>
    </div>

    {{-- Tabel --}}
    <div class="overflow-x-auto shadow-sm rounded-lg border">
        <table class="w-full text-left border-collapse bg-white">
            <thead>
                <tr class="bg-gray-50 text-gray-700 uppercase text-[10px] font-bold border-b">
                    <th class="p-3 border text-center w-12">No</th>
                    <th class="p-3 border w-32">Kode CPL</th>
                    <th class="p-3 border">Deskripsi</th>
                    {{-- HANYA KAPRODI: Header Kolom Aksi --}}
                    @if(Auth::user()->role === 'Kaprodi')
                        <th class="p-3 border text-center w-24">Aksi</th>
                    @endif
                </tr>
            </thead>
            <tbody class="text-sm">
                @forelse($cpls as $cpl)
                <tr class="hover:bg-gray-50 border-b">
                    <td class="p-3 border text-center text-gray-500">{{ $loop->iteration }}</td>
                    <td class="p-3 border font-bold text-gray-900">{{ $cpl->kode_cpl }}</td>
                    <td class="p-3 border text-gray-700 leading-relaxed text-xs">{{ $cpl->deskripsi_cpl }}</td>
                    
                    {{-- HANYA KAPRODI: Isi Kolom Aksi --}}
                    @if(Auth::user()->role === 'Kaprodi')
                        <td class="p-3 border text-center whitespace-nowrap">
                            <button wire:click="edit({{ $cpl->id }})" class="text-blue-600 hover:text-blue-800 px-2" title="Edit">
                                <svg class="w-5 h-5 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                            </button>
                            <button wire:click="confirmDelete({{ $cpl->id }})" class="text-red-600 hover:text-red-800 px-2" title="Hapus">
                                <svg class="w-5 h-5 inline" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                            </button>
                        </td>
                    @endif
                </tr>
                @empty
                <tr>
                    {{-- Penyesuaian colspan jika kolom aksi hilang --}}
                    <td colspan="{{ Auth::user()->role === 'Kaprodi' ? 4 : 3 }}" class="p-6 text-center text-gray-500 italic">Data CPL tidak ditemukan.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    {{-- MODAL IMPORT (Tetap biarkan, hanya bisa dipicu oleh Kaprodi) --}}
    <x-dialog-modal wire:model="confirmingImport">
        <x-slot name="title">Import Data CPL</x-slot>
        <x-slot name="content">
            <div class="mb-4">
                <x-secondary-button wire:click="downloadTemplate" class="text-xs">
                    Download Template Excel
                </x-secondary-button>
                <p class="mt-2 text-[10px] text-gray-500 italic">*Gunakan template di atas agar kolom id, kode_cpl, deskripsi_cpl, dan prodi sesuai.</p>
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

    {{-- MODAL EDIT/TAMBAH --}}
    <x-dialog-modal wire:model="confirmingItemAddEdit">
        <x-slot name="title">{{ $selected_id ? 'Edit CPL' : 'Tambah CPL' }}</x-slot>
        <x-slot name="content">
            <div class="mt-4">
                <x-label for="kode_cpl" value="Kode CPL" />
                <x-input type="text" id="kode_cpl" class="mt-1 block w-full text-sm" wire:model.defer="kode_cpl" />
                <x-input-error for="kode_cpl" class="mt-2" />
            </div>
            <div class="mt-4">
                <x-label for="deskripsi_cpl" value="Deskripsi" />
                <textarea id="deskripsi_cpl" class="mt-1 block w-full border-gray-300 rounded-md text-sm" rows="4" wire:model.defer="deskripsi_cpl"></textarea>
                <x-input-error for="deskripsi_cpl" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemAddEdit', false)">Batal</x-secondary-button>
            <x-button class="ml-2" wire:click="save">Simpan</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL HAPUS --}}
    <x-confirmation-modal wire:model="confirmingItemDeletion">
        <x-slot name="title">Hapus</x-slot>
        <x-slot name="content">Yakin ingin menghapus data ini?</x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemDeletion', false)">Batal</x-secondary-button>
            <x-danger-button class="ml-2" wire:click="delete">Hapus</x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>