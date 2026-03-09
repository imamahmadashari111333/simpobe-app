<div>
    {{-- FORM INPUT DAN IMPORT (PENGATURAN GLOBAL) --}}
    <div class="bg-white p-6 rounded-lg shadow-sm mb-6 border border-gray-100">
        <h3 class="text-sm font-bold text-gray-700 mb-4 uppercase tracking-wider">Form Pengaturan Nilai & Dosen</h3>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
            <div>
                <label class="block text-xs font-semibold text-gray-600 uppercase">Semester</label>
                <input type="number" wire:model="smt" min="1" max="14" 
                    class="mt-1 block w-full border-gray-300 rounded text-sm focus:ring-indigo-500 focus:border-indigo-500" 
                    placeholder="Contoh: 1">
                @error('smt') <span class="text-red-500 text-[10px]">{{ $message }}</span> @enderror
            </div>

            <div>
                <label class="block text-xs font-semibold text-gray-600 uppercase">Mata Kuliah</label>
                <input list="list_mk" wire:model="kode_mk" 
                    class="mt-1 block w-full border-gray-300 rounded text-sm focus:ring-indigo-500 focus:border-indigo-500" 
                    placeholder="Ketik Kode atau Nama MK...">
                <datalist id="list_mk">
                    @foreach($daftar_mk as $mk)
                        <option value="{{ $mk->kode_mk }}">{{ $mk->nama_mk }}</option>
                    @endforeach
                </datalist>
                @error('kode_mk') <span class="text-red-500 text-[10px]">{{ $message }}</span> @enderror
            </div>

            <div>
                <label class="block text-xs font-semibold text-gray-600 uppercase">Tahun Akademik</label>
                <input type="text" wire:model="tahun_akademik" placeholder="2025/2026" 
                    class="mt-1 block w-full border-gray-300 rounded text-sm focus:ring-indigo-500 focus:border-indigo-500">
                @error('tahun_akademik') <span class="text-red-500 text-[10px]">{{ $message }}</span> @enderror
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div>
                <label class="block text-xs font-semibold text-gray-600 uppercase">Dosen Koordinator (1)</label>
                <input type="text" wire:model="dosen1" list="list_dosen"
                    class="mt-1 block w-full border-gray-300 rounded text-sm bg-blue-50 focus:ring-indigo-500 focus:border-indigo-500">
            </div>
            <div>
                <label class="block text-xs font-semibold text-gray-600 uppercase">Dosen Anggota (2)</label>
                <input type="text" wire:model="dosen2" list="list_dosen"
                    class="mt-1 block w-full border-gray-300 rounded text-sm focus:ring-indigo-500 focus:border-indigo-500">
            </div>
            <div>
                <label class="block text-xs font-semibold text-gray-600 uppercase">Dosen Anggota (3)</label>
                <input type="text" wire:model="dosen3" list="list_dosen"
                    class="mt-1 block w-full border-gray-300 rounded text-sm focus:ring-indigo-500 focus:border-indigo-500">
            </div>

            <datalist id="list_dosen">
                @foreach($list_dosen_pernah_input as $nama)
                    <option value="{{ $nama }}">
                @endforeach
            </datalist>
        </div>

        <div class="flex items-center justify-between border-t pt-4">
            <div class="flex flex-col gap-1">
                <div class="flex items-center gap-3">
                    <input type="file" wire:model="file_import" class="text-xs">
                    <button wire:click="importProses" wire:loading.attr="disabled" class="bg-indigo-600 text-white px-4 py-2 rounded text-xs font-bold shadow-sm hover:bg-indigo-700 transition">
                        <span wire:loading.remove>IMPORT SEKARANG</span>
                        <span wire:loading>PROSES...</span>
                    </button>
                </div>
                @error('file_import') <span class="text-red-500 text-[10px]">{{ $message }}</span> @enderror
            </div>
            <button wire:click="exportTemplate" class="text-xs font-bold text-green-700 underline flex items-center hover:text-green-800 transition">
                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path>
                </svg>
                DOWNLOAD TEMPLATE
            </button>
        </div>
    </div>

    {{-- AREA NOTIFIKASI --}}
    @if (session()->has('message')) 
        <div class="bg-green-600 text-black p-3 mb-4 text-xs rounded shadow-lg flex items-center">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
            <span class="font-bold">{{ session('message') }}</span>
        </div> 
    @endif

    {{-- FILTER DAN PENCARIAN --}}
    <div class="flex flex-col md:flex-row gap-4 mb-6">
        <div class="w-full md:w-1/3">
            <label class="block text-[10px] font-bold text-gray-500 uppercase mb-1">Filter Tahun</label>
            <div class="flex">
                <span class="inline-flex items-center px-3 text-gray-500 bg-gray-50 border border-r-0 border-gray-300 rounded-l-lg">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                    </svg>
                </span>
                <select wire:model.live="filter_tahun" class="block w-full min-w-0 flex-1 py-2 px-3 text-sm border-gray-300 rounded-none rounded-r-lg focus:ring-indigo-500 focus:border-indigo-500 bg-white">
                    <option value="">Semua Tahun Akademik</option>
                    @foreach($list_tahun as $th)
                        <option value="{{ $th }}">{{ $th }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="flex flex-col md:flex-row gap-4 mb-6">
    {{-- Input Pencarian --}}
    <div class="w-full md:w-2/4">
    <label class="block text-[10px] font-bold text-gray-500 uppercase mb-1">
        Cari Data 
        <span wire:loading wire:target="search" class="text-indigo-500 animate-pulse">(Mencari...)</span>
    </label>
    <div class="flex shadow-sm relative">
        <span class="inline-flex items-center px-3 text-gray-500 bg-gray-50 border border-r-0 border-gray-300 rounded-l-lg">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
            </svg>
        </span>
        <input type="text" 
            wire:model.live.debounce.500ms="search" 
            placeholder="Ketik Nama, NIM, atau Mata Kuliah..." 
            class="block w-full min-w-0 flex-1 py-2 px-3 text-sm border-gray-300 rounded-none rounded-r-lg focus:ring-indigo-500 focus:border-indigo-500">
    </div>
</div>
    {{-- Filter Tahun Akademik --}}
    <div class="w-full md:w-1/4">
        <label class="block text-[10px] font-bold text-gray-500 uppercase mb-1">Tahun Akademik</label>
        <select wire:model.live="filter_tahun" 
            class="block w-full py-2 px-3 text-sm border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
            <option value="">Semua Tahun</option>
            @foreach($list_tahun as $tahun)
                <option value="{{ $tahun }}">{{ $tahun }}</option>
            @endforeach
        </select>
    </div>

{{-- Filter Dosen Koordinator - Hanya tampil untuk Kaprodi --}}
@if(Auth::user()->role === 'Kaprodi')
    <div class="w-full md:w-1/4">
        <label class="block text-[10px] font-bold text-gray-500 uppercase mb-1">Dosen Koordinator</label>
        <select wire:model.live="filter_dosen" 
            class="block w-full py-2 px-3 text-sm border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
            <option value="">Semua Dosen</option>
            @foreach($list_dosen_pernah_input as $dosen)
                <option value="{{ $dosen }}">{{ $dosen }}</option>
            @endforeach
        </select>
    </div>
@endif
</div>
    </div>

    {{-- TABEL DATA --}}
    <div class="overflow-x-auto bg-white rounded-lg shadow border">
        <table class="w-full text-[10px] border-collapse">
            <thead>
                <tr class="bg-gray-100 text-gray-700 uppercase font-bold text-center">
                    <th class="p-2 border">No</th>
                    <th class="p-2 border">SMT</th>
                    <th class="p-2 border">Mata Kuliah</th>
                    <th class="p-2 border">Tahun Akademik</th>
                    <th class="p-2 border text-left">NIM</th>
                    <th class="p-2 border text-left">Nama</th>
                    <th class="p-2 border text-left">Prodi</th>
                    <th class="p-1 border bg-blue-50">Aktif</th>
                    <th class="p-1 border bg-blue-50">LKM</th>
                    <th class="p-1 border bg-blue-50">Quiz</th>
                    <th class="p-1 border bg-blue-50">Prak</th>
                    <th class="p-1 border bg-blue-50">UTS</th>
                    <th class="p-1 border bg-blue-50">UAS</th>
                    <th class="p-1 border bg-indigo-100 font-bold">Akhir</th>
                    <th class="p-1 border bg-indigo-100 font-bold">Huruf</th>
                    <th class="p-2 border text-left">Dosen Koordinator</th>
                    <th class="p-2 border">Aksi</th>
                </tr>
            </thead>
            <tbody>
                @php $prevGroup = null; @endphp
                @foreach($data_nilai as $n)
                    @php 
                        $currentGroup = $n->smt . $n->kode_mk . $n->tahun_akademik;
                        $isNewGroup = ($currentGroup !== $prevGroup);
                        $prevGroup = $currentGroup;
                        $rowStyle = $isNewGroup ? 'border-t-2 border-gray-300' : 'border-t border-gray-100';
                    @endphp
                    <tr class="{{ $rowStyle }} hover:bg-gray-50">
                        <td class="p-2 border text-center text-gray-400">{{ $loop->iteration }}</td>
                        <td class="p-2 border text-center font-bold {{ !$isNewGroup ? 'text-transparent' : 'bg-gray-50' }}">
                            {{ $n->smt }}
                        </td>
                        <td class="p-2 border font-medium {{ !$isNewGroup ? 'text-transparent' : 'bg-gray-50' }}">
                            {{ $n->kode_mk }} - {{ $n->mata_kuliah->nama_mk ?? '' }}
                        </td>
                        <td class="p-2 border text-center {{ !$isNewGroup ? 'text-transparent' : 'bg-gray-50' }}">
                            {{ $n->tahun_akademik }}
                        </td>
                        <td class="p-2 border font-mono text-indigo-700">{{ $n->nim }}</td>
                        <td class="p-2 border uppercase">{{ $n->mahasiswa->nama ?? 'Data Tidak Ditemukan' }}</td>
                        <td class="p-2 border text-gray-500">{{ $n->mahasiswa->prodi ?? '-' }}</td>
                        <td class="p-1 border text-center">{{ number_format($n->kehadiran, 0) }}</td>
                        <td class="p-1 border text-center">{{ number_format($n->tugas, 0) }}</td>
                        <td class="p-1 border text-center">{{ number_format($n->kuiz, 0) }}</td>
                        <td class="p-1 border text-center">{{ number_format($n->praktik, 0) }}</td>
                        <td class="p-1 border text-center">{{ number_format($n->uts, 0) }}</td>
                        <td class="p-1 border text-center">{{ number_format($n->uas, 0) }}</td>
                        <td class="p-1 border text-center font-bold bg-indigo-50 text-indigo-700">{{ $n->nilai_akhir }}</td>
                        <td class="p-1 border text-center font-bold bg-indigo-50">{{ $n->nilai_huruf }}</td>
                        <td class="p-2 border italic text-gray-600">{{ $n->dosen1 }}</td>
                        <td class="p-2 border text-center">
                            <div class="flex justify-center gap-1">
                                <button wire:click="edit({{ $n->id }})" class="p-1 bg-amber-100 text-amber-700 rounded hover:bg-amber-200" title="Edit Nilai Baris Ini">
                                    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2.5 2.5 0 113.536 3.536L12 17.242H8v-4.242L17.586 3.586z"/></svg>
                                </button>
                                <button onclick="confirm('Hapus data nilai ini?') || event.stopImmediatePropagation()" 
                                    wire:click="delete({{ $n->id }})" 
                                    class="p-1 bg-red-100 text-red-700 rounded hover:bg-red-200" title="Hapus">
                                    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                                </button>
                            </div>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    
    <div class="mt-2">
        {{ $data_nilai->links() }}
    </div>

    @if($showModal)
    <div class="fixed inset-0 z-50 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
        <div class="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
            <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" wire:click="closeModal"></div>

            <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

            <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full border-2 border-indigo-200">
                <div class="bg-indigo-600 px-4 py-3 flex justify-between items-center">
                    <h3 class="text-white font-bold text-sm uppercase tracking-wider">Update Komponen Nilai</h3>
                    <button wire:click="closeModal" class="text-white hover:text-gray-200">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>
                </div>
                
                <div class="bg-white px-6 py-4">
                    <div class="mb-4 bg-gray-50 p-3 rounded border border-gray-100">
                        <p class="text-[10px] text-gray-500 font-bold uppercase tracking-tight">Identitas Mahasiswa</p>
                        <p class="text-sm font-extrabold text-indigo-900">{{ $nama_mhs_edit }}</p>
                        <p class="text-xs text-gray-600 font-mono">{{ $nim_edit }} | {{ $mk_edit }}</p>
                    </div>

                    <div class="grid grid-cols-3 gap-4">
                        <div>
                            <label class="block text-[10px] font-bold text-gray-600 uppercase mb-1">Kehadiran</label>
                            <input type="number" wire:model="kehadiran" class="w-full text-sm border-gray-300 rounded focus:ring-indigo-500">
                        </div>
                        <div>
                            <label class="block text-[10px] font-bold text-gray-600 uppercase mb-1">Tugas (LKM)</label>
                            <input type="number" wire:model="tugas" class="w-full text-sm border-gray-300 rounded focus:ring-indigo-500">
                        </div>
                        <div>
                            <label class="block text-[10px] font-bold text-gray-600 uppercase mb-1">Quiz</label>
                            <input type="number" wire:model="kuiz" class="w-full text-sm border-gray-300 rounded focus:ring-indigo-500">
                        </div>
                        <div>
                            <label class="block text-[10px] font-bold text-gray-600 uppercase mb-1">Praktik</label>
                            <input type="number" wire:model="praktik" class="w-full text-sm border-gray-300 rounded focus:ring-indigo-500">
                        </div>
                        <div>
                            <label class="block text-[10px] font-bold text-gray-600 uppercase mb-1">UTS</label>
                            <input type="number" wire:model="uts" class="w-full text-sm border-gray-300 rounded focus:ring-indigo-500">
                        </div>
                        <div>
                            <label class="block text-[10px] font-bold text-gray-600 uppercase mb-1">UAS</label>
                            <input type="number" wire:model="uas" class="w-full text-sm border-gray-300 rounded focus:ring-indigo-500">
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4 mt-6 pt-4 border-t border-dashed border-gray-200">
                        <div>
                            <label class="block text-[10px] font-bold text-indigo-700 uppercase mb-1">Nilai Akhir</label>
                            <input type="text" wire:model="nilai_akhir" class="w-full text-sm font-bold bg-indigo-50 border-indigo-200 rounded text-center text-indigo-800">
                        </div>
                        <div>
                            <label class="block text-[10px] font-bold text-indigo-700 uppercase mb-1">Grade / Huruf</label>
                            <input type="text" wire:model="nilai_huruf" class="w-full text-sm font-bold bg-indigo-50 border-indigo-200 rounded text-center text-indigo-800">
                        </div>
                    </div>
                </div>

                <div class="bg-gray-50 px-6 py-4 sm:flex sm:flex-row-reverse gap-2">
                    <button type="button" wire:click="updateNilai" wire:loading.attr="disabled" class="w-full inline-flex justify-center rounded bg-indigo-600 px-4 py-2 text-xs font-bold text-white shadow hover:bg-indigo-700 sm:w-auto">
                        <span wire:loading.remove>SIMPAN PERUBAHAN</span>
                        <span wire:loading>MENYIMPAN...</span>
                    </button>
                    <button type="button" wire:click="closeModal" class="mt-3 w-full inline-flex justify-center rounded border border-gray-300 bg-white px-4 py-2 text-xs font-bold text-gray-700 shadow-sm hover:bg-gray-50 sm:mt-0 sm:w-auto">
                        BATAL
                    </button>
                </div>
            </div>
        </div>
    </div>
    @endif
</div>