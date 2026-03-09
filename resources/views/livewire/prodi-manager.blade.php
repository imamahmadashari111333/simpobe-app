<div class="p-6">
    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <h3 class="text-lg font-bold text-gray-800 uppercase">Daftar Program Studi</h3>
        
        <div class="flex items-center gap-4">
            <input wire:model.live="search" type="text" class="border-gray-300 rounded-lg text-sm w-64" placeholder="Cari Nama atau Kode Prodi...">
            
            <x-button wire:click="$set('confirmingProdiAddition', true)" class="bg-indigo-600">
                Tambah Prodi
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
                    <th class="px-4 py-3 w-10">No</th>
                    <th class="px-6 py-3">Kode Prodi</th>
                    <th class="px-6 py-3">Nama Program Studi</th>
                    <th class="px-6 py-3">Fakultas</th>
                    <th class="px-6 py-3 text-right">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                @forelse ($prodis as $index => $p)
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-4 text-gray-400">
                        {{ $prodis->firstItem() + $index }}
                    </td>
                    <td class="px-6 py-4 font-bold text-gray-900">
                        {{ $p->kode_prodi }}
                    </td>
                    <td class="px-6 py-4">
                        <div class="font-medium text-gray-900">{{ $p->nama_prodi }}</div>
                        <div class="text-xs text-indigo-500 font-semibold">{{ $p->jenjang }}</div>
                    </td>
                    <td class="px-6 py-4">
                        <span class="px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs">
                            {{ $p->fakultas->nama_fakultas ?? 'N/A' }}
                        </span>
                    </td>
                    <td class="px-6 py-4 text-right">
                        <button wire:click="editProdi({{ $p->id }})" class="text-indigo-600 hover:underline mr-3 font-semibold">Edit</button>
                        <button wire:click="confirmProdiDeletion({{ $p->id }})" class="text-red-600 hover:underline font-semibold">Hapus</button>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="px-6 py-10 text-center text-gray-400">Data program studi tidak tersedia.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <div class="mt-4">
        {{ $prodis->links() }}
    </div>

    {{-- MODAL TAMBAH/EDIT --}}
    <x-dialog-modal wire:model="confirmingProdiAddition">
        <x-slot name="title">
            {{ $prodiId ? 'Edit Program Studi' : 'Tambah Program Studi Baru' }}
        </x-slot>

        <x-slot name="content">
            <div class="grid grid-cols-2 gap-4">
                <div class="col-span-2 bg-gray-50 p-3 rounded-lg border italic text-xs mb-2 text-gray-500 uppercase font-bold tracking-widest">
                    Konfigurasi Relasi & Identitas
                </div>
                
                <div class="col-span-2">
                    <x-label value="Pilih Fakultas" />
                    <select wire:model="fakultas_id" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm">
                        <option value="">-- Pilih Fakultas --</option>
                        @foreach($listFakultas as $f)
                            <option value="{{ $f->id }}">{{ $f->nama_fakultas }}</option>
                        @endforeach
                    </select>
                    <x-input-error for="fakultas_id" />
                </div>

                <div class="col-span-2">
                    <x-label value="Nama Prodi (Sesuai Gambar)" />
                    <x-input type="text" class="w-full mt-1" wire:model="nama_prodi" placeholder="Contoh: S1 Informatika" />
                    <x-input-error for="nama_prodi" />
                </div>

                <div>
                    <x-label value="Kode Prodi" />
                    <x-input type="text" class="w-full mt-1" wire:model="kode_prodi" placeholder="Contoh: INF-S1" />
                    <x-input-error for="kode_prodi" />
                </div>

                <div>
                    <x-label value="Jenjang" />
                    <select wire:model="jenjang" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm">
                        <option value="">-- Pilih Jenjang --</option>
                        <option value="S1">S1</option>
                        <option value="D3">D3</option>
                        <option value="D4">D4</option>
                        <option value="Profesi">Profesi</option>
                    </select>
                    <x-input-error for="jenjang" />
                </div>
            </div>
        </x-slot>

        <x-slot name="footer">
            <x-secondary-button wire:click="$toggle('confirmingProdiAddition')">
                Batal
            </x-secondary-button>

            <x-button class="ms-3 bg-indigo-600" wire:click="saveProdi">
                Simpan Data
            </x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL KONFIRMASI HAPUS --}}
    <x-confirmation-modal wire:model="confirmingProdiDeletion">
        <x-slot name="title">Hapus Program Studi</x-slot>

        <x-slot name="content">
            Apakah Anda yakin ingin menghapus prodi ini? Data yang terkait dengan prodi ini mungkin akan ikut terhapus.
        </x-slot>

        <x-slot name="footer">
            <x-secondary-button wire:click="$toggle('confirmingProdiDeletion')">
                Batal
            </x-secondary-button>

            <x-danger-button class="ms-3" wire:click="deleteProdi">
                Hapus Permanen
            </x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>