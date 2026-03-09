<div>
    {{-- Notifikasi --}}
    @if (session()->has('message'))
        <div class="mb-4 bg-green-100 border-l-4 border-green-500 text-green-700 p-3 text-sm rounded">
            {{ session('message') }}
        </div>
    @endif

    @if (session()->has('error'))
        <div class="mb-4 bg-red-100 border-l-4 border-red-500 text-red-700 p-3 text-sm rounded">
            {{ session('error') }}
        </div>
    @endif

    <div class="flex flex-col md:flex-row justify-between items-end mb-6 gap-4">
        <div class="w-full md:w-2/3">
            <h3 class="text-lg font-semibold text-gray-800">Pemetaan CPL ke Profil Lulusan (Prodi: {{ $prodi }})</h3>
            <div class="mt-2 flex shadow-sm">
                <span class="inline-flex items-center px-3 text-gray-500 bg-gray-50 border border-r-0 border-gray-300 rounded-l-lg">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                </span>
                <input type="text" wire:model.live.debounce.300ms="search" placeholder="Cari Kode atau Deskripsi..." class="block w-full text-sm border-gray-300 rounded-none rounded-r-lg">
            </div>
        </div>
        
        {{-- Hanya Kaprodi yang bisa melihat tombol aksi --}}
        @if(Auth::user()->role === 'Kaprodi')
        <div class="flex gap-2">
            <x-secondary-button wire:click="showImportModal" class="h-10">Import Excel</x-secondary-button>
            <button wire:click="showModal" class="bg-slate-800 hover:bg-slate-900 text-white font-bold py-2.5 px-4 rounded-md shadow-sm uppercase text-xs tracking-widest transition">
                Tambah Relasi
            </button>
        </div>
        @endif
    </div>

    <div class="overflow-x-auto shadow-md sm:rounded-lg border">
        <table class="w-full text-left border-collapse bg-white">
            <thead>
                <tr class="bg-gray-100 text-[11px] uppercase text-gray-700 border-b">
                    <th class="p-3 border text-center w-12">NO</th>
                    <th class="p-3 border w-32">KODE CPL</th>
                    <th class="p-3 border">DESKRIPSI CPL PRODI</th>
                    <th class="p-3 border w-32">KODE PL</th>
                    <th class="p-3 border">PROFIL LULUSAN (PL)</th>
                    @if(Auth::user()->role === 'Kaprodi')
                        <th class="p-3 border text-center w-24">AKSI</th>
                    @endif
                </tr>
            </thead>
            <tbody class="text-xs">
                @php $grouped = $cpl_pls->groupBy('kode_cpl'); @endphp

                @forelse($grouped as $kode_cpl => $items)
                    @foreach($items as $index => $item)
                    <tr class="hover:bg-gray-50 border-b">
                        @if($index === 0)
                            <td class="p-3 border text-center align-top" rowspan="{{ count($items) }}">{{ $loop->parent->iteration }}</td>
                            <td class="p-3 border font-bold align-top text-blue-700" rowspan="{{ count($items) }}">{{ $kode_cpl }}</td>
                            <td class="p-3 border align-top text-gray-600" rowspan="{{ count($items) }}">{{ $item->cpl->deskripsi_cpl ?? '-' }}</td>
                        @endif
                        <td class="p-3 border font-semibold text-slate-700">{{ $item->kode_pl }}</td>
                        <td class="p-3 border text-gray-600 italic">{{ $item->pl->profesi ?? '-' }}</td>
                        
                        @if(Auth::user()->role === 'Kaprodi')
                        <td class="p-3 border text-center">
                            <div class="flex justify-center space-x-2">
                                <button wire:click="edit({{ $item->id }})" class="text-blue-600 hover:text-blue-800">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" stroke-width="2"/></svg>
                                </button>
                                <button wire:click="confirmDelete({{ $item->id }})" class="text-red-600 hover:text-red-800">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" stroke-width="2"/></svg>
                                </button>
                            </div>
                        </td>
                        @endif
                    </tr>
                    @endforeach
                @empty
                    <tr>
                        <td colspan="{{ Auth::user()->role === 'Kaprodi' ? 6 : 5 }}" class="p-6 text-center text-gray-500 italic">Belum ada data pemetaan.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    {{-- MODAL IMPORT --}}
    <x-dialog-modal wire:model="confirmingImport">
        <x-slot name="title">Import Relasi CPL-PL</x-slot>
        <x-slot name="content">
            <x-secondary-button wire:click="downloadTemplate" class="mb-4 text-xs">Download Template cpl_pl.xlsx</x-secondary-button>
            <div class="mt-4">
                <x-label value="Upload File Excel" />
                <input type="file" wire:model="file_import" class="mt-1 block w-full text-xs" />
                <x-input-error for="file_import" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingImport', false)">Batal</x-secondary-button>
            <x-button class="ml-2" wire:click="importProses">Import</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL EDIT/TAMBAH --}}
    <x-dialog-modal wire:model="confirmingItemAddEdit">
        <x-slot name="title">{{ $selected_id ? 'Edit Relasi' : 'Tambah Relasi' }}</x-slot>
        <x-slot name="content">
            <div class="grid grid-cols-1 gap-4">
                <div>
                    <x-label value="Pilih CPL" />
                    <select wire:model.defer="kode_cpl" class="w-full border-gray-300 rounded-md text-sm">
                        <option value="">-- Pilih CPL --</option>
                        @foreach($list_cpl as $cpl)
                            <option value="{{ $cpl->kode_cpl }}">{{ $cpl->kode_cpl }} - {{ Str::limit($cpl->deskripsi_cpl, 100) }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <x-label value="Pilih PL" />
                    <select wire:model.defer="kode_pl" class="w-full border-gray-300 rounded-md text-sm">
                        <option value="">-- Pilih PL --</option>
                        @foreach($list_pl as $pl)
                            <option value="{{ $pl->kode_pl }}">{{ $pl->kode_pl }} - {{ $pl->profesi }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemAddEdit', false)">Batal</x-secondary-button>
            <x-button class="ml-2" wire:click="save">Simpan</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL HAPUS --}}
    <x-confirmation-modal wire:model="confirmingItemDeletion">
        <x-slot name="title">Hapus Relasi</x-slot>
        <x-slot name="content">Yakin ingin menghapus relasi ini?</x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemDeletion', false)">Batal</x-secondary-button>
            <x-danger-button class="ml-2" wire:click="delete">Hapus</x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>