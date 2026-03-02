<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Ketercapaian CPL Mahasiswa') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="flex space-x-4 mb-4 border-b border-gray-200">
                <a href="{{ route('cpl.index') }}" 
                   class="pb-2 px-4 text-sm font-medium transition duration-150 {{ request()->routeIs('cpl.index') ? 'text-blue-600 border-b-2 border-blue-600 font-bold' : 'text-gray-500 hover:text-gray-700' }}">
                    Manajemen Master CPL
                </a>
                <a href="{{ route('cpl.ketercapaian') }}" 
                   class="pb-2 px-4 text-sm font-medium transition duration-150 {{ request()->routeIs('cpl.ketercapaian') ? 'text-blue-600 border-b-2 border-blue-600 font-bold' : 'text-gray-500 hover:text-gray-700' }}">
                    Ketercapaian CPL Mahasiswa
                </a>
            </div>

            @livewire('ketercapaian-cpl-manager')
        </div>
    </div>
</x-app-layout>