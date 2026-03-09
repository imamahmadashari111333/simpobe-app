<div>
    {{-- Notifikasi --}}
    @if (session()->has('message'))
        <div class="mb-4 p-2 bg-green-100 border border-green-400 text-green-700 rounded text-xs shadow-sm">
            {{ session('message') }}
        </div>
    @endif
    @if (session()->has('error'))
        <div class="mb-4 p-2 bg-red-100 border border-red-400 text-red-700 rounded text-xs shadow-sm">
            {{ session('error') }}
        </div>
    @endif

    {{-- HEADER --}}
    <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
        <div>
            <h3 class="text-lg font-semibold text-gray-800">Metode & Bobot Penilaian</h3>
            <p class="text-[10px] text-gray-500 uppercase tracking-widest font-medium">
                Prodi: {{ $prodi }} | Distribusi Bobot per Sub-CPMK
            </p>
        </div>

        <div class="flex flex-wrap items-center gap-2 w-full md:w-auto justify-end">
            <div class="relative w-full md:w-64">
                <input wire:model.live.debounce.300ms="search" type="text" 
                    placeholder="Cari MK atau Kode..." 
                    class="w-full text-xs border-gray-300 focus:ring-blue-500 rounded-md shadow-sm">
            </div>

            @if(Auth::user()->role === 'Kaprodi')
                <x-secondary-button wire:click="showImportModal" class="h-9 text-xs">
                    Import Excel
                </x-secondary-button>
                <x-button wire:click="showModal" class="h-9 bg-indigo-600 hover:bg-indigo-700 text-xs">
                    Tambah Data & Bobot
                </x-button>
            @endif
        </div>
    </div>

    {{-- TABEL DATA --}}
    <div class="overflow-x-auto shadow-md sm:rounded-lg border border-gray-200">
        <table class="w-full text-left border-collapse bg-white">
            <thead>
                <tr class="bg-gray-100 text-gray-700 uppercase text-[10px] font-bold tracking-wider border-b">
                    <th class="p-2 border text-center w-12">No</th>
                    <th class="p-2 border">Kode MK</th>
                    <th class="p-2 border">Nama Mata Kuliah</th>
                    <th class="p-2 border">CPMK / Sub-CPMK</th>
                    <th class="p-2 border text-center">MBKM</th>
                    <th class="p-2 border text-center">Hadir</th>
                    <th class="p-2 border text-center">Tugas</th>
                    <th class="p-2 border text-center">Quiz</th>
                    <th class="p-2 border text-center">UTS</th>
                    <th class="p-2 border text-center">UAS</th>
                    <th class="p-2 border text-center">Prak</th>
                    <th class="p-2 border text-center text-blue-600">TOTAL MK</th>
                    @if(Auth::user()->role === 'Kaprodi')
                        <th class="p-2 border text-center w-20">Aksi</th>
                    @endif
                </tr>
            </thead>
            <tbody class="text-xs text-gray-700">
                @php $grouped = $penilaians->groupBy('kode_mk'); @endphp

                @forelse($grouped as $kode_mk => $items)
                    @php
                        $totalMK = $items->sum('mbkm') + $items->sum('kehadiran') + $items->sum('tugas') + 
                                  $items->sum('quiz') + $items->sum('uts') + $items->sum('uas') + $items->sum('praktik');
                    @endphp

                    @foreach($items as $index => $p)
                    <tr class="hover:bg-gray-50 border-b transition-colors">
                        @if($index === 0)
                            <td class="p-2 border text-center align-top font-bold bg-gray-50/30" rowspan="{{ count($items) }}">
                                {{ $loop->parent->iteration }}
                            </td>
                            <td class="p-2 border font-mono font-bold align-top bg-white" rowspan="{{ count($items) }}">
                                {{ $kode_mk }}
                            </td>
                            <td class="p-2 border align-top font-medium bg-white" rowspan="{{ count($items) }}">
                                {{ $p->mataKuliah->nama_mk ?? 'N/A' }}
                            </td>
                        @endif

                        <td class="p-2 border bg-white">
                            <div class="flex flex-col">
                                <span class="font-mono text-blue-700 font-bold">{{ $p->kode_cpmk }}</span>
                                <span class="text-[10px] text-gray-500 italic">{{ $p->kode_sub_cpmk }}</span>
                            </div>
                        </td>
                        
                        <td class="p-2 border text-center">{{ number_format($p->mbkm, 0) }}%</td>
                        <td class="p-2 border text-center">{{ number_format($p->kehadiran, 0) }}%</td>
                        <td class="p-2 border text-center">{{ number_format($p->tugas, 0) }}%</td>
                        <td class="p-2 border text-center">{{ number_format($p->quiz, 0) }}%</td>
                        <td class="p-2 border text-center">{{ number_format($p->uts, 0) }}%</td>
                        <td class="p-2 border text-center">{{ number_format($p->uas, 0) }}%</td>
                        <td class="p-2 border text-center">{{ number_format($p->praktik, 0) }}%</td>
                        
                        @if($index === 0)
                            <td class="p-2 border text-center font-bold align-middle bg-gray-50 {{ $totalMK != 100 ? 'text-red-600' : 'text-green-600' }}" rowspan="{{ count($items) }}">
                                {{ number_format($totalMK, 0) }}%
                            </td>
                        @endif

                        @if(Auth::user()->role === 'Kaprodi')
                        <td class="p-2 border text-center whitespace-nowrap">
                            <button wire:click="edit({{ $p->id }})" class="text-blue-600 hover:text-blue-800 p-1">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                            </button>
                            <button wire:click="confirmDelete({{ $p->id }})" class="text-red-600 hover:text-red-800 p-1">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                            </button>
                        </td>
                        @endif
                    </tr>
                    @endforeach
                @empty
                    <tr>
                        <td colspan="13" class="p-10 text-center text-gray-500 italic border">Data penilaian belum tersedia.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    {{-- MODAL IMPORT --}}
    <x-dialog-modal wire:model="confirmingImport">
        <x-slot name="title">Import Metode Penilaian</x-slot>
        <x-slot name="content">
            <div class="mb-4">
                <x-secondary-button wire:click="downloadTemplate" class="text-xs">
                    Download Template Excel
                </x-secondary-button>
            </div>

            <div class="bg-blue-50 p-3 rounded mb-4 text-[11px] text-blue-700 leading-relaxed border border-blue-200">
                <p class="font-bold mb-1 underline">Instruksi:</p>
                <ul class="list-disc ml-4">
                    <li>Gunakan template yang telah diunduh.</li>
                    <li>Pastikan kode MK dan CPMK sesuai.</li>
                    <li>Urutan kolom: id, kode_mk, kode_cpmk, kode_sub_cpmk, mbkm, hadir, tugas, quiz, uts, uas, praktik, prodi.</li>
                </ul>
            </div>

            <div class="mt-4">
                <x-label value="Pilih File Excel yang Akan Diimport" />
                <input type="file" wire:model="file_import" class="mt-1 block w-full text-xs" />
                <div wire:loading wire:target="file_import" class="text-xs text-blue-500 mt-1">Mengunggah...</div>
                <x-input-error for="file_import" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingImport', false)">Batal</x-secondary-button>
            <x-button class="ml-2 bg-indigo-600" wire:click="importProses" wire:loading.attr="disabled">Proses Import</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL INPUT & EDIT --}}
    <x-dialog-modal wire:model="confirmingItemAddEdit">
        <x-slot name="title">{{ $selected_id ? 'Edit Bobot Penilaian' : 'Tambah Bobot Penilaian' }}</x-slot>
        <x-slot name="content">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                <div>
                    <x-label value="Mata Kuliah" />
                    <input list="list_mk" wire:model.live="kode_mk" class="mt-1 block w-full border-gray-300 rounded text-sm" placeholder="Kode MK..." {{ $selected_id ? 'disabled' : '' }}>
                    <datalist id="list_mk">@foreach($list_mk as $mk)<option value="{{ $mk->kode_mk }}">{{ $mk->nama_mk }}</option>@endforeach</datalist>
                </div>
                <div>
                    <x-label value="CPMK" />
                    <input list="list_cpmk" wire:model.live="kode_cpmk" class="mt-1 block w-full border-gray-300 rounded text-sm" placeholder="Kode CPMK..." {{ $selected_id ? 'disabled' : '' }}>
                    <datalist id="list_cpmk">@foreach($list_cpmk as $cpmk)<option value="{{ $cpmk->kode_cpmk }}">{{ $cpmk->deskripsi_cpmk }}</option>@endforeach</datalist>
                </div>
                <div>
                    <x-label value="Sub-CPMK" />
                    <input list="list_sub_cpmk" wire:model.live="kode_sub_cpmk" class="mt-1 block w-full border-gray-300 rounded text-sm" placeholder="Kode Sub..." {{ $selected_id ? 'disabled' : '' }}>
                    <datalist id="list_sub_cpmk">@foreach($list_sub_cpmk as $sub)<option value="{{ $sub->kode_sub_cpmk }}">{{ $sub->uraian_sub_cpmk }}</option>@endforeach</datalist>
                </div>
            </div>

            <div class="mt-6 font-bold text-xs border-b pb-2 uppercase text-gray-700 tracking-wider">Komponen Bobot (%)</div>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mt-4">
                @foreach(['mbkm', 'kehadiran', 'tugas', 'quiz', 'uts', 'uas', 'praktik'] as $field)
                <div>
                    <x-label value="{{ strtoupper($field) }}" class="text-[10px]" />
                    <x-input type="number" class="w-full text-sm mt-1" wire:model.defer="{{ $field }}" min="0" max="100" />
                </div>
                @endforeach
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemAddEdit', false)">Batal</x-secondary-button>
            <x-button class="ml-2 bg-indigo-600" wire:click="save">Simpan Data</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL HAPUS --}}
    <x-confirmation-modal wire:model="confirmingItemDeletion">
        <x-slot name="title">Hapus Data</x-slot>
        <x-slot name="content">Apakah Anda yakin ingin menghapus bobot penilaian ini?</x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemDeletion', false)">Batal</x-secondary-button>
            <x-danger-button class="ml-2" wire:click="delete">Hapus</x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>