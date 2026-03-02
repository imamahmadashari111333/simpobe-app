<div class="p-6">
    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <h3 class="text-lg font-bold text-gray-800 uppercase">Daftar Dosen</h3>
        <div class="flex items-center gap-4">
            <input wire:model.live="search" type="text" class="border-gray-300 rounded-lg text-sm w-64" placeholder="Cari Nama, NIK, atau Prodi...">
            {{-- Tombol Tambah hanya untuk Level 1 --}}
            @if(auth()->user()->level == 1)
            <x-button wire:click="$set('confirmingDosenAddition', true)" class="bg-indigo-600">Tambah Dosen</x-button>
            @endif
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
                    <th class="px-6 py-3">NIK / NIDN</th>
                    <th class="px-6 py-3">Nama & Gelar</th>
                    <th class="px-6 py-3">Prodi / Fakultas</th>
                    <th class="px-6 py-3">Jabatan</th>
                    @if(auth()->user()->level == 1)
                    <th class="px-6 py-3 text-right">Aksi</th>
                    @endif
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                @forelse ($dosens as $index => $d)
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-4 text-center text-gray-400">{{ $dosens->firstItem() + $index }}</td>
                    <td class="px-6 py-4 font-bold text-gray-900">
                        {{ $d->profil->nik ?? 'N/A' }}<br>
                        <span class="text-xs text-gray-400 font-normal">{{ $d->profil->nidn ?? '-' }}</span>
                    </td>
                    <td class="px-6 py-4">
                        {{ ($d->profil->gelar_depan ?? '') . ' ' . $d->name . ($d->profil->gelar_belakang ? ', ' . $d->profil->gelar_belakang : '') }}
                        @if($d->level == 1) <span class="ml-1 px-1 bg-amber-100 text-amber-700 text-[9px] rounded font-black uppercase">Admin</span> @endif
                        <div class="text-xs text-indigo-500">{{ $d->email }}</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-gray-700 font-medium">{{ $d->profil->prodi ?? 'Belum Diatur' }}</div>
                        <div class="text-xs text-gray-400 uppercase font-bold">{{ $d->profil->fakultas ?? '-' }}</div>
                    </td>
                    <td class="px-6 py-4 text-xs">
                        <span class="px-2 py-1 bg-blue-50 text-blue-700 rounded block mb-1 text-center font-bold italic border border-blue-100 uppercase">
                            {{ $d->profil->jabatan_fungsional ?? 'N/A' }}
                        </span>
                        <span class="text-gray-500 italic">{{ $d->profil->jabatan_struktural ?? $d->role }}</span>
                    </td>
                    @if(auth()->user()->level == 1)
                    <td class="px-6 py-4 text-right">
                        <button wire:click="editDosen({{ $d->id }})" class="text-indigo-600 hover:underline mr-2 font-bold uppercase text-xs">Edit</button>
                        <button wire:click="confirmDosenDeletion({{ $d->id }})" class="text-red-600 hover:underline font-bold uppercase text-xs">Hapus</button>
                    </td>
                    @endif
                </tr>
                @empty
                <tr><td colspan="6" class="px-6 py-10 text-center text-gray-400 italic font-bold">Data tidak ditemukan.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $dosens->links() }}</div>

    {{-- MODAL FORM --}}
    <x-dialog-modal wire:model="confirmingDosenAddition">
        <x-slot name="title">{{ $userId ? 'Update Data Dosen' : 'Registrasi Dosen Baru' }}</x-slot>
        <x-slot name="content">
            <div class="grid grid-cols-2 gap-4">
                <div class="col-span-2 bg-indigo-50 p-2 rounded text-[10px] text-indigo-700 uppercase font-black tracking-widest border border-indigo-100">Informasi Login</div>
                <div>
                    <x-label value="Nama Lengkap (User)" />
                    <x-input type="text" class="w-full mt-1" wire:model="name" />
                </div>
                <div>
                    <x-label value="Email Institusi" />
                    <x-input type="email" class="w-full mt-1" wire:model="email" />
                </div>
                <div class="col-span-1">
                    <x-label value="Password {{ $userId ? '(Kosongkan jika tetap)' : '' }}" />
                    <x-input type="password" class="w-full mt-1" wire:model="password" />
                </div>
                <div class="col-span-1 flex items-end pb-2">
                    <label class="flex items-center cursor-pointer">
                        <input type="checkbox" wire:model="level" class="rounded border-gray-300 text-indigo-600 shadow-sm focus:ring-indigo-500">
                        <span class="ml-2 text-sm text-gray-600 font-bold uppercase">Jadikan Admin?</span>
                    </label>
                </div>

                <div class="col-span-2 bg-gray-100 p-2 rounded text-[10px] text-gray-600 uppercase font-black tracking-widest border border-gray-200 mt-2">Atribut Akademik</div>
                <div><x-label value="NIK" /><x-input type="text" class="w-full mt-1" wire:model="nik" /></div>
                <div><x-label value="NIDN" /><x-input type="text" class="w-full mt-1" wire:model="nidn" /></div>
                <div><x-label value="Gelar Depan" /><x-input type="text" class="w-full mt-1" wire:model="gelar_depan" /></div>
                <div><x-label value="Gelar Belakang" /><x-input type="text" class="w-full mt-1" wire:model="gelar_belakang" /></div>
                
                <div>
                    <x-label value="Fakultas" />
                    <select wire:model.live="fakultas" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm">
                        <option value="">-- Pilih Fakultas --</option>
                        @foreach($listFakultas as $f)
                            <option value="{{ $f->nama_fakultas }}">{{ $f->nama_fakultas }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <x-label value="Program Studi" />
                    <select wire:model="prodi" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm {{ empty($fakultas) ? 'bg-gray-100' : '' }}" {{ empty($fakultas) ? 'disabled' : '' }}>
                        <option value="">-- {{ empty($fakultas) ? 'Pilih Fakultas Dulu' : 'Pilih Prodi' }} --</option>
                        @foreach($listProdi as $p)
                            <option value="{{ $p->nama_prodi }}">{{ $p->nama_prodi }}</option>
                        @endforeach
                    </select>
                </div>

                {{-- TAMBAHAN: JABATAN FUNGSIONAL --}}
                <div class="col-span-2">
                    <x-label value="Jabatan Fungsional" />
                    <select wire:model="jabatan_fungsional" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm">
                        <option value="">-- Pilih Jabatan Fungsional --</option>
                        <option value="Tenaga Pengajar">Tenaga Pengajar</option>
                        <option value="Asisten Ahli">Asisten Ahli</option>
                        <option value="Lektor">Lektor</option>
                        <option value="Lektor Kepala">Lektor Kepala</option>
                        <option value="Guru Besar">Guru Besar</option>
                    </select>
                </div>

                <div class="col-span-2">
                    <x-label value="Jabatan Struktural" />
                    @if($showCustomJabatan)
                    <div class="flex gap-2 mt-1">
                        <x-input type="text" class="w-full" wire:model="jabatan_struktural" />
                        <button type="button" wire:click="cancelCustomJabatan" class="text-red-500 font-bold text-xs uppercase underline">X</button>
                    </div>
                    @else
                    <select wire:model="jabatan_struktural" wire:change="checkJabatan" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm">
                        <option value="">-- Pilih --</option>
                        <option value="Rektor">Rektor</option><option value="Dekan">Dekan</option><option value="Kaprodi">Kaprodi</option><option value="Lainnya">Lainnya...</option>
                    </select>
                    @endif
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingDosenAddition', false)">Batal</x-secondary-button>
            <x-button class="ms-3 bg-indigo-600" wire:click="saveDosen">Simpan</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL KONFIRMASI HAPUS --}}
    <x-confirmation-modal wire:model="confirmingDosenDeletion">
        <x-slot name="title">Hapus Data</x-slot>
        <x-slot name="content">Apakah Anda yakin ingin menghapus data ini? Tindakan ini tidak bisa dibatalkan.</x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingDosenDeletion', false)">Batal</x-secondary-button>
            <x-danger-button class="ms-3" wire:click="deleteDosen">Hapus Sekarang</x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>