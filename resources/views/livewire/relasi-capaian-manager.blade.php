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

    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-4">
        <div>
            <h3 class="text-lg font-medium text-gray-900">Relasi Capaian (OBE Mapping - {{ $prodi }})</h3>
        </div>

        <div class="flex items-center gap-2 w-full md:w-auto">
            <div class="relative w-full md:w-80">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3">
                    <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                </span>
                <input wire:model.live.debounce.300ms="search" type="text" placeholder="Cari Kode atau Nama Mata Kuliah..." class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg text-sm focus:ring-blue-500 shadow-sm">
            </div>

            @if(Auth::user()->role === 'Kaprodi')
                <x-secondary-button wire:click="showImportModal">Import</x-secondary-button>
                <x-button wire:click="showModal">Tambah Relasi</x-button>
            @endif
        </div>
    </div>

    <table class="w-full text-left border-collapse bg-white shadow-sm rounded-lg overflow-hidden border">
        <thead>
            <tr class="bg-gray-50 text-[10px] uppercase border-b text-gray-700 font-bold tracking-wider">
                <th class="p-3 border text-center w-12">No</th>
                <th class="p-3 border w-48">Mata Kuliah</th>
                <th class="p-3 border w-48">CPL</th>
                <th class="p-3 border w-56">CPMK</th>
                <th class="p-3 border">Sub-CPMK</th>
                <th class="p-3 border text-center w-20">Aksi</th>
            </tr>
        </thead>
        <tbody class="text-sm">
            @php
                $countMk = $relasis->groupBy('kode_mk')->map->count();
                $countCpl = $relasis->groupBy(fn($item) => $item->kode_mk . $item->kode_cpl)->map->count();
                $countCpmk = $relasis->groupBy(fn($item) => $item->kode_mk . $item->kode_cpl . $item->kode_cpmk)->map->count();
                $displayedMk = []; $displayedCpl = []; $displayedCpmk = []; $noUrut = 1;
            @endphp

            @forelse($relasis as $relasi)
            <tr class="hover:bg-gray-50 border-b align-top transition-colors">
                @if(!isset($displayedMk[$relasi->kode_mk]))
                    <td class="p-3 border text-center text-gray-400 text-xs font-bold" rowspan="{{ $countMk[$relasi->kode_mk] }}">{{ $noUrut++ }}</td>
                    <td class="p-3 border bg-white" rowspan="{{ $countMk[$relasi->kode_mk] }}">
                        <div class="font-bold text-gray-700 text-xs">{{ $relasi->kode_mk }}</div>
                        <div class="text-[10px] text-gray-500 uppercase leading-tight">{{ $relasi->mataKuliah->nama_mk ?? '-' }}</div>
                    </td>
                    @php $displayedMk[$relasi->kode_mk] = true; @endphp
                @endif

                @php $cplKey = $relasi->kode_mk . $relasi->kode_cpl; @endphp
                @if(!isset($displayedCpl[$cplKey]))
                    <td class="p-3 border" rowspan="{{ $countCpl[$cplKey] }}">
                        <span class="inline-block px-1.5 py-0.5 bg-slate-100 text-slate-700 font-mono font-bold text-[10px] rounded border border-slate-200 mb-1">{{ $relasi->kode_cpl }}</span>
                        <div class="text-[10px] text-gray-600 leading-relaxed italic">{{ $relasi->cpl->deskripsi_cpl ?? '' }}</div>
                    </td>
                    @php $displayedCpl[$cplKey] = true; @endphp
                @endif

                @php $cpmkKey = $relasi->kode_mk . $relasi->kode_cpl . $relasi->kode_cpmk; @endphp
                @if(!isset($displayedCpmk[$cpmkKey]))
                    <td class="p-3 border" rowspan="{{ $countCpmk[$cpmkKey] }}">
                        <div class="text-blue-600 font-bold font-mono text-[10px] mb-1">{{ $relasi->kode_cpmk }}</div>
                        <div class="text-[10px] text-gray-600 leading-relaxed italic">{{ $relasi->cpmk->deskripsi_cpmk ?? '' }}</div>
                    </td>
                    @php $displayedCpmk[$cpmkKey] = true; @endphp
                @endif

                <td class="p-3 border">
                    <div class="text-indigo-600 font-bold font-mono text-[10px] mb-1">{{ $relasi->kode_sub_cpmk }}</div>
                    <div class="text-[10px] text-gray-600 leading-relaxed">{{ $relasi->subCpmk->uraian_sub_cpmk ?? '' }}</div>
                </td>

                <td class="p-3 border text-center whitespace-nowrap">
                    @if(Auth::user()->role === 'Kaprodi')
                    <button wire:click="confirmDelete({{ $relasi->id }})" class="p-1.5 bg-red-50 text-red-600 rounded-md hover:bg-red-600 hover:text-white transition-all shadow-sm">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                    </button>
                    @endif
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="6" class="p-10 text-center text-gray-400 italic">Data mapping relasi tidak ditemukan.</td>
            </tr>
            @endforelse
        </tbody>
    </table>

    {{-- MODAL IMPORT --}}
    <x-dialog-modal wire:model="confirmingImport">
        <x-slot name="title">Import Relasi Capaian</x-slot>
        <x-slot name="content">
            <div class="mb-4 text-xs text-gray-600">
                Gunakan template Excel untuk melakukan import massal relasi antara MK, CPL, CPMK, dan Sub-CPMK.
                <div class="mt-2">
                    <x-secondary-button wire:click="downloadTemplate" class="text-[10px]">Download Template</x-secondary-button>
                </div>
            </div>
            <div class="mt-4">
                <x-label value="File Excel" />
                <input type="file" wire:model="file_import" class="mt-1 block w-full text-xs" />
                <x-input-error for="file_import" class="mt-2" />
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingImport', false)">Batal</x-secondary-button>
            <x-button class="ml-2 bg-indigo-600" wire:click="importProses">Proses Import</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL TAMBAH/EDIT --}}
    <x-dialog-modal wire:model="confirmingItemAddEdit">
        <x-slot name="title">{{ $selected_id ? 'Edit Relasi' : 'Tambah Relasi Baru' }}</x-slot>
        <x-slot name="content">
            <div class="space-y-4">
                {{-- 1. Searchable Mata Kuliah --}}
                <div class="relative">
                    <x-label value="Mata Kuliah (Prodi: {{ $prodi }})" />
                    <input type="text" wire:model.live.debounce.300ms="searchMK" placeholder="Cari Kode atau Nama MK..." class="w-full border-gray-300 rounded-md text-sm shadow-sm focus:ring-blue-500">
                    @if(!empty($list_mk) && $searchMK != ($kode_mk . ' - ' . ($list_mk->where('kode_mk', $kode_mk)->first()->nama_mk ?? '')))
                        <div class="absolute z-50 w-full bg-white border border-gray-200 rounded-md shadow-lg mt-1 max-h-48 overflow-y-auto">
                            @foreach($list_mk as $mk)
                                <button type="button" wire:click="selectMK('{{ $mk->kode_mk }}', '{{ $mk->nama_mk }}')" class="w-full text-left px-4 py-2 text-sm hover:bg-indigo-50 border-b last:border-0 transition-colors">
                                    <span class="font-bold text-indigo-600">{{ $mk->kode_mk }}</span> 
                                    <span class="text-gray-600">- {{ $mk->nama_mk }}</span>
                                </button>
                            @endforeach
                        </div>
                    @endif
                </div>

                {{-- 2. Pilih CPL --}}
                <div>
                    <x-label value="Pilih CPL" />
                    <select wire:model.live="kode_cpl" class="w-full border-gray-300 rounded-md text-sm shadow-sm focus:ring-blue-500">
                        <option value="">-- Pilih CPL --</option>
                        @foreach($list_cpl as $cpl) 
                            <option value="{{ $cpl->kode_cpl }}">
                                {{ $cpl->kode_cpl }} - {{ Str::limit($cpl->deskripsi_cpl, 80) }}
                            </option> 
                        @endforeach
                    </select>
                </div>

                <hr class="border-gray-100">

                {{-- 3. CPMK --}}
                <div class="{{ !$kode_cpl ? 'opacity-40 pointer-events-none' : '' }}">
                    <div class="flex justify-between items-center mb-1">
                        <x-label value="CPMK" />
                        <button type="button" wire:click="toggleCreateCpmk" class="text-[9px] font-bold uppercase px-2 py-1 rounded {{ $is_creating_cpmk ? 'bg-gray-200 text-gray-700' : 'bg-blue-600 text-white' }}">
                            {{ $is_creating_cpmk ? 'Batal' : '+ Baru' }}
                        </button>
                    </div>
                    
                    @if($is_creating_cpmk)
                        <div class="p-3 bg-blue-50 border border-blue-100 rounded-lg space-y-2">
                            <input type="text" wire:model="kode_cpmk" class="w-full border-gray-300 rounded text-sm font-mono focus:ring-blue-500">
                            <textarea wire:model="new_deskripsi_cpmk" placeholder="Tulis Deskripsi CPMK..." class="w-full border-gray-300 rounded text-sm focus:ring-blue-500" rows="2"></textarea>
                        </div>
                    @else
                        <select wire:model.live="kode_cpmk" class="w-full border-gray-300 rounded-md text-sm shadow-sm focus:ring-blue-500">
                            <option value="">-- Pilih CPMK --</option>
                            @foreach($list_cpmk as $cpmk) 
                                <option value="{{ $cpmk->kode_cpmk }}">
                                    {{ $cpmk->kode_cpmk }} - {{ Str::limit($cpmk->deskripsi_cpmk, 80) }}
                                </option> 
                            @endforeach
                        </select>
                    @endif
                </div>

                {{-- 4. Sub-CPMK --}}
                <div class="{{ !$kode_cpmk ? 'opacity-40 pointer-events-none' : '' }}">
                    <div class="flex justify-between items-center mb-1">
                        <x-label value="Sub-CPMK" />
                        <button type="button" wire:click="toggleCreateSub" class="text-[9px] font-bold uppercase px-2 py-1 rounded {{ $is_creating_sub ? 'bg-gray-200 text-gray-700' : 'bg-indigo-600 text-white' }}">
                            {{ $is_creating_sub ? 'Batal' : '+ Baru' }}
                        </button>
                    </div>

                    @if($is_creating_sub)
                        <div class="p-3 bg-indigo-50 border border-indigo-100 rounded-lg space-y-2">
                            <input type="text" wire:model="kode_sub_cpmk" class="w-full border-gray-300 rounded text-sm font-mono focus:ring-indigo-500">
                            <textarea wire:model="new_uraian_sub" placeholder="Tulis Uraian Sub-CPMK..." class="w-full border-gray-300 rounded text-sm focus:ring-indigo-500" rows="2"></textarea>
                            <textarea wire:model="new_materi_pembelajaran" placeholder="Materi Pembelajaran (Boleh Kosong)..." class="w-full border-gray-300 rounded text-sm focus:ring-indigo-500" rows="2"></textarea>
                        </div>
                    @else
                        <select wire:model.live="kode_sub_cpmk" class="w-full border-gray-300 rounded-md text-sm shadow-sm focus:ring-indigo-500">
                            <option value="">-- Pilih Sub-CPMK --</option>
                            @foreach($list_sub_cpmk as $sub) 
                                <option value="{{ $sub->kode_sub_cpmk }}">
                                    {{ $sub->kode_sub_cpmk }} - {{ Str::limit($sub->uraian_sub_cpmk, 80) }}
                                </option> 
                            @endforeach
                        </select>
                    @endif
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemAddEdit', false)">Batal</x-secondary-button>
            <x-button class="ml-2" wire:click="save">Simpan Relasi</x-button>
        </x-slot>
    </x-dialog-modal>

    {{-- MODAL HAPUS --}}
    <x-confirmation-modal wire:model="confirmingItemDeletion">
        <x-slot name="title">Hapus Relasi</x-slot>
        <x-slot name="content">Apakah Anda yakin ingin menghapus mapping relasi ini?</x-slot>
        <x-slot name="footer">
            <x-secondary-button wire:click="$set('confirmingItemDeletion', false)">Batal</x-secondary-button>
            <x-danger-button class="ml-2" wire:click="delete">Hapus</x-danger-button>
        </x-slot>
    </x-confirmation-modal>
</div>