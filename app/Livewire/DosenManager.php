<?php

namespace App\Livewire;

use App\Models\User;
use App\Models\DosenProfil;
use App\Models\Fakultas;
use App\Models\Prodi;
use Livewire\Component;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Hash;

class DosenManager extends Component
{
    use WithPagination;

    public $search = '';
    public $confirmingDosenAddition = false;
    public $confirmingDosenDeletion = false;
    public $showCustomJabatan = false;

    public $userId, $name, $email, $password, $nik, $nidn, $gelar_depan, $gelar_belakang, $prodi, $fakultas, $jabatan_fungsional, $jabatan_struktural, $level;

    public function updatingSearch()
    {
        $this->resetPage();
    }

    public function updatedFakultas()
    {
        $this->prodi = '';
    }

    public function checkJabatan()
    {
        if ($this->jabatan_struktural === 'Lainnya') {
            $this->showCustomJabatan = true;
            $this->jabatan_struktural = '';
        }
    }

    public function cancelCustomJabatan()
    {
        $this->showCustomJabatan = false;
        $this->jabatan_struktural = '';
    }

    public function saveDosen()
    {
        if (auth()->user()->level != 1) return;

        $profilId = 'NULL';
        if ($this->userId) {
            $existingUser = User::find($this->userId);
            $profilId = ($existingUser && $existingUser->profil) ? $existingUser->profil->id : 'NULL';
        }

        $this->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $this->userId,
            'password' => $this->userId ? 'nullable|min:8' : 'required|min:8',
            'nik' => 'required|unique:dosen_profils,nik,' . $profilId,
            'prodi' => 'required',
            'fakultas' => 'required',
            'jabatan_fungsional' => 'required', // Validasi Tambahan
        ]);

        $user = User::updateOrCreate(['id' => $this->userId], [
            'name' => $this->name,
            'email' => $this->email,
            'password' => $this->password ? Hash::make($this->password) : User::find($this->userId)->password,
            'role' => $this->userId ? User::find($this->userId)->role : 'dosen',
            'level' => $this->level ? 1 : 0,
        ]);

        DosenProfil::updateOrCreate(['user_id' => $user->id], [
            'nik' => $this->nik,
            'nidn' => $this->nidn,
            'gelar_depan' => $this->gelar_depan,
            'gelar_belakang' => $this->gelar_belakang,
            'prodi' => $this->prodi,
            'fakultas' => $this->fakultas,
            'jabatan_fungsional' => $this->jabatan_fungsional, // Penyimpanan Tambahan
            'jabatan_struktural' => $this->jabatan_struktural,
        ]);

        $this->confirmingDosenAddition = false;
        $this->reset(['userId', 'name', 'email', 'password', 'nik', 'nidn', 'gelar_depan', 'gelar_belakang', 'prodi', 'fakultas', 'jabatan_fungsional', 'jabatan_struktural', 'level']);
        session()->flash('message', 'Data Berhasil Disimpan.');
    }

    public function editDosen(User $user)
    {
        if (auth()->user()->level != 1) return;

        $this->userId = $user->id;
        $this->name = $user->name;
        $this->email = $user->email;
        $this->level = $user->level == 1 ? true : false;
        
        $this->nik = $user->profil->nik ?? '';
        $this->nidn = $user->profil->nidn ?? '';
        $this->gelar_depan = $user->profil->gelar_depan ?? '';
        $this->gelar_belakang = $user->profil->gelar_belakang ?? '';
        $this->fakultas = $user->profil->fakultas ?? '';
        $this->prodi = $user->profil->prodi ?? '';
        $this->jabatan_fungsional = $user->profil->jabatan_fungsional ?? ''; // Load data saat edit
        $this->jabatan_struktural = $user->profil->jabatan_struktural ?? '';
        
        $this->confirmingDosenAddition = true;
    }

    public function confirmDosenDeletion($id)
    {
        if (auth()->user()->level != 1) return;
        $this->userId = $id;
        $this->confirmingDosenDeletion = true;
    }

    public function deleteDosen()
    {
        if (auth()->user()->level != 1) return;
        $user = User::find($this->userId);
        if ($user) { $user->delete(); }
        $this->confirmingDosenDeletion = false;
        session()->flash('message', 'Dosen berhasil dihapus.');
    }

    public function render()
    {
        $query = User::query();

        if ($this->search) {
            $query->where(function($q) {
                $searchTerm = '%' . $this->search . '%';
                $q->where('name', 'like', $searchTerm)
                  ->orWhere('email', 'like', $searchTerm)
                  ->orWhereHas('profil', function($qp) use ($searchTerm) {
                      $qp->where('nik', 'like', $searchTerm)
                        ->orWhere('nidn', 'like', $searchTerm)
                        ->orWhere('prodi', 'like', $searchTerm);
                  });
            });
        }

        $filteredProdi = collect();
        if ($this->fakultas) {
            $f = Fakultas::where('nama_fakultas', $this->fakultas)->first();
            if ($f) {
                $filteredProdi = Prodi::where('fakultas_id', $f->id)->orderBy('nama_prodi', 'asc')->get();
            }
        }

        return view('livewire.dosen-manager', [
            'dosens' => $query->orderBy('name', 'asc')->paginate(10),
            'listFakultas' => Fakultas::orderBy('nama_fakultas', 'asc')->get(),
            'listProdi' => $filteredProdi,
        ]);
    }
}