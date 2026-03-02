<div>
    <div class="flex justify-between items-center mb-4">
        <h3 class="text-lg font-semibold text-gray-800">Data Profil Lulusan (PL)</h3>
        <button wire:click="showModal" class="bg-slate-800 hover:bg-slate-900 text-white font-bold py-2 px-4 rounded-md shadow-sm uppercase text-xs tracking-widest transition">
            Tambah PL
        </button>
    </div>

    <div class="overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-left border-collapse bg-white">
    <thead>
        <tr class="bg-gray-100 text-[11px] uppercase text-gray-700 border-b">
            <th class="p-3 border text-center w-12">NO</th>
            <th class="p-3 border w-24">KODE PL</th>
            <th class="p-3 border">DESKRIPSI PL</th>
            <th class="p-3 border w-48">PROFESI</th>
            {{-- Header AKSI hanya untuk Kaprodi --}}
            @if(auth()->user()->role === 'Kaprodi')
                <th class="p-3 border text-center w-24">AKSI</th>
            @endif
        </tr>
    </thead>
    <tbody class="text-xs">
        @foreach($pls as $pl)
        <tr class="hover:bg-gray-50 border-b transition">
            <td class="p-3 border text-center text-gray-500">{{ $loop->iteration }}</td>
            <td class="p-3 border font-semibold text-slate-700">{{ $pl->kode_pl }}</td>
            <td class="p-3 border text-gray-600 leading-relaxed">{{ $pl->deskripsi_pl }}</td>
            <td class="p-3 border text-gray-600 italic">{{ $pl->profesi }}</td>
            
            {{-- Kolom Data AKSI hanya untuk Kaprodi --}}
            @if(auth()->user()->role === 'Kaprodi')
                <td class="p-3 border text-center">
                    <div class="flex justify-center space-x-2">
                        {{-- Icon Edit --}}
                        <button wire:click="edit({{ $pl->id }})" class="text-blue-600 hover:text-blue-800 transition" title="Edit">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                            </svg>
                        </button>
                        {{-- Icon Hapus --}}
                        <button wire:click="$set('selected_id', {{ $pl->id }}); $set('confirmingItemDeletion', true)" class="text-red-600 hover:text-red-800 transition" title="Hapus">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                            </svg>
                        </button>
                    </div>
                </td>
            @endif
        </tr>
        @endforeach
    </tbody>
</table>
    </div>

    <x-dialog-modal wire:model="confirmingItemAddEdit">
        <x-slot name="title">{{ $selected_id ? 'Edit Profil Lulusan' : 'Tambah Profil Lulusan' }}</x-slot>
        <x-slot name="content">
            <div class="grid grid-cols-1 gap-4">
                <div>
                    <x-label value="Kode PL" />
                    <x-input type="text" class="w-full mt-1" wire:model.defer="kode_pl" placeholder="PL01" />
                    <x-input-error for="kode_pl" class="mt-1" />
                </div>
                <div>
                    <x-label value="Profesi / Peran" />
                    <x-input type="text" class="w-full mt-1" wire:model.defer="profesi" placeholder="Software Engineer" />
                    <x-input-error for="profesi" class="mt-1" />
                </div>
                <div>
                    <x-label value="Deskripsi PL" />
                    <textarea wire:model.defer="deskripsi_pl" class="w-full mt-1 border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm text-sm" rows="4" placeholder="Jelaskan deskripsi kemampuan profil..."></textarea>
                    <x-input-error for="deskripsi_pl" class="mt-1" />
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemAddEdit', false)">Batal</x-secondary-button>
            <x-button class="ml-2 bg-slate-800" wire:click="save">Simpan PL</x-button>
        </x-slot>
    </x-dialog-modal>

    <x-confirmation-modal wire:model="confirmingItemDeletion">
        <x-slot name="title">Hapus Profil Lulusan</x-slot>
        <x-slot name="content">Apakah Anda yakin ingin menghapus data ini? Tindakan ini tidak dapat dibatalkan.</x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemDeletion', false)">Batal</x-secondary-button>
            <x-danger-button class="ml-2" wire:click="delete">Hapus Sekarang</x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>