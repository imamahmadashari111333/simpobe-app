<?php

namespace App\Livewire;

use App\Models\Session;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class SessionManager extends Component
{
    public function render()
    {
        // Proteksi level user
        if (Auth::user()->level != 1) {
            abort(403);
        }

        $sessions = Session::with('user')
            ->orderBy('last_activity', 'desc')
            ->limit(100)
            ->get();

        return view('livewire.session-manager', [
            'sessions' => $sessions
        ])->layout('layouts.app'); // Gunakan layout Jetstream
    }
}