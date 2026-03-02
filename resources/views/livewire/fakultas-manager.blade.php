<div class="p-6">
    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <h3 class="text-lg font-bold text-gray-800 uppercase">Daftar Fakultas</h3>
        
        <div class="flex items-center gap-4">
            <input wire:model.live="search" type="text" class="border-gray-300 rounded-lg text-sm w-64" placeholder="Cari Nama atau Kode Fakultas...">
            
            {{-- Tombol Tambah --}}
            <x-button wire:click="$set('confirmingFakultasAddition', true)" class="bg-indigo-600">
                Tambah Fakultas
            </x-button>
        </div>
    </div>

    @if (session()->has('message'))
    <div class="mb-4 bg-emerald-50 border-l-4 border-emerald-500 p-4 text-emerald-800 text-sm italic">
        {{ session('message') }}
    </div>
    @endif

    <div class="overflow-hidden border border-gray-200 rounded-lg shadow-sm">
        <table class="w-full divide-y divide-gray-200 text-sm text-left">
            <thead class="bg-gray-50 text-gray-500 uppercase font-bold">
                <tr>
                    <th class="px-6 py-3">Kode Fakultas</th>
                    <th class="px-6 py-3">Nama Fakultas</th>
                    <th class="px-6 py-3">Tanggal Dibuat</th>
                    <th class="px-6 py-3 text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                @forelse ($fakultas as $f)
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 font-bold text-indigo-600">
                        {{ $f->kode_fakultas }}
                    </td>
                    <td class="px-6 py-4 text-gray-900 font-medium">
                        {{ $f->nama_fakultas }}
                    </td>
                    <td class="px-6 py-4 text-gray-500">
                        {{ $f->created_at->format('d M Y') }}
                    </td>
                    <td class="px-6 py-4 text-right">
                        <button wire:click="editFakultas({{ $f->id }})" class="text-indigo-600 hover:underline mr-3 font-semibold">Edit</button>
                        <button wire:click="confirmFakultasDeletion({{ $f->id }})" class="text-red-600 hover:underline font-semibold">Hapus</button>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="4" class="px-6 py-10 text-center text-gray-400">Data fakultas tidak ditemukan.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <div class="mt-4">
        {{ $fakultas->links() }}
    </div>

    {{-- MODAL TAMBAH/EDIT --}}
    <x-dialog-modal wire:model="confirmingFakultasAddition">
        <x-slot name="title">
            {{ $fakultasId ? 'Edit Fakultas' : 'Tambah Fakultas Baru' }}
        </x-slot>

        <x-slot name="content">
            <div class="grid grid-cols-1 gap-4">
                <div class="bg-gray-50 p-3 rounded-lg border italic text-xs mb-2 text-gray-500 uppercase font-bold tracking-widest">
                    Informasi Master Fakultas
                </div>
                
                <div>
                    <x-label value="Nama Fakultas" />
                    <x-input type="text" class="w-full mt-1" wire:model="nama_fakultas" placeholder="Contoh: Kesehatan" />
                    <x-input-error for="nama_fakultas" />
                </div>

                <div>
                    <x-label value="Kode Fakultas" />
                    <x-input type="text" class="w-full mt-1" wire:model="kode_fakultas" placeholder="Contoh: FKES" />
                    <x-input-error for="kode_fakultas" />
                </div>
            </div>
        </x-slot>

        <x-slot name="footer">
            <x-secondary-button wire:click="$toggle('confirmingFakultasAddition')">
                Batal
            </x-secondary-button>

            <x-button class="ms-3 bg-indigo-600" wire:click="saveFakultas">
                Simpan Fakultas
            </x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL KONFIRMASI HAPUS --}}
    <x-confirmation-modal wire:model="confirmingFakultasDeletion">
        <x-slot name="title">Hapus Fakultas</x-slot>

        <x-slot name="content">
            Apakah Anda yakin ingin menghapus fakultas ini? <br>
            <span class="text-red-600 font-bold">Peringatan:</span> Menghapus fakultas akan berdampak pada data Program Studi di bawahnya jika sistem relasi database diatur secara <i>Cascade</i>.
        </x-slot>

        <x-slot name="footer">
            <x-secondary-button wire:click="$toggle('confirmingFakultasDeletion')">
                Batal
            </x-secondary-button>

            <x-danger-button class="ms-3" wire:click="deleteFakultas">
                Hapus Permanen
            </x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>