<nav x-data="{ open: false }" class="bg-white border-b border-gray-100">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex">
                <div class="shrink-0 flex items-center">
                    <a href="{{ route('dashboard') }}">
                        <img src="{{ asset('img/simpobe.png') }}" alt="Logo SIMPOBE" class="block h-10 w-auto">
                    </a>
                </div>

                <div class="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex">
                    <x-nav-link href="{{ route('dashboard') }}" :active="request()->routeIs('dashboard')">
                        {{ __('Dashboard') }}
                    </x-nav-link>

                    <div class="hidden sm:flex sm:items-center sm:ms-6">
                        <x-dropdown align="right" width="48">
                            <x-slot name="trigger">
                                <button class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150">
                                    <div>Manajemen Data</div>
                                    <div class="ms-1">
                                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                        </svg>
                                    </div>
                                </button>
                            </x-slot>
                            <x-slot name="content">
                                @if(auth()->user()->level == 1)
                                    <x-dropdown-link href="{{ route('fakultas.index') }}"> Data Fakultas </x-dropdown-link>
                                    <x-dropdown-link href="{{ route('prodi.index') }}"> Data Prodi </x-dropdown-link>
                                    <x-dropdown-link href="{{ route('session.index') }}"> Log Akses User </x-dropdown-link>
                                @endif
                                <x-dropdown-link href="{{ route('users.dosen') }}"> Data Dosen </x-dropdown-link>
                            </x-slot>
                        </x-dropdown>
                    </div>

                    <div class="hidden sm:flex sm:items-center sm:ms-6">
                        <x-dropdown align="right" width="48">
                            <x-slot name="trigger">
                                <button class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150">
                                    <div>Kurikulum OBE</div>
                                    <div class="ms-1">
                                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                        </svg>
                                    </div>
                                </button>
                            </x-slot>
                            <x-slot name="content">
                                <x-dropdown-link href="{{ route('pl.index') }}"> Profil Lulusan (PL) </x-dropdown-link>
                                <x-dropdown-link href="{{ route('cpl.index') }}"> CPL Prodi </x-dropdown-link>
                                <x-dropdown-link href="{{ route('cpl-pl.index') }}"> Pemetaan CPL - PL </x-dropdown-link>
                                <div class="border-t border-gray-100"></div>
                                <x-dropdown-link href="{{ route('bk.index') }}"> Bahan Kajian (BK) </x-dropdown-link>
                                <x-dropdown-link href="{{ route('cpl-bk.index') }}"> Pemetaan CPL - BK </x-dropdown-link>
                                <div class="border-t border-gray-100"></div>
                                <x-dropdown-link href="{{ route('mata-kuliah.index') }}"> Mata Kuliah </x-dropdown-link>
                                <x-dropdown-link href="{{ route('bk-mk.index') }}"> Pemetaan BK - MK </x-dropdown-link>
                                <x-dropdown-link href="{{ route('cpl-mk.index') }}"> Pemetaan CPL - MK </x-dropdown-link>
                                <x-dropdown-link href="{{ route('cplbk-mk.index') }}"> Pemetaan CPL & BK - MK </x-dropdown-link>
                                <div class="border-t border-gray-100"></div>
                                <x-dropdown-link href="{{ route('cpmk.index') }}"> CPMK </x-dropdown-link>
                                <x-dropdown-link href="{{ route('sub-cpmk.index') }}"> Sub CPMK </x-dropdown-link>
                                <x-dropdown-link href="{{ route('relasi.index') }}"> Relasi Capaian </x-dropdown-link>
                                <x-dropdown-link href="{{ route('metodepenilaian.index') }}"> Metode Penilaian </x-dropdown-link>
                            </x-slot>
                        </x-dropdown>
                    </div>

                    <div class="hidden sm:flex sm:items-center sm:ms-6">
                        <x-dropdown align="right" width="48">
                            <x-slot name="trigger">
                                <button class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150">
                                    <div>Penilaian OBE</div>
                                    <div class="ms-1">
                                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                        </svg>
                                    </div>
                                </button>
                            </x-slot>
                            <x-slot name="content">
                                <x-dropdown-link href="{{ route('mahasiswa.index') }}"> Data Mahasiswa </x-dropdown-link>
                                <div class="border-t border-gray-200"></div>
                                <x-dropdown-link href="{{ route('penilaian.import') }}"> 
                                    <span class="text-blue-600 font-bold">Import Nilai Excel</span> 
                                </x-dropdown-link>
                                <x-dropdown-link href="{{ route('penilaian.evaluasi_cpmk') }}"> Evaluasi CPMK </x-dropdown-link>
                                <x-dropdown-link href="{{ route('portofolio.index') }}"> Portofolio </x-dropdown-link>
                                <x-dropdown-link href="{{ route('cpl.ketercapaian') }}"> Ketercapaian CPL Mahasiswa </x-dropdown-link>
                                <x-dropdown-link href="{{ route('cpl.analisis') }}"> Analisis CPL </x-dropdown-link>
                            </x-slot>
                        </x-dropdown>
                    </div>
                </div>
            </div>

            <div class="hidden sm:flex sm:items-center sm:ms-6">
                <div class="ms-3 relative">
                    <x-dropdown align="right" width="48">
                        <x-slot name="trigger">
                            @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())
                                <button class="flex text-sm border-2 border-transparent rounded-full focus:outline-none focus:border-gray-300 transition">
                                    <img class="size-8 rounded-full object-cover" src="{{ Auth::user()->profile_photo_url }}" alt="{{ Auth::user()->name }}" />
                                </button>
                            @else
                                <span class="inline-flex rounded-md">
                                    <button type="button" class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none focus:bg-gray-50 active:bg-gray-50 transition ease-in-out duration-150">
                                        {{ Auth::user()->name }}
                                        <svg class="ms-2 -me-0.5 size-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                                        </svg>
                                    </button>
                                </span>
                            @endif
                        </x-slot>
                        <x-slot name="content">
                            <div class="block px-4 py-2 text-xs text-gray-400">{{ __('Manage Account') }}</div>
                            <x-dropdown-link href="{{ route('profile.show') }}">{{ __('Profile') }}</x-dropdown-link>
                            <form method="POST" action="{{ route('logout') }}" x-data>
                                @csrf
                                <x-dropdown-link href="{{ route('logout') }}" @click.prevent="$root.submit();">{{ __('Log Out') }}</x-dropdown-link>
                            </form>
                        </x-slot>
                    </x-dropdown>
                </div>
            </div>

            <div class="-me-2 flex items-center sm:hidden">
                <button @click="open = ! open" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out">
                    <svg class="size-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                        <path :class="{'hidden': open, 'inline-flex': ! open }" class="inline-flex" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                        <path :class="{'hidden': ! open, 'inline-flex': open }" class="hidden" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <div :class="{'block': open, 'hidden': ! open}" class="hidden sm:hidden">
        <div class="pt-2 pb-3 space-y-1">
            <x-responsive-nav-link href="{{ route('dashboard') }}" :active="request()->routeIs('dashboard')">
                {{ __('Dashboard') }}
            </x-responsive-nav-link>

            <div class="border-t border-gray-200 pt-2">
                <div class="px-4 font-medium text-sm text-gray-500">Manajemen Data</div>
                @if(auth()->user()->level == 1)
                    <x-responsive-nav-link href="{{ route('fakultas.index') }}"> Data Fakultas </x-responsive-nav-link>
                    <x-responsive-nav-link href="{{ route('prodi.index') }}"> Data Prodi </x-responsive-nav-link>
                    <x-responsive-nav-link href="{{ route('session.index') }}"> Log Akses User </x-responsive-nav-link>
                @endif
                <x-responsive-nav-link href="{{ route('users.dosen') }}"> Data Dosen </x-responsive-nav-link>
            </div>

            <div class="border-t border-gray-200 pt-2">
                <div class="px-4 font-medium text-sm text-gray-500">Kurikulum OBE</div>
                <x-responsive-nav-link href="{{ route('pl.index') }}"> Profil Lulusan (PL) </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('cpl.index') }}"> CPL Prodi </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('cpl-pl.index') }}"> Pemetaan CPL - PL </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('bk.index') }}"> Bahan Kajian (BK) </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('mata-kuliah.index') }}"> Mata Kuliah </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('cpmk.index') }}"> CPMK </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('sub-cpmk.index') }}"> Sub CPMK </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('relasi.index') }}"> Relasi Capaian </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('metodepenilaian.index') }}"> Metode Penilaian </x-responsive-nav-link>
            </div>

            <div class="border-t border-gray-200 pt-2">
                <div class="px-4 font-medium text-sm text-gray-500">Penilaian OBE</div>
                <x-responsive-nav-link href="{{ route('mahasiswa.index') }}"> Data Mahasiswa </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('penilaian.import') }}"> Import Nilai Excel </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('penilaian.evaluasi_cpmk') }}"> Evaluasi CPMK </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('portofolio.index') }}"> Portofolio </x-responsive-nav-link>
                <x-responsive-nav-link href="{{ route('cpl.ketercapaian') }}"> Ketercapaian CPL Mahasiswa </x-responsive-nav-link>
            </div>
        </div>

        <div class="pt-4 pb-1 border-t border-gray-200">
            <div class="flex items-center px-4">
                @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())
                    <div class="shrink-0 me-3">
                        <img class="size-10 rounded-full object-cover" src="{{ Auth::user()->profile_photo_url }}" alt="{{ Auth::user()->name }}" />
                    </div>
                @endif
                <div>
                    <div class="font-medium text-base text-gray-800">{{ Auth::user()->name }}</div>
                    <div class="font-medium text-sm text-gray-500">{{ Auth::user()->email }}</div>
                </div>
            </div>
            <div class="mt-3 space-y-1">
                <x-responsive-nav-link href="{{ route('profile.show') }}" :active="request()->routeIs('profile.show')">{{ __('Profile') }}</x-responsive-nav-link>
                <form method="POST" action="{{ route('logout') }}" x-data>
                    @csrf
                    <x-responsive-nav-link href="{{ route('logout') }}" @click.prevent="$root.submit();">{{ __('Log Out') }}</x-responsive-nav-link>
                </form>
            </div>
        </div>
    </div>
</nav>