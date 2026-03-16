<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Log Akses User') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-6">
                
                {{-- Header Tabel --}}
                <div class="flex flex-col md:flex-row justify-between items-center mb-6">
                    <h3 class="text-lg font-bold text-gray-800 uppercase">100 Aktivitas Terbaru</h3>
                    <div class="text-xs text-gray-500 italic">
                        Terakhir diperbarui: {{ now()->timezone('Asia/Jakarta')->format('H:i:s') }} WIB
                    </div>
                </div>

                {{-- Tabel Responsif Container --}}
                <div class="overflow-hidden border border-gray-200 rounded-lg shadow-sm">
                    <div class="overflow-x-auto">
                        <table class="w-full divide-y divide-gray-200 text-sm text-left">
                            <thead class="bg-gray-50 text-gray-500 uppercase font-bold">
                                <tr>
                                    <th class="px-6 py-3">User</th>
                                    <th class="px-6 py-3">Alamat IP</th>
                                    <th class="px-6 py-3">Perangkat</th>
                                    <th class="px-6 py-3 text-right">Aktivitas Terakhir</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200 bg-white">
                                @forelse($sessions as $session)
                                    <tr class="hover:bg-gray-50 transition">
                                        <td class="px-6 py-4">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 h-9 w-9">
                                                    <img class="h-9 w-9 rounded-full object-cover shadow-sm border border-gray-200" 
                                                         src="{{ $session->user ? $session->user->profile_photo_url : 'https://ui-avatars.com/api/?name=Guest&color=7F9CF5&background=EBF4FF' }}" 
                                                         alt="">
                                                </div>
                                                <div class="ms-3">
                                                    <div class="font-bold text-indigo-600">
                                                        {{ $session->user->name ?? 'Guest / Visitor' }}
                                                    </div>
                                                    <div class="text-xs text-gray-500">
                                                        {{ $session->user->email ?? '-' }}
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4">
                                            <span class="font-mono text-xs bg-gray-100 text-gray-700 px-2 py-1 rounded border">
                                                {{ $session->ip_address }}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 text-gray-500">
                                            <div class="max-w-xs truncate text-xs" title="{{ $session->user_agent }}">
                                                {{ $session->user_agent }}
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-right">
                                            <div class="text-gray-900 font-bold">
                                                {{ \Carbon\Carbon::createFromTimestamp($session->last_activity)->timezone('Asia/Jakarta')->translatedFormat('d M Y') }}
                                            </div>
                                            <div class="text-xs text-indigo-500 font-semibold uppercase tracking-tighter">
                                                {{ \Carbon\Carbon::createFromTimestamp($session->last_activity)->timezone('Asia/Jakarta')->format('H:i:s') }} WIB
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="4" class="px-6 py-10 text-center text-gray-400 italic">
                                            Belum ada data aktivitas terekam.
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="mt-4 flex justify-between items-center text-[10px] text-gray-400 uppercase tracking-widest font-bold">
                    <span>Database Session Driver</span>
                    <span>Laravel Jetstream v12</span>
                </div>
            </div>
        </div>
    </div>
</div>