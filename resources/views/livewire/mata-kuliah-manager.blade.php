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
            <h3 class="text-lg font-semibold text-gray-800">Daftar Mata Kuliah</h3>
            <p class="text-xs text-gray-500">Program Studi: <span class="font-bold text-indigo-600">{{ $prodi }}</span></p>
        </div>

        <div class="flex flex-wrap w-full md:w-auto gap-3 justify-end items-center">
            <div class="relative flex-grow max-w-xs">
                <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-gray-400">
                    <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                </span>
                <input type="text" wire:model.live.debounce.300ms="search" placeholder="Cari Kode atau Nama MK..." class="pl-10 block w-full text-sm border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500">
            </div>

            @if(Auth::user()->role === 'Kaprodi')
                <x-secondary-button wire:click="showImportModal" class="h-10">IMPORT</x-secondary-button>
                <button wire:click="showModal" class="bg-slate-800 hover:bg-slate-900 text-white font-bold py-2 px-4 rounded-md shadow-sm uppercase text-xs tracking-widest transition h-10">
                    Tambah MK
                </button>
            @endif
        </div>
    </div>

    <div class="overflow-x-auto shadow-md sm:rounded-lg border border-gray-100">
        <table class="w-full text-left border-collapse bg-white">
            <thead>
                <tr class="bg-gray-100 text-[11px] uppercase text-gray-700 border-b">
                    <th class="p-3 border text-center w-12">No</th>
                    <th class="p-3 border w-32 font-bold">Kode MK</th>
                    <th class="p-3 border">Nama Mata Kuliah</th>
                    <th class="p-3 border text-center">SKS</th>
                    <th class="p-3 border text-center">Teori</th>
                    <th class="p-3 border text-center">Praktik</th>
                    <th class="p-3 border text-center">Smt</th>
                    @if(Auth::user()->role === 'Kaprodi')
                        <th class="p-3 border text-center w-24">Aksi</th>
                    @endif
                </tr>
            </thead>
            <tbody class="text-xs">
                @forelse($mata_kuliahs as $mk)
                <tr class="hover:bg-gray-50 border-b transition">
                    <td class="p-3 border text-center text-gray-500">{{ $loop->iteration }}</td>
                    <td class="p-3 border font-bold text-slate-700 font-mono">{{ $mk->kode_mk }}</td>
                    <td class="p-3 border font-medium text-gray-800">{{ $mk->nama_mk }}</td>
                    <td class="p-3 border text-center font-bold text-indigo-700">{{ $mk->sks }}</td>
                    <td class="p-3 border text-center text-gray-600">{{ $mk->sks_teori }}</td>
                    <td class="p-3 border text-center text-gray-600">{{ $mk->sks_praktik }}</td>
                    <td class="p-3 border text-center">
                        <span class="px-2 py-1 bg-gray-100 text-gray-700 rounded text-[10px] font-bold border border-gray-200">SMT {{ $mk->smt }}</span>
                    </td>
                    @if(Auth::user()->role === 'Kaprodi')
                    <td class="p-3 border text-center">
                        <div class="flex justify-center space-x-1">
                            <button wire:click="edit({{ $mk->id }})" class="text-blue-600 hover:text-blue-800 p-1 hover:bg-blue-50 rounded transition">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                            </button>
                            <button wire:click="confirmDelete({{ $mk->id }})" class="text-red-600 hover:text-red-800 p-1 hover:bg-red-50 rounded transition">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                            </button>
                        </div>
                    </td>
                    @endif
                </tr>
                @empty
                <tr><td colspan="8" class="p-8 text-center text-gray-500 italic bg-white">Tidak ada data mata kuliah.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>

    {{-- MODAL IMPORT --}}
    <x-dialog-modal wire:model="confirmingImport">
        <x-slot name="title">Import Mata Kuliah</x-slot>
        <x-slot name="content">
            <div class="mb-4">
                <x-secondary-button wire:click="downloadTemplate" class="text-xs">Download Template</x-secondary-button>
                <p class="mt-2 text-[10px] text-gray-500 italic">*Format: ID, Kode MK, Nama MK, SKS, Teori, Praktik, Smt, Prodi.</p>
            </div>
            <div class="mt-4">
                <x-label value="Upload File Excel" />
                <input type="file" wire:model="file_import" class="mt-1 block w-full text-xs text-gray-500" />
                <x-input-error for="file_import" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingImport', false)">Batal</x-secondary-button>
            <x-button class="ml-2" wire:click="importProses">Import</x-button>
        </x-slot>
    </x-dialog-modal>

        {{-- MODAL TAMBAH/EDIT --}}
    <x-dialog-modal wire:model="confirmingItemAddEdit">
        <x-slot name="title">{{ $selected_id ? 'Edit Mata Kuliah' : 'Tambah Mata Kuliah' }}</x-slot>
        <x-slot name="content">
            <div class="grid grid-cols-2 gap-4 mt-2">
                <div class="col-span-2 sm:col-span-1">
                    <x-label for="kode_mk" value="Kode MK" />
                    <x-input id="kode_mk" type="text" class="mt-1 block w-full" wire:model.defer="kode_mk" placeholder="Contoh: MK001" />
                    <x-input-error for="kode_mk" class="mt-1" />
                </div>
                <div class="col-span-2 sm:col-span-1">
                    <x-label for="smt" value="Semester (1-8)" />
                    <x-input id="smt" type="number" class="mt-1 block w-full" wire:model.defer="smt" min="1" max="8" />
                    <x-input-error for="smt" class="mt-1" />
                </div>
                <div class="col-span-2">
                    <x-label for="nama_mk" value="Nama Mata Kuliah" />
                    <x-input id="nama_mk" type="text" class="mt-1 block w-full" wire:model.defer="nama_mk" />
                    <x-input-error for="nama_mk" class="mt-1" />
                </div>
                <div class="col-span-2 sm:col-span-1">
                    <x-label for="sks" value="Total SKS" />
                    <x-input id="sks" type="number" class="mt-1 block w-full" wire:model.defer="sks" />
                    <x-input-error for="sks" class="mt-1" />
                </div>
                <div class="col-span-2 sm:col-span-1 grid grid-cols-2 gap-2">
                    <div>
                        <x-label for="sks_teori" value="Teori" />
                        <x-input id="sks_teori" type="number" class="mt-1 block w-full" wire:model.defer="sks_teori" />
                    </div>
                    <div>
                        <x-label for="sks_praktik" value="Praktik" />
                        <x-input id="sks_praktik" type="number" class="mt-1 block w-full" wire:model.defer="sks_praktik" />
                    </div>
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemAddEdit', false)">Batal</x-secondary-button>
            <x-button class="ml-2 bg-slate-800" wire:click="save">Simpan MK</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL KONFIRMASI HAPUS --}}
    <x-confirmation-modal wire:model="confirmingItemDeletion">
        <x-slot name="title">Hapus Mata Kuliah</x-slot>
        <x-slot name="content">Apakah Anda yakin ingin menghapus mata kuliah ini? Tindakan ini tidak dapat dibatalkan.</x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemDeletion', false)">Batal</x-secondary-button>
            <x-danger-button class="ml-2" wire:click="delete">Ya, Hapus</x-danger-button>
        </x-slot>
    </x-confirmation-modal>
    
</div>