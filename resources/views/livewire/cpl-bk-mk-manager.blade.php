<div>
    @if (session()->has('message'))
        <div class="mb-4 p-2 bg-green-100 border border-green-400 text-green-700 rounded text-xs">
            {{ session('message') }}
        </div>
    @endif

    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-4 gap-4">
        <div>
            <h3 class="text-lg font-semibold text-gray-800">Pemetaan CPL & BK ke Mata Kuliah</h3>
            <p class="text-[10px] text-gray-500 uppercase tracking-tighter">* Sinkronisasi dari tabel cpl_mk dan bk_mk</p>
        </div>
        
        <div class="flex items-center gap-2 w-full md:w-auto">
            <div class="relative w-full md:w-64">
                <input wire:model.live="search" type="text" placeholder="Cari Mata Kuliah / Kode..." 
                    class="w-full text-xs border-gray-300 focus:border-blue-500 focus:ring-blue-500 rounded-md shadow-sm">
            </div>

            <button wire:click="syncData" wire:loading.attr="disabled" 
                class="flex items-center bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-md shadow-sm uppercase text-xs tracking-widest transition shrink-0">
                <span wire:loading.remove>Sinkronkan</span>
                <span wire:loading>Memproses...</span>
            </button>
        </div>
    </div>

    <div class="overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-left border-collapse bg-white">
            <thead>
                <tr class="bg-gray-100 text-[11px] uppercase text-gray-700 border-b">
                    <th class="p-3 border text-center w-12">NO</th>
                    <th class="p-3 border w-24">KODE MK</th>
                    <th class="p-3 border w-48">NAMA MATA KULIAH</th>
                    <th class="p-3 border w-24 text-center">BK</th>
                    <th class="p-3 border w-24 text-center">CPL</th>
                    <th class="p-3 border">DESKRIPSI LENGKAP</th>
                </tr>
            </thead>
            <tbody class="text-xs">
                @php $no = 1; @endphp
                @forelse($items as $kode_mk => $group)
                    @foreach($group as $index => $item)
                    <tr class="hover:bg-gray-50 border-b transition">
                        @if($index === 0)
                            <td class="p-3 border text-center align-top bg-white" rowspan="{{ count($group) }}">{{ $no++ }}</td>
                            <td class="p-3 border font-bold align-top bg-white text-slate-700" rowspan="{{ count($group) }}">{{ $kode_mk }}</td>
                            <td class="p-3 border font-medium align-top bg-white text-gray-800" rowspan="{{ count($group) }}">
                                {{ $item->mataKuliah->nama_mk ?? '-' }}
                            </td>
                        @endif
                        
                        <td class="p-3 border text-center font-bold text-green-700">{{ $item->kode_bk ?? '-' }}</td>
                        <td class="p-3 border text-center font-bold text-blue-700">{{ $item->kode_cpl ?? '-' }}</td>
                        <td class="p-3 border text-gray-600 leading-relaxed">
                            <div class="mb-2">
                                <span class="font-bold text-gray-800">Bahan Kajian:</span> 
                                {{ $item->bahanKajian->bahan_kajian ?? 'Belum dipetakan' }}
                            </div>
                            <div>
                                <span class="font-bold text-gray-800">CPL:</span> 
                                {{ $item->cpl->deskripsi_cpl ?? 'Belum dipetakan' }}
                            </div>
                        </td>
                    </tr>
                    @endforeach
                @empty
                    <tr>
                        <td colspan="6" class="p-10 text-center text-gray-500 italic">
                            Data tidak ditemukan. Silakan sesuaikan kata kunci pencarian atau klik Sinkronkan.
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>