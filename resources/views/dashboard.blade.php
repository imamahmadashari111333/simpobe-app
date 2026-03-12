<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard</h2>
    </x-slot>

    <div class="py-12 bg-gray-100">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white p-8 rounded-lg shadow-sm border border-gray-200">
                
                <div class="mb-10">
                    <h1 class="text-3xl font-bold text-gray-900">Selamat Datang, {{ Auth::user()->name }}</h1>
                    <p class="text-gray-600 mt-2">SIMPOBE (Sistem Integrasi Manajemen Pendataan & Outcome-Based Education) </p>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
                    <div class="p-6 rounded-xl text-white shadow-md" style="background: linear-gradient(135deg, #1e40af, #3b82f6);">
                        <p class="text-xs font-bold uppercase opacity-80">Total Kurikulum</p>
                        <h3 class="text-2xl font-bold mt-1">{{ $total_mk }} Mata Kuliah</h3>
                        <p class="text-sm mt-1 opacity-90">{{ $total_sks }} SKS</p>
                        <a href="{{ route('mata-kuliah.index') }}" class="text-white text-xs font-semibold mt-3 inline-block hover:underline underline-offset-4">KELOLA MK →</a>
                    </div>

                    <div class="p-6 rounded-xl border border-gray-200 bg-white shadow-sm hover:shadow-md transition">
                        <p class="text-gray-400 text-xs font-bold uppercase">Profil Lulusan</p>
                        <h3 class="text-2xl font-bold mt-1 text-gray-800">{{ count($profil_lulusan) }} Profil</h3>
                        <a href="{{ route('pl.index') }}" class="text-blue-600 text-xs font-semibold mt-3 inline-block hover:text-blue-800 transition">LIHAT DETAIL →</a>
                    </div>

                    <div class="p-6 rounded-xl border border-gray-200 bg-white shadow-sm hover:shadow-md transition">
                        <p class="text-gray-400 text-xs font-bold uppercase">Status CPL</p>
                        <h3 class="text-2xl font-bold mt-1 text-gray-800">{{ count($cpl_prodi) }} Capaian</h3>
                        <a href="{{ route('cpl.index') }}" class="text-blue-600 text-xs font-semibold mt-3 inline-block hover:text-blue-800 transition">KELOLA CPL →</a>
                    </div>
                </div>

                <div class="pt-6 border-t border-gray-100">
                    <h4 class="text-xs font-bold text-gray-400 uppercase tracking-widest mb-4">Akses Cepat</h4>
                    <div class="flex flex-wrap gap-4">
                        <a href="{{ route('bk.index') }}" class="px-6 py-2 bg-gray-900 text-white rounded-lg text-sm font-medium hover:bg-black transition flex items-center">
                            <svg class="w-4 h-4 me-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg>
                            Bahan Kajian
                        </a>

                        <a href="{{ route('cpl-mk.index') }}" class="px-6 py-2 bg-white border border-gray-300 text-gray-700 rounded-lg text-sm font-medium hover:bg-gray-50 transition flex items-center shadow-sm">
                            <svg class="w-4 h-4 me-2 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A2 2 0 013 15.488V5.111a2 2 0 011.106-1.789l5.447-2.724a2 2 0 011.894 0l5.447 2.724A2 2 0 0118 5.112v10.377a2 2 0 01-1.106 1.789L11.447 20a2 2 0 01-1.894 0z"></path></svg>
                            Pemetaan CPL-MK
                        </a>

                        <a href="{{ route('penilaian.import') }}" class="px-6 py-2 bg-blue-50 border border-blue-200 text-blue-700 rounded-lg text-sm font-medium hover:bg-blue-100 transition flex items-center">
                            <svg class="w-4 h-4 me-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>
                            Import Nilai
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</x-app-layout>