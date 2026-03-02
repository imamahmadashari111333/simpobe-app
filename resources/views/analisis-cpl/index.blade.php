<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Analisis Ketercapaian Per CPL') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="flex space-x-4 mb-4 border-b border-gray-200">
                <a href="{{ route('cpl.index') }}" class="pb-2 px-4 text-sm {{ request()->routeIs('cpl.index') ? 'text-blue-600 border-b-2 border-blue-600 font-bold' : 'text-gray-500' }}">Master CPL</a>
                <a href="{{ route('cpl.ketercapaian') }}" class="pb-2 px-4 text-sm {{ request()->routeIs('cpl.ketercapaian') ? 'text-blue-600 border-b-2 border-blue-600 font-bold' : 'text-gray-500' }}">Ketercapaian Mahasiswa</a>
                <a href="{{ route('cpl.analisis') }}" class="pb-2 px-4 text-sm {{ request()->routeIs('cpl.analisis') ? 'text-blue-600 border-b-2 border-blue-600 font-bold' : 'text-gray-500' }}">Analisis Per CPL</a>
            </div>

            @livewire('analisis-cpl-manager')
        </div>
    </div>
</x-app-layout>