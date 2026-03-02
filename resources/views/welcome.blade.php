<x-guest-layout>
    <div class="min-h-screen bg-white selection:bg-indigo-500 selection:text-white">
        <nav class="flex items-center justify-between px-8 py-6 max-w-7xl mx-auto">
            <div class="flex items-center gap-3">
                <img src="{{ asset('img/simpobe.png') }}" alt="Logo SIMPOBE" class="w-10 h-10 object-contain">
                <span class="text-xl font-bold tracking-tight text-slate-800">SIM<span class="text-indigo-600">POBE</span></span>
            </div>
            <div class="flex items-center gap-4">
                @auth
                    <a href="{{ url('/dashboard') }}" class="text-sm font-semibold text-slate-600 hover:text-indigo-600 transition">Dashboard</a>
                @else
                    <a href="{{ route('login') }}" class="text-sm font-semibold text-slate-600 hover:text-indigo-600 transition">Masuk</a>
                    <a href="{{ route('register') }}" class="px-5 py-2.5 bg-slate-900 text-white text-sm font-semibold rounded-full hover:bg-slate-800 transition">Daftar Akun</a>
                @endauth
            </div>
        </nav>

        <main class="max-w-7xl mx-auto px-8 pt-16 pb-24 text-center">
            <div class="inline-flex items-center gap-2 px-4 py-1.5 mb-6 text-sm font-medium text-indigo-700 bg-indigo-50 rounded-full border border-indigo-100">
                <img src="{{ asset('img/simpobe.png') }}" class="w-4 h-4 opacity-70" alt="">
                <span>Versi 1.0 • Standar Akreditasi Unggul</span>
            </div>
            
            <h1 class="text-5xl md:text-7xl font-extrabold text-slate-900 mb-8 tracking-tight">
                Selamat datang di Aplikasi <br>
                <span class="text-transparent bg-clip-text bg-gradient-to-r from-indigo-600 to-violet-600">SIMPOBE</span>
            </h1>
            
            <p class="text-lg text-slate-500 max-w-2xl mx-auto mb-12 leading-relaxed">
                Kelola evaluasi CPMK, visualisasi data mahasiswa, dan hasilkan portofolio dokumen OBE yang siap cetak hanya dalam hitungan detik.
            </p>

            <div class="flex flex-col sm:flex-row justify-center items-center gap-4">
                @auth
                    <a href="{{ route('portofolio.index') }}" class="w-full sm:w-auto px-8 py-4 bg-indigo-600 text-white font-bold rounded-2xl hover:bg-indigo-700 hover:shadow-2xl hover:shadow-indigo-200 transition-all duration-300 flex items-center justify-center gap-2">
                        Mulai Cetak Portofolio
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
                    </a>
                @else
                    <a href="{{ route('login') }}" class="w-full sm:w-auto px-8 py-4 bg-indigo-600 text-white font-bold rounded-2xl hover:bg-indigo-700 shadow-xl shadow-indigo-100 transition-all duration-300">
                        Masuk ke Sistem
                    </a>
                @endauth
            </div>

            <div class="mt-20 relative">
                <div class="absolute inset-0 bg-gradient-to-b from-transparent to-white z-10 h-40 bottom-0"></div>
                <div class="bg-slate-50 border border-slate-100 rounded-3xl p-4 shadow-2xl">
                    <div class="bg-white rounded-2xl shadow-sm border border-slate-200 overflow-hidden">
                        <div class="px-6 py-4 bg-slate-50 border-b border-slate-200 flex items-center gap-2">
                            <div class="flex gap-1.5">
                                <div class="w-3 h-3 rounded-full bg-slate-300"></div>
                                <div class="w-3 h-3 rounded-full bg-slate-300"></div>
                                <div class="w-3 h-3 rounded-full bg-slate-300"></div>
                            </div>
                            <div class="mx-auto bg-white border border-slate-200 px-4 py-1 rounded text-[10px] text-slate-400 w-1/3">
                                simpobe.uhb.ac.id
                            </div>
                        </div>
                        <div class="p-8 grid grid-cols-3 gap-6 text-left">
                            <div class="h-32 bg-slate-50 rounded-xl border border-dashed border-slate-200 animate-pulse"></div>
                            <div class="h-32 bg-slate-50 rounded-xl border border-dashed border-slate-200 animate-pulse"></div>
                            <div class="h-32 bg-slate-50 rounded-xl border border-dashed border-slate-200 animate-pulse"></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="py-12 text-center border-t border-slate-100">
            <div class="flex items-center justify-center gap-2 mb-2">
                <img src="{{ asset('img/simpobe.png') }}" class="w-5 h-5 grayscale opacity-50" alt="">
                <p class="text-slate-400 text-sm font-medium">
                    &copy; {{ date('Y') }} • Universitas Harapan Bangsa
                </p>
            </div>
        </footer>
    </div>
</x-guest-layout>