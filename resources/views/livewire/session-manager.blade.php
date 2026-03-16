<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Log Akses User (100 Terbaru)
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-6">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">User</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">IP Address</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Perangkat</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Aktivitas Terakhir</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        @foreach($sessions as $session)
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    {{ $session->user->name ?? 'Guest / Terputus' }}
                                    <br><span class="text-xs text-gray-400">{{ $session->user->email ?? '-' }}</span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    {{ $session->ip_address }}
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600">
                                    <span class="text-xs truncate block style="max-width: 200px">
                                        {{ $session->user_agent }}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    {{ \Carbon\Carbon::createFromTimestamp($session->last_activity)->timezone('Asia/Jakarta')->translatedFormat('d M Y, H:i:s') }} WIB
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>