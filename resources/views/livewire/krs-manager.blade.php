<div class="p-6">
    <div class="flex justify-between items-center mb-6">
        <h3 class="text-lg font-bold text-gray-800 uppercase tracking-tight">KRS Mahasiswa</h3>
        <div class="flex gap-4">
            <input wire:model.live="search" type="text" placeholder="Cari Mahasiswa..." class="border-gray-300 rounded-lg shadow-sm text-sm w-64">
            <x-button wire:click="confirmKrsAddition" class="bg-indigo-600">Tambah KRS</x-button>
        </div>
    </div>

    @if (session()->has('message'))
        <div class="mb-4 bg-emerald-50 border-l-4 border-emerald-500 p-4 text-emerald-800 text-sm shadow-sm">{{ session('message') }}</div>
    @endif

    <div class="w-full overflow-hidden border border-gray-200 sm:rounded-lg shadow-sm bg-white">
    <table class="w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
            <tr>
                <th class="px-4 py-3 text-left text-xs font-bold text-gray-500 uppercase w-12">No</th>
                <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Mahasiswa</th>
                <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Mata Kuliah</th>
                <th class="px-6 py-3 text-center text-xs font-bold text-gray-500 uppercase">Semester / TA</th>
                <th class="px-6 py-3 text-right text-xs font-bold text-gray-500 uppercase">Aksi</th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            @php 
                $lastStudentId = null; 
                $no = ($krs_list->currentpage()-1) * $krs_list->perpage() + 1;
            @endphp
            
            @forelse ($krs_list as $k)
                <tr class="hover:bg-gray-50 transition">
                    {{-- Kolom No & Mahasiswa: Hanya muncul jika ganti mahasiswa --}}
                    @if ($lastStudentId !== $k->mahasiswa_id)
                        <td class="px-4 py-4 whitespace-nowrap text-sm text-gray-500 font-medium border-t border-gray-200 bg-gray-50/30">
                            {{ $no++ }}
                        </td>
                        <td class="px-6 py-4 border-t border-gray-200 bg-gray-50/30">
                            <div class="text-sm font-bold text-indigo-900">{{ $k->mahasiswa->nama }}</div>
                            <div class="text-xs text-gray-500">{{ $k->mahasiswa->nim }}</div>
                        </td>
                        @php $lastStudentId = $k->mahasiswa_id; @endphp
                    @else
                        {{-- Kosongkan jika mahasiswa masih sama --}}
                        <td class="px-4 py-4"></td>
                        <td class="px-6 py-4"></td>
                    @endif

                    {{-- Kolom Mata Kuliah --}}
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-700 font-medium">{{ $k->mataKuliah->nama_mk }}</div>
                        <div class="text-xs text-gray-400">{{ $k->kode_mk }} • {{ $k->mataKuliah->sks }} SKS</div>
                    </td>

                    {{-- Kolom Semester / TA --}}
                    <td class="px-6 py-4 text-center">
                        <span class="px-2 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800">
                            {{ $k->semester }}
                        </span>
                        <div class="text-xs text-gray-500 mt-1 font-bold">{{ $k->tahun_akademik }}</div>
                    </td>

                    {{-- Kolom Aksi --}}
                    <td class="px-6 py-4 text-right text-sm">
                        <button wire:click="deleteKrs({{ $k->id }})" 
                            onclick="confirm('Hapus pengambilan MK ini?') || event.stopImmediatePropagation()"
                            class="text-red-600 hover:text-red-900 font-bold p-1 hover:bg-red-50 rounded">
                            Hapus
                        </button>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="5" class="px-6 py-10 text-center text-gray-400 italic">Data KRS Kosong</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
    <div class="mt-4">{{ $krs_list->links() }}</div>

<x-dialog-modal wire:model="confirmingKrsAddition">
    <x-slot name="title">Tambah KRS Massal Paket Semester</x-slot>
    
    <x-slot name="content">
        <div class="space-y-4">
            <div>
                <x-label value="Target Angkatan" />
                <select wire:model="pilih_angkatan" class="w-full border-gray-300 rounded-lg shadow-sm text-sm">
                    <option value="">-- Pilih Angkatan --</option>
                    @foreach($list_angkatan as $ang)
                        <option value="{{ $ang->angkatan }}">Angkatan {{ $ang->angkatan }}</option>
                    @endforeach
                </select>
                <x-input-error for="pilih_angkatan" />
            </div>

            <div>
    <x-label value="Pilih Mata Kuliah (Urut per Semester)" />
    <select wire:model="selected_kode_mk" multiple class="w-full border-gray-300 rounded-lg shadow-sm h-60">
        @php $currentSmt = null; @endphp
        @foreach($mata_kuliahs as $mk)
            @if ($currentSmt !== $mk->smt)
                <optgroup label="SEMESTER {{ $mk->smt }}">
                @php $currentSmt = $mk->smt; @endphp
            @endif

            <option value="{{ $mk->kode_mk }}">
                [{{ $mk->kode_mk }}] {{ $mk->nama_mk }}
            </option>

            {{-- Tutup optgroup jika semester berikutnya berbeda --}}
            @if (!isset($mata_kuliahs[$loop->index + 1]) || $mata_kuliahs[$loop->index + 1]->smt !== $currentSmt)
                </optgroup>
            @endif
        @endforeach
    </select>
</div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <x-label value="Semester" />
                    <select wire:model="semester" class="w-full border-gray-300 rounded-lg shadow-sm text-sm">
                        <option value="">-- Pilih --</option>
                        <option value="Ganjil">Ganjil</option>
                        <option value="Genap">Genap</option>
                    </select>
                </div>
                <div>
                    <x-label value="Tahun Akademik" />
                    <x-input type="text" wire:model="tahun_akademik" placeholder="2025/2026" class="w-full" />
                </div>
            </div>
        </div>
    </x-slot>

    <x-slot name="footer">
        <x-secondary-button wire:click="$set('confirmingKrsAddition', false)">Batal</x-secondary-button>
        <x-button class="ms-3 bg-indigo-600" wire:click="saveKrsMassal">
            Proses Input Massal
        </x-button>
    </x-slot>
</x-dialog-modal>
</div>