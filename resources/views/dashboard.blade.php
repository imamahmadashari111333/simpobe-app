<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard</h2>
    </x-slot>

    <div class="py-12 bg-gray-100">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white p-8 rounded-lg shadow-sm border border-gray-200">
                
                <div class="mb-10">
                    <h1 class="text-3xl font-bold text-gray-900">Selamat Datang, {{ Auth::user()->name }}! 👋</h1>
                    <p class="text-gray-600 mt-2">Sistem Manajemen Kurikulum OBE - Kelola data CPL, BK, dan MK dalam satu tempat.</p>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
                    <div class="p-6 rounded-xl text-white shadow-md" style="background: linear-gradient(135deg, #1e40af, #3b82f6);">
                        <p class="text-xs font-bold uppercase opacity-80">Total Kurikulum</p>
                        <h3 class="text-2xl font-bold mt-1">{{ $total_mk }} Mata Kuliah</h3>
                        <p class="text-sm mt-1 opacity-90">{{ $total_sks }} SKS (Netto)</p>
                    </div>

                    <div class="p-6 rounded-xl border border-gray-200 bg-white shadow-sm hover:shadow-md transition">
                        <p class="text-gray-400 text-xs font-bold uppercase">Profil Lulusan</p>
                        <h3 class="text-2xl font-bold mt-1 text-gray-800">{{ count($profil_lulusan) }} Profil</h3>
                        <a href="#" class="text-blue-600 text-xs font-semibold mt-3 inline-block">LIHAT DETAIL →</a>
                    </div>

                    <div class="p-6 rounded-xl border border-gray-200 bg-white shadow-sm hover:shadow-md transition">
                        <p class="text-gray-400 text-xs font-bold uppercase">Status CPL</p>
                        <h3 class="text-2xl font-bold mt-1 text-gray-800">{{ count($cpl_prodi) }} Capaian</h3>
                        <a href="#" class="text-blue-600 text-xs font-semibold mt-3 inline-block">KELOLA CPL →</a>
                    </div>
                </div>

                <div class="pt-6 border-t border-gray-100">
                    <h4 class="text-xs font-bold text-gray-400 uppercase tracking-widest mb-4">Akses Cepat</h4>
                    <div class="flex flex-wrap gap-4">
                        <a href="#" class="px-6 py-2 bg-gray-900 text-white rounded-lg text-sm font-medium hover:bg-black transition">Bahan Kajian</a>
                        <a href="#" class="px-6 py-2 bg-white border border-gray-300 text-gray-700 rounded-lg text-sm font-medium hover:bg-gray-50 transition">Pemetaan CPL-MK</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</x-app-layout>