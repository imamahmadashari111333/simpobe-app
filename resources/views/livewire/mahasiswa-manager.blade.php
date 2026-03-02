<div class="p-6">
    {{-- Header Section --}}
<div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
    <div>
        <h3 class="text-lg font-bold text-gray-800 uppercase tracking-tight">Daftar Mahasiswa</h3>
        <p class="text-[10px] text-gray-500 uppercase tracking-widest font-medium">Kelola data mahasiswa, angkatan, dan kelas</p>
    </div>
    
    <div class="flex flex-wrap items-center gap-2 w-full md:w-auto justify-end">
        <div class="relative w-full md:w-64">
            <input wire:model.live.debounce.300ms="search" type="text" 
                class="border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500 text-sm w-full" 
                placeholder="Cari NIM atau Nama...">
        </div>
        
        {{-- HANYA KAPRODI: Tombol Import dan Tambah --}}
        @if(Auth::user()->role === 'Kaprodi')
            <x-secondary-button wire:click="showImportModal" class="h-9 text-xs">Import Excel</x-secondary-button>
            <x-button wire:click="confirmMahasiswaAddition" class="bg-indigo-600 hover:bg-indigo-700 h-9 text-xs">Tambah Mahasiswa</x-button>
        @endif
    </div>
</div>

@if (session()->has('message'))
    <div class="mb-4 bg-emerald-50 border-l-4 border-emerald-500 p-4 text-emerald-800 text-sm shadow-sm">{{ session('message') }}</div>
@endif

{{-- Table Section --}}
<div class="w-full overflow-hidden border border-gray-200 sm:rounded-lg shadow-sm bg-white">
    <table class="w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
            <tr>
                <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">NIM</th>
                <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Nama</th>
                <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">Angkatan / Prodi / Kelas</th>
                
                {{-- HANYA KAPRODI: Header Kolom Aksi --}}
                @if(Auth::user()->role === 'Kaprodi')
                    <th class="px-6 py-3 text-right text-xs font-bold text-gray-500 uppercase tracking-wider">Aksi</th>
                @endif
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            @forelse ($mahasiswas as $m)
                <tr class="hover:bg-gray-50 transition duration-150">
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-mono font-bold text-gray-900">{{ $m->nim }}</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600 uppercase">{{ $m->nama }}</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        <span class="font-bold text-indigo-600">{{ $m->angkatan }}</span> - {{ $m->prodi }} 
                        <span class="ml-2 px-2 py-0.5 bg-gray-100 rounded text-gray-600 font-bold">{{ $m->kelas ?? '-' }}</span>
                    </td>

                    {{-- HANYA KAPRODI: Isi Kolom Aksi --}}
                    @if(Auth::user()->role === 'Kaprodi')
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <button wire:click="editMahasiswa({{ $m->id }})" class="text-indigo-600 hover:text-indigo-900 mr-3 font-bold">Edit</button>
                            <button wire:click="confirmMahasiswaDeletion({{ $m->id }})" class="text-red-600 hover:text-red-900 font-bold">Hapus</button>
                        </td>
                    @endif
                </tr>
            @empty
                <tr>
                    {{-- Colspan dinamis: 4 kolom jika Kaprodi, 3 kolom jika role lain --}}
                    <td colspan="{{ Auth::user()->role === 'Kaprodi' ? 4 : 3 }}" class="px-6 py-10 text-center text-gray-400 italic">
                        Data mahasiswa tidak ditemukan.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>

    <div class="mt-4">{{ $mahasiswas->links() }}</div>

    {{-- MODAL IMPORT --}}
    <x-dialog-modal wire:model="confirmingImport">
        <x-slot name="title">Import Data Mahasiswa</x-slot>
        <x-slot name="content">
            <div class="mb-4"><x-secondary-button wire:click="downloadTemplate" class="text-xs">Download Template Excel</x-secondary-button></div>
            <div class="bg-blue-50 p-3 rounded text-[11px] text-blue-700 border border-blue-200 mb-4">
                Urutan Kolom Excel: <b>ID, NIM, NAMA, ANGKATAN, PRODI, KELAS</b>
            </div>
            <div class="mt-4">
                <x-label value="Pilih File Excel" />
                <input type="file" wire:model="file_import" class="mt-1 block w-full text-xs" />
                <x-input-error for="file_import" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingImport', false)">Batal</x-secondary-button>
            <x-button class="ml-2 bg-indigo-600" wire:click="importProses">Import Sekarang</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL TAMBAH/EDIT --}}
    <x-dialog-modal wire:model="confirmingMahasiswaAddition">
        <x-slot name="title">{{ $mahasiswaId ? 'Edit Data Mahasiswa' : 'Tambah Mahasiswa Baru' }}</x-slot>
        <x-slot name="content">
            <div class="grid grid-cols-1 gap-4">
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <x-label for="nim" value="NIM" />
                        <x-input id="nim" type="text" class="mt-1 block w-full" wire:model="nim" />
                        <x-input-error for="nim" class="mt-2" />
                    </div>
                    <div>
                        <x-label for="kelas" value="Kelas" />
                        <x-input id="kelas" type="text" class="mt-1 block w-full" wire:model="kelas" placeholder="Contoh: A, B, atau Reguler" />
                        <x-input-error for="kelas" class="mt-2" />
                    </div>
                </div>
                <div>
                    <x-label for="nama" value="Nama Lengkap" />
                    <x-input id="nama" type="text" class="mt-1 block w-full uppercase" wire:model="nama" />
                    <x-input-error for="nama" class="mt-2" />
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <x-label for="prodi" value="Program Studi" />
                        <select id="prodi" wire:model.live="prodi" class="mt-1 block w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm text-sm">
                            <option value="">-- Pilih Prodi --</option>
                            @foreach($list_prodi as $p)
                                <option value="{{ $p->nama_prodi }}">{{ $p->nama_prodi }}</option>
                            @endforeach
                        </select>
                        <x-input-error for="prodi" class="mt-2" />
                    </div>
                    <div>
                        <x-label for="angkatan" value="Angkatan" />
                        <x-input id="angkatan" type="text" class="mt-1 block w-full" wire:model="angkatan" placeholder="2024" />
                        <x-input-error for="angkatan" class="mt-2" />
                    </div>
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingMahasiswaAddition', false)">Batal</x-secondary-button>
            <x-button class="ms-3 bg-indigo-600" wire:click="saveMahasiswa">Simpan</x-button>
        </x-slot>
    </x-dialog-modal>
</div>