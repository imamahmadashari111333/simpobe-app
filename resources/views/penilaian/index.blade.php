<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Evaluasi & Laporan Nilai OBE') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-6">
                {{-- Kita panggil Manager yang sama, namun nanti di dalam Manager 
                     bisa kita beri kondisi atau hanya menampilkan tabel saja --}}
                @livewire('nilai-manager')
            </div>
        </div>
    </div>
</x-app-layout>