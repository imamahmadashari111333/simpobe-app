<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\CplBkMk;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CplBkMkManager extends Component
{
    public $search = '';
    public $prodi;

    // Tambahkan pengamat (listener) agar pencarian reset ke halaman awal jika pakai pagination
    public function updatingSearch()
    {
        // Jika Anda menggunakan pagination, tambahkan: $this->resetPage();
    }

    public function mount()
    {
        $user = Auth::user();
        $this->prodi = trim($user->profil->prodi ?? '');
        
        if (!$this->prodi) {
            session()->flash('error', 'Profil Prodi tidak ditemukan.');
            return;
        }
        
        if (CplBkMk::where('prodi', $this->prodi)->count() === 0) {
            $this->syncData();
        }
    }

    public function syncData()
    {
        if (empty($this->prodi)) return;

        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        try {
            DB::transaction(function () {
                CplBkMk::where('prodi', $this->prodi)->delete();

                $mkCpl = DB::table('cpl_mk')->where('prodi', $this->prodi)->get()->groupBy('kode_mk');
                $mkBk = DB::table('bk_mk')->where('prodi', $this->prodi)->get()->groupBy('kode_mk');

                $allMkCodes = collect($mkCpl->keys())->concat($mkBk->keys())->unique()->filter();

                foreach ($allMkCodes as $kodeMk) {
                    $cpls = isset($mkCpl[$kodeMk]) ? $mkCpl[$kodeMk]->pluck('kode_cpl')->toArray() : [null];
                    $bks = isset($mkBk[$kodeMk]) ? $mkBk[$kodeMk]->pluck('kode_bk')->toArray() : [null];

                    foreach ($cpls as $cpl) {
                        foreach ($bks as $bk) {
                            if (is_null($cpl) && is_null($bk)) continue;

                            CplBkMk::create([
                                'kode_mk'  => $kodeMk,
                                'kode_cpl' => $cpl,
                                'kode_bk'  => $bk,
                                'prodi'    => $this->prodi,
                            ]);
                        }
                    }
                }
            });

            session()->flash('message', 'Sinkronisasi berhasil diperbarui!');

        } catch (\Exception $e) {
            session()->flash('error', 'Gagal: ' . $e->getMessage());
        } finally {
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
        }
    }

    public function render()
    {
        $items = CplBkMk::with(['mataKuliah', 'cpl', 'bahanKajian'])
            ->where('prodi', $this->prodi)
            ->when($this->search, function($query) {
                $query->where(function($q) {
                    $q->where('kode_mk', 'like', '%' . $this->search . '%')
                      ->orWhere('kode_cpl', 'like', '%' . $this->search . '%')
                      ->orWhere('kode_bk', 'like', '%' . $this->search . '%')
                      // Pencarian berdasarkan Nama Mata Kuliah di tabel relasi
                      ->orWhereHas('mataKuliah', function($sub) {
                          $sub->where('nama_mk', 'like', '%' . $this->search . '%');
                      });
                });
            })
            ->get()
            ->groupBy('kode_mk');

        return view('livewire.cpl-bk-mk-manager', [
            'items' => $items,
        ]);
    }
}