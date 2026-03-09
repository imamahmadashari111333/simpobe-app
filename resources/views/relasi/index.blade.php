<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Pemetaan Relasi Capaian (OBE Mapping)') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            {{-- Bagian Alert/Informasi Singkat --}}
            <div class="mb-6 p-4 bg-blue-50 border-l-4 border-blue-400 text-blue-700 shadow-sm rounded-r-lg">
                <p class="text-sm">
                    <strong>Informasi:</strong> Halaman ini digunakan untuk menghubungkan Mata Kuliah dengan CPL Prodi, CPMK, dan Sub-CPMK. 
                    Pastikan data master pada menu Kurikulum OBE sudah terisi lengkap.
                </p>
            </div>

            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-6">
                {{-- Memanggil Komponen Livewire --}}
                @livewire('relasi-capaian-manager')
            </div>
        </div>
    </div>
</x-app-layout>