<x-guest-layout>
    <x-authentication-card>
        <x-slot name="logo">
            <a href="/">
                <img src="{{ asset('img/simpobe.png') }}" alt="Logo SIMPOBE" class="w-20 h-20 object-contain">
            </a>
        </x-slot>

        <x-validation-errors class="mb-4" />

        <div x-data="{ 
            secretCode: '', 
            isAuthorized: false, 
            checkCode() {
                if (this.secretCode === 'puyerobe') {
                    this.isAuthorized = true;
                } else {
                    alert('Kode salah!');
                }
            }
        }">
            {{-- STEP 1: GATEKEEPER --}}
            <template x-if="!isAuthorized">
                <div class="py-4">
                    <div class="mb-4 text-center">
                        <h2 class="text-lg font-bold text-gray-700 uppercase">Otentikasi Pendaftaran</h2>
                        <p class="text-xs text-gray-500">Masukkan kode akses untuk membuka form pendaftaran dosen.</p>
                    </div>
                    <x-label value="Kode Akses" />
                    <x-input class="block mt-1 w-full" type="password" x-model="secretCode" @keydown.enter="checkCode()" />
                    <x-button class="mt-4 w-full justify-center bg-indigo-600" @click="checkCode()">Buka Form</x-button>
                </div>
            </template>

            {{-- STEP 2: FULL REGISTER FORM --}}
            <template x-if="isAuthorized">
                <form method="POST" action="{{ route('register') }}" class="mt-4">
                    @csrf
                    <input type="hidden" name="registration_code" value="puyerobe">

                    <div class="grid grid-cols-2 gap-4">
                        <div class="col-span-2 bg-indigo-50 p-2 rounded text-[10px] text-indigo-700 uppercase font-black border border-indigo-100">Akun Institusi</div>
                        
                        <div class="col-span-1">
                            <x-label for="name" value="Nama Lengkap" />
                            <x-input id="name" class="block mt-1 w-full text-sm" type="text" name="name" :value="old('name')" required autofocus />
                        </div>
                        <div class="col-span-1">
                            <x-label for="email" value="Email Institusi" />
                            <x-input id="email" class="block mt-1 w-full text-sm" type="email" name="email" :value="old('email')" required />
                        </div>

                        <div class="col-span-1 bg-gray-50 p-2 rounded mt-2 border border-gray-100">
                            <x-label for="password" value="Password" />
                            <x-input id="password" class="block mt-1 w-full text-sm" type="password" name="password" required />
                        </div>
                        <div class="col-span-1 bg-gray-50 p-2 rounded mt-2 border border-gray-100">
                            <x-label for="password_confirmation" value="Konfirmasi Password" />
                            <x-input id="password_confirmation" class="block mt-1 w-full text-sm" type="password" name="password_confirmation" required />
                        </div>

                        <div class="col-span-2 bg-gray-100 p-2 rounded text-[10px] text-gray-600 uppercase font-black border border-gray-200 mt-2">Atribut Akademik</div>
                        
                        <div><x-label value="NIK" /><x-input type="text" name="nik" class="w-full mt-1 text-sm" required /></div>
                        <div><x-label value="NIDN (Opsional)" /><x-input type="text" name="nidn" class="w-full mt-1 text-sm" /></div>
                        
                        <div><x-label value="Gelar Depan" /><x-input type="text" name="gelar_depan" class="w-full mt-1 text-sm" /></div>
                        <div><x-label value="Gelar Belakang" /><x-input type="text" name="gelar_belakang" class="w-full mt-1 text-sm" /></div>

                        <div>
                            <x-label value="Fakultas" />
                            <select name="fakultas" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm" required>
                                <option value="">-- Pilih --</option>
                                @foreach(App\Models\Fakultas::all() as $f)
                                    <option value="{{ $f->nama_fakultas }}">{{ $f->nama_fakultas }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div>
                            <x-label value="Program Studi" />
                            <select name="prodi" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm" required>
                                <option value="">-- Pilih --</option>
                                @foreach(App\Models\Prodi::all() as $p)
                                    <option value="{{ $p->nama_prodi }}">{{ $p->nama_prodi }}</option>
                                @endforeach
                            </select>
                        </div>
                        {{-- Tambahkan ini di dalam grid atribut akademik, misalnya di bawah NIK/NIDN --}}
<div class="col-span-2">
    <x-label value="Jabatan Fungsional" />
    <select name="jabatan_fungsional" class="w-full mt-1 border-gray-300 rounded-md shadow-sm text-sm" required>
        <option value="">-- Pilih Jabatan Fungsional --</option>
        <option value="Asisten Ahli">Asisten Ahli</option>
        <option value="Lektor">Lektor</option>
        <option value="Lektor Kepala">Lektor Kepala</option>
        <option value="Guru Besar">Guru Besar</option>
        <option value="Tenaga Pengajar">Tenaga Pengajar (Belum Jafa)</option>
    </select>
</div>
                    </div>

                    <div class="flex items-center justify-end mt-6">
                        <x-button class="bg-indigo-600">Daftar Sekarang</x-button>
                    </div>
                </form>
            </template>
        </div>
    </x-authentication-card>
</x-guest-layout>