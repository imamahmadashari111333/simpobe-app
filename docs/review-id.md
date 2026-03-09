# Tinjauan Teknis Laravel — Aplikasi Simpobe

## 1. Ringkasan Proyek

| Item | Detail |
|------|--------|
| **Laravel** | v12 |
| **PHP** | ^8.2 |
| **Stack** | Laravel Jetstream (Fortify), Livewire v3, Laravel Sanctum |
| **Domain** | OBE (Outcome-Based Education) — kurikulum, penilaian, CPL/CPMK |
| **Paket** | barryvdh/laravel-dompdf, openspout/openspout, Laravel Boost (dev) |

Aplikasi mengelola:
- **Kurikulum OBE**: Profil Lulusan (PL), CPL, Bahan Kajian (BK), Mata Kuliah, CPMK, Sub-CPMK, relasi capaian, metode penilaian
- **Penilaian OBE**: Mahasiswa, KRS, nilai, evaluasi CPMK, portofolio PDF
- **Master**: Fakultas, Prodi, Dosen (via `DosenProfil`)

---

## 2. Tinjauan Arsitektur

### 2.1 Pola

- **MVC** dengan Livewire untuk CRUD dan UI reaktif.
- Controller sebagian besar mengembalikan view; Livewire menangani state, validasi, dan persistensi.
- PortofolioController menyimpang dari pola ini karena membawa banyak logika bisnis.

### 2.2 Pemisahan Tanggung Jawab

| Aspek | Status | Catatan |
|--------|--------|---------|
| Controllers | ⚠️ Campuran | Controller ramping (CplController) vs controller gemuk (PortofolioController ~230 baris) |
| Livewire | ✅ OK | Logika CRUD ada di komponen |
| Service layer | ❌ Tidak ada | Tidak ada `App\Services` |
| Repository | ❌ Tidak ada | Eloquent langsung di controller/Livewire |

### 2.3 Service / Repository

- Tidak ada kelas Service atau Repository.
- Logika bisnis (mis. `hitungNilai()`, pembuatan PDF) ada di controller dan komponen Livewire.
- Disarankan ekstrak ke service: pembuatan Portofolio, perhitungan nilai, dan import.

---

## 3. Struktur Folder

```
app/
├── Actions/Fortify/          # Jetstream/Fortify actions
├── Actions/Jetstream/
├── Http/Controllers/         # 24 controller
├── Imports/                  # NilaiImport (menggunakan Maatwebsite\Excel - tidak terpasang!)
├── Livewire/                 # 22 komponen Livewire (CRUD managers)
├── Models/                   # 20+ model
├── Providers/
└── View/Components/
```

**Observasi:**
- Layout standar Laravel 12.
- `Imports/NilaiImport.php` menggunakan `Maatwebsite\Excel` (tidak ada di composer.json); proyek memakai OpenSpout.
- Tidak ada `app/Policies/`, `app/Services/`, atau `app/Repositories/`.
- Tidak ada `app/Http/Requests/` (tidak ada kelas Form Request).

---

## 4. Konvensi Penamaan

### 4.1 Model

| Konvensi | Contoh | Catatan |
|----------|--------|---------|
| PascalCase | `Cpl`, `ProfilLulusan`, `BahanKajian` | OK |
| Singkatan | Cpl, Cpmk, Bk, Mk, Pl | Domain (OBE Indonesia) |
| Override tabel | `Cpl` → `cpl_prodi`, `BahanKajian` → `bahan_kajian` | OK untuk tabel non-standar |

### 4.2 Tabel (snake_case)

- `mata_kuliah`, `bahan_kajian`, `cpl_prodi`, `penilaian_komponens`, `dosen_profils`
- Campuran singular/plural; Laravel menganggap plural. Override lewat `$table` bila perlu.

### 4.3 Controller

- Gaya resource: `CplController`, `MataKuliahController`, `PortofolioController`
- Jelas dan konsisten.

### 4.4 Route

- Prefix: `kurikulum-obe`, `penilaian-obe`
- Nama resource: `pl`, `cpl`, `cpl-pl`, `mata-kuliah`, `metodepenilaian` (penulisan hyphen tidak konsisten)

### 4.5 Ketidakonsistenan

- `metodepenilaian` vs `mata-kuliah`
- `cplbk-mk` vs `cpl-bk`, `bk-mk`

---

## 5. Desain Database

### 5.1 Penamaan Tabel

- Indonesia/snake_case: `mata_kuliah`, `bahan_kajian`, `relasi_capaian`, `pemetaan_mk_cpl_cpmk`
- Singkatan domain: `cpl`, `cpmk`, `bk`, `mk`

### 5.2 Relasi

- Foreign key: `kode_mk`, `kode_cpl`, `prodi`, `user_id`
- Campuran kunci string (`kode_mk`, `prodi`) dan `id`/`user_id`
- Relasi berbasis string sah saja tetapi membutuhkan kolom FK kustom dan dapat mempersulit eager loading.

### 5.3 Masalah Migrasi

- Migrasi `bahan_kajian`: tidak ada `prodi`; model `BahanKajian` punya `prodi` di `$fillable` → kemungkinan ketidakcocokan skema.
- Migrasi `mata_kuliah`: tidak ada `prodi`; model punya `prodi` → kemungkinan ditambah di migrasi berikutnya (tidak terlihat).
- Timestamps: ada di sebagian besar migrasi.

### 5.4 Integritas Data

- Beberapa tabel memakai FK string tanpa `foreignId()`/`constrained()`.
- Risiko baris yatim bila referensi tidak ditegakkan di level DB.

---

## 6. Keamanan (Autentikasi dan Otorisasi)

### 6.1 Autentikasi

- Jetstream + Fortify.
- Sanctum untuk auth berbasis session.
- Middleware `verified` untuk verifikasi email.
- Dukungan two-factor auth (Jetstream).
- User punya `role` dan `level`; `DosenProfil` punya `prodi`, `nik`, `jabatan_struktural`.

### 6.2 Otorisasi

- **Policies**: Tidak ada (`app/Policies/` tidak ada).
- **Gates**: Tidak ada di `AppServiceProvider` atau tempat lain.
- **`authorize()`**: Tidak dipakai di controller atau Livewire.

Kontrol akses dilakukan lewat logika aplikasi:

- `Auth::user()->profil->prodi` untuk filter per prodi.
- `Auth::user()->role === 'Kaprodi'` vs peran lain (mis. di NilaiManager).
- Tidak ada pemeriksaan policy/ability terpusat.

Risiko:

- Semua pengguna terotentikasi bisa mengakses route yang hanya mengandalkan middleware `auth`.
- Tidak ada otorisasi level model (create/update/delete).
- Pemeriksaan role tersebar dan mudah terlewat saat menambah fitur baru.

---

## 7. Kualitas Kode

### 7.1 Ukuran Controller

- Ramping: `CplController` (stub), `PenilaianController`, `AnalisisCplController`
- Berat: `PortofolioController` (228 baris) — query, perhitungan, logika PDF, persiapan data view

### 7.2 Logika Query

- **PortofolioController**: Banyak pakai `DB::table()` dan join manual ketimbang Eloquent.
- Risiko N+1 di loop (mis. `MetodePenilaian::where(...)->get()` di dalam loop).
- Beberapa komponen Livewire menjalankan query di `render()` tanpa scoping atau optimasi.

### 7.3 Validasi

- Inline di Livewire: `$this->validate([...])`
- Tidak ada kelas Form Request
- Tidak ada aturan validasi terpusat
- Validasi import di setiap komponen Livewire (duplikasi)

### 7.4 Lainnya

- `NilaiImport` bergantung pada `Maatwebsite\Excel` (tidak ada di composer.json).
- Route POST `/penilaian-obe/import-nilai` → `PenilaianController::importProses` tapi method tidak ada; import dilakukan lewat Livewire `NilaiManager`.
- `Auth::user()->profil` dipakai tanpa `optional()` di beberapa tempat; bisa error saat `profil` null.

---

## 8. Kesesuaian Best Practice Laravel

| Praktik | Status |
|---------|--------|
| Form Request untuk validasi | ❌ Tidak dipakai |
| Policy untuk otorisasi | ❌ Tidak dipakai |
| Gates / abilities | ❌ Tidak dipakai |
| Eloquent vs DB:: | ⚠️ Campuran (DB:: dipakai di PortofolioController) |
| Eager loading untuk hindari N+1 | ⚠️ Sebagian |
| Named routes | ✅ Dipakai |
| Config vs `env()` | ✅ Baik |
| Queue untuk pekerjaan berat | ❌ Pembuatan PDF sinkron |
| Middleware `auth` | ✅ Dipakai |

---

## 9. Utang Teknis

### 9.1 Kode Rusak / Tidak Terpakai

- `CplSndiktiController` dan `OrganisasiMkController` direferensi di route tapi tidak diimplementasikan.
- POST `/penilaian-obe/import-nilai` → `PenilaianController::importProses` tidak ada.
- `NilaiImport` menggunakan Maatwebsite\Excel (tidak terpasang).
- Route duplikat untuk `portofolio.download` (3 kali di `web.php`).

### 9.2 Anti-pattern

- Controller gemuk (PortofolioController).
- Logika bisnis di controller alih-alih di service layer.
- Raw `DB::table()` padahal Eloquent lebih jelas.
- Tidak ada lapisan otorisasi; filter berdasar logika alih-alih policy.

### 9.3 Nilai Hard-coded

- Threshold nilai di `PortofolioController::getKetercapaian()` (80, 60, 40).
- Pemetaan kolom di `hitungNilai()` (`kehadiran`, `tugas`, dll.).
- String role (`'Kaprodi'`) tersebar di kode.

### 9.4 Coupling

- Controller/Livewire sangat bergantung pada `Auth::user()->profil`.
- Asumsi semua user punya `DosenProfil`; tidak ada penanganan saat `profil` null di semua jalur kode.

---

## 10. Rekomendasi Refaktoring

### 10.1 Kritis (Keamanan & Kebenaran)

1. **Tambah otorisasi**
   - Policy untuk model utama (Cpl, MataKuliah, Mahasiswa, Portofolio, dll.).
   - Pakai `$this->authorize()` di controller dan Livewire bila sesuai.
   - Pertimbangkan Gates berbasis role untuk Kaprodi vs Dosen vs Admin.

2. **Perbaiki route rusak**
   - Hapus atau implementasikan `CplSndiktiController` dan `OrganisasiMkController`.
   - Tambah `PenilaianController::importProses` atau hapus route POST dan dokumentasikan bahwa import via Livewire.

3. **Perbaiki atau hapus NilaiImport**
   - Beralih ke OpenSpout bila import tetap di controller, atau andalkan import Livewire saja dan hapus class jika tidak dipakai.

### 10.2 Prioritas Tinggi

4. **Ekstrak service**
   - `PortofolioService`: pembuatan PDF, perhitungan nilai, statistik.
   - `NilaiCalculationService`: logika dari `hitungNilai()`.
   - `ImportService` (atau serupa) untuk logika import bersama di komponen Livewire.

5. **Perkenalkan Form Request**
   - Untuk aksi controller yang menerima input (mis. import, store, update).

6. **Rapikan route**
   - Hapus definisi duplikat `portofolio.download`.
   - Sederhanakan nested middleware `auth`.

### 10.3 Prioritas Sedang

7. **Refaktor PortofolioController**
   - Pindahkan logika ke `PortofolioService`.
   - Ganti `DB::table()` dengan Eloquent bila memungkinkan.
   - Tambah eager loading dan optimasi query.

8. **Sentralkan konfigurasi**
   - Pindahkan threshold nilai dan pemetaan kolom ke config atau enum.

9. **Null safety**
   - Pakai `optional(Auth::user()->profil)` atau serupa di mana pun `profil` diakses.

### 10.4 Prioritas Rendah

10. **Konsistensi penamaan**
    - Satukan nama route (mis. `metode-penilaian` alih-alih `metodepenilaian`).

11. **Queue pembuatan PDF**
    - Pertimbangkan antrean untuk pembuatan PDF laporan besar.

12. **Testing**
    - Tambah feature test untuk alur utama (CRUD CPL, import, pembuatan portofolio) dan otorisasi.

---

## 11. Tinjauan Best Practice — Isu Rinci

### Controllers

| File | Isu | Penjelasan | Perbaikan yang Disarankan |
|------|-----|------------|---------------------------|
| `app/Http/Controllers/PlController.php` | Menggunakan `Cpl` di type hint tanpa `use`; model salah (seharusnya `ProfilLulusan` untuk resource PL) | `show()`, `edit()`, `update()`, `destroy()` mereferensi `Cpl` padahal controller mengelola Profil Lulusan. | Tambah `use App\Models\ProfilLulusan` dan ganti semua referensi `Cpl` dengan `ProfilLulusan`. |
| `app/Http/Controllers/KurikulumController.php` | Mereferensi model `Kurikulum` yang tidak ada | `Kurikulum` model tidak ada. | Buat `App\Models\Kurikulum` atau hapus/ubah controller; perbaiki route bila resource tidak dipakai. |
| `app/Http/Controllers/PenilaianController.php` | Method `matriksCpl()` dan `portofolio()` tidak ada | Route mengarah ke method yang tidak diimplementasikan. | Implementasikan kedua method atau perbarui route ke controller/aksi yang benar. |
| `app/Http/Controllers/PortofolioController.php` | Banyak `DB::table()` alih-alih Eloquent; logika bisnis di controller; tidak ada Form Request | Melanggar SRP; sulit diuji dan dirawat. | Ekstrak query ke `PortofolioService`; pakai model Eloquent; tambah `PortofolioDownloadRequest`. |
| `app/Http/Controllers/PortofolioController.php` | N+1 di `download()` | `MetodePenilaian::where(...)->get()` dipanggil di dalam loop. | Eager load atau batch-query `MetodePenilaian` sekali sebelum loop. |
| `app/Http/Controllers/PortofolioController.php` | `Auth::user()->profil->prodi` bisa error bila `profil` null | Tidak ada `optional()`. | Pakai `optional(Auth::user()->profil)->prodi ?? null` dan tangani kasus null. |
| `app/Http/Controllers/MahasiswaController.php` | Resource controller hanya punya `index()` | Route mendaftarkan resource penuh tapi method lain tidak ada. | Pakai `Route::get(...)` untuk index saja, atau implementasikan semua method resource. |
| Beragam controller | Tidak ada pemanggilan `$this->authorize()` | Tidak ada otorisasi berbasis policy. | Tambah policy dan panggil `$this->authorize('action', $model)`. |

---

### Models

| File | Isu | Penjelasan | Perbaikan yang Disarankan |
|------|-----|------------|---------------------------|
| `app/Models/Mahasiswa.php` | Relasi bergantung urutan migrasi | Pastikan skema DB sesuai. | Verifikasi skema DB; tambah PHPDoc. |
| `app/Models/MataKuliah.php` | `metodePenilaian()` memakai `$this->kode_mk` di relasi | Query terikat instance; bisa tidak terduga bila model belum di-load. | Gunakan `hasMany` standar; filter di query bila perlu. |
| `app/Models/MataKuliah.php` | Indentasi tidak konsisten di `pemetaanCpmk()` | Indentasi body method berbeda. | Jalankan Pint. |
| `app/Models/BahanKajian.php` | `prodi` di `$fillable` tapi migrasi tidak punya kolom `prodi` | Ketidakcocokan skema. | Tambah migrasi untuk `prodi` atau hapus dari `$fillable`. |
| `app/Models/RelasiCapaian.php` | `prodi` di `$fillable` tapi migrasi tidak punya kolom `prodi` | Idem. | Tambah migrasi untuk `prodi` atau hapus dari `$fillable`. |
| `app/Models/MetodePenilaian.php` | `prodi` di `$fillable` tapi migrasi tidak punya kolom `prodi` | Idem. | Tambah migrasi untuk `prodi`. |
| `app/Models/Portofolio.php` | Typo: `lik_jurnal_pengajaran` | Seharusnya `link_jurnal_pengajaran`. | Tambah migrasi rename kolom; perbarui model dan view. |
| `app/Models/RelasiCapaian.php` | Tidak ada return type hint di method relasi | Best practice Laravel memakai return type eksplisit. | Tambah `: BelongsTo` (atau tipe yang sesuai). |
| `app/Models/User.php` | Return type `profil()` | Perbaiki import `HasOne`. | Tambah `use` yang benar. |

---

### Validasi

| File | Isu | Penjelasan | Perbaikan yang Disarankan |
|------|-----|------------|---------------------------|
| `app/Http/Controllers` | Tidak ada kelas Form Request | Validasi inline di Livewire atau tidak ada. | Buat Form Request untuk aksi controller. |
| `app/Livewire/DosenManager.php` | Aturan `unique` untuk `nik` tidak valid | `$profilId` bisa string `'NULL'`. | Perbaiki rule; untuk record baru, hilangkan parameter ketiga. |
| `app/Livewire/MahasiswaManager.php` | Tidak ada scoping prodi pada unique NIM | NIM mungkin harus unique per prodi. | Konfirmasi aturan bisnis; gunakan `Rule::unique()->where('prodi', $prodi)->ignore()`. |
| `app/Livewire/CplManager.php` | Tidak ada validasi prodi user sebelum filter | Jika null, tidak ada umpan balik ke user. | Validasi di `mount()` atau middleware; redirect atau flash error bila prodi null. |
| Beragam Livewire | Duplikasi validasi import | Aturan `file_import` berulang di banyak komponen. | Ekstrak ke trait `ValidatesImportFile` atau Form Request. |

---

### Routes

| File | Isu | Penjelasan | Perbaikan yang Disarankan |
|------|-----|------------|---------------------------|
| `routes/web.php` | `CplSndiktiController` dan `OrganisasiMkController` tidak diimpor/diimplementasikan | Route mereferensi controller yang tidak ada. | Tambah `use` dan buat controller, atau hapus route. |
| `routes/web.php` | `PenilaianController::importProses` tidak ada | POST route mengarah ke method tidak ada. | Hapus route POST atau implementasikan `importProses()`. |
| `routes/web.php` | Route duplikat `portofolio.download` (3 kali) | Definisi route sama berulang. | Satu definisi saja; pakai `Route::match(['get', 'post'], ...)` bila perlu. |
| `routes/web.php` | Middleware bersarang berlebihan | Kelompok route sudah dilindungi. | Hapus middleware inner. |
| `routes/web.php` | Route portofolio bentrok | Beberapa definisi untuk path serupa. | Satukan ke satu URL portofolio. |
| `routes/web.php` | `users.dosen` didefinisikan dua kali | Duplikat. | Pakai satu controller dan satu route. |
| `routes/web.php` | Import controller tidak lengkap | Beberapa controller tidak di-`use`. | Tambah semua `use` yang diperlukan. |

---

### Migrasi Database

| File | Isu | Penjelasan | Perbaikan yang Disarankan |
|------|-----|------------|---------------------------|
| `database/migrations/2026_01_19_043901_create_bahan_kajian_table.php` | Kolom `prodi` tidak ada | Model memakai `prodi`. | Tambah `$table->string('prodi')` (nullable atau required). |
| `database/migrations/2026_01_19_043918_create_mata_kuliah_table.php` | Kolom `prodi` tidak ada | Idem. | Tambah migrasi untuk `prodi`. |
| `database/migrations/2026_01_19_044104_create_relasi_capaian_table.php` | Kolom `prodi` tidak ada | Idem. | Tambah migrasi untuk `prodi`. |
| `database/migrations/2026_01_19_044111_create_metode_penilaian_table.php` | Kolom `prodi` tidak ada | Idem. | Tambah migrasi untuk `prodi`. |
| `database/migrations/2026_01_20_074355_change_foreign_key_on_krs_table.php` | Migrasi kosong | `up()` dan `down()` kosong. | Implementasikan atau hapus. |
| `database/migrations/2026_02_18_065134_create_prodis_table.php` | Membuat tabel stub `prodis` | Hanya `id` dan `timestamps`. | Hapus migrasi atau ubah; hindari duplikasi nama tabel. |
| `database/migrations/2026_01_20_074355_change_foreign_key_on_krs_table.php` | Implementasi `down()` tidak ada | Rollback tidak berfungsi. | Implementasikan `down()`. |
| Beragam migrasi | Return type `up()` tidak konsisten | Ada yang `void`, ada yang tidak. | Gunakan `public function up(): void` secara konsisten. |

---

### Komponen Livewire

| File | Isu | Penjelasan | Perbaikan yang Disarankan |
|------|-----|------------|---------------------------|
| `app/Livewire/CplManager.php` | `Auth::user()->profil->prodi` tanpa null check | Bisa error bila `profil` null. | Pakai `optional(Auth::user()->profil)->prodi ?? null`. |
| `app/Livewire/MahasiswaManager.php` | Tidak ada filter prodi | Menampilkan semua mahasiswa. | Tambah `->where('prodi', optional(Auth::user()->profil)->prodi)`. |
| `app/Livewire/BahanKajianManager.php` | Query `BahanKajian::where('prodi', ...)` | Tabel mungkin tidak punya `prodi`. | Tambah migrasi untuk `prodi` atau hapus filter. |
| `app/Livewire/DosenManager.php` | Pengecekan role inline `auth()->user()->level != 1` | Logika otorisasi di komponen. | Pakai Gate/Policy dan `$this->authorize()`. |
| `app/Livewire/NilaiManager.php` | Pemanggilan berulang `Auth::user()->profil` | Tanpa null safety. | Pakai `optional()`; early return dengan error bila profil tidak lengkap. |
| `app/Livewire/DosenManager.php` | Penanganan password saat update | Query ekstra; pastikan user ada. | Pakai `$user->password` dari model yang sudah di-fetch. |
| Beragam Livewire | Properti publik untuk ID tanpa validasi | `edit($id)`, `delete($id)` terima ID dari wire:click tanpa otorisasi. | Verifikasi user boleh mengakses resource (mis. via policy) sebelum load/update/delete. |
| `app/Livewire/CplManager.php` | Assignment ke `$this->cpls` di `render()` | Bisa menyebabkan masalah state/performa. | Kembalikan data dari `render()`: `return view(..., ['cpls' => $query->get()])`. |

---

### Impor & Dependensi

| File | Isu | Penjelasan | Perbaikan yang Disarankan |
|------|-----|------------|---------------------------|
| `app/Imports/NilaiImport.php` | Menggunakan `Maatwebsite\Excel` | Paket tidak ada di `composer.json`; proyek memakai OpenSpout. | Hapus `NilaiImport` atau tulis ulang dengan OpenSpout. |

---

## 12. Analisis Anti-Pattern (berdasarkan Keparahan)

### Keparahan Tinggi

| Anti-pattern | Lokasi | Deskripsi | Perbaikan |
|--------------|--------|-----------|-----------|
| **Tidak ada pengecekan otorisasi** | Semua controller, sebagian besar Livewire | Tidak ada `$this->authorize()` atau policy. Semua user terotentikasi bisa akses semua route. | Implementasikan policy; panggil `$this->authorize('action', $model)`. |
| **Tidak ada otorisasi pada edit/delete** | Livewire: `edit($id)`, `delete($id)`, `confirmDelete($id)` | ID dari `wire:click` diterima tanpa verifikasi akses. | Tambah pengecekan policy sebelum load/update/delete. |
| **Controller gemuk** | `app/Http/Controllers/PortofolioController.php` | ~228 baris; berisi fetch data, perhitungan, PDF, persiapan view. | Ekstrak ke `PortofolioService`. |
| **Query DB langsung alih-alih Eloquent** | PortofolioController, EvaluasiCpmkManager, CplBkMkManager | `DB::table()` mengabaikan model, scope, relasi. | Ganti dengan model Eloquent dan relasi. |
| **Raw SQL berbahaya** | `app/Livewire/CplBkMkManager.php` | `SET FOREIGN_KEY_CHECKS=0` — menonaktifkan cek FK; risiko korupsi data. | Hindari; pakai transaksi dan Eloquent. |
| **Query N+1 di loop** | PortofolioController (baris 116–128) | `MetodePenilaian::where(...)->get()` di dalam loop. | Batch-query sekali, keyed by `kode_cpmk`. |
| **Logika bisnis di Blade** | `resources/views/pdf/portofolio_full.blade.php` | Perhitungan nilai, agregasi statistik, logika ketercapaian di PHP dalam Blade. | Pindahkan ke service/helper; kirim data yang sudah dihitung. |

---

### Keparahan Sedang

| Anti-pattern | Lokasi | Deskripsi | Perbaikan |
|--------------|--------|-----------|-----------|
| **Logika bisnis di controller** | `PortofolioController::hitungNilai()`, `getKetercapaian()` | Perhitungan nilai dan threshold (80, 60, 40) di controller. | Ekstrak ke `NilaiCalculationService`. |
| **Logika bisnis di Livewire** | EvaluasiCpmkManager, AnalisisCplManager, CplBkMkManager | Logika kompleks (nilai, sync, predikat) di komponen. | Pindahkan ke service; Livewire cukup delegasi. |
| **Duplikasi logika import** | 12 komponen Livewire | Pola sama: Reader, iterator, validasi, transaksi. | Buat trait `ImportsExcel` atau `ExcelImportService`. |
| **Duplikasi pengambilan prodi** | 15+ komponen, PortofolioController, DashboardController | `Auth::user()->profil->prodi ?? null` berulang. | Pakai helper `auth_prodi()` atau accessor `prodi()` di User. |
| **Duplikasi logika otorisasi** | View dan Livewire | `Auth::user()->role === 'Kaprodi'`, `level == 1` tersebar. | Pakai `@can`, Gates, `$this->authorize()`. |
| **Threshold ketercapaian hard-coded** | PortofolioController, AnalisisCplManager, EvaluasiCpmkManager, portofolio_full | 80, 60, 40 di 4+ tempat. | Pindah ke `config/obe.php` atau enum. |
| **Pemetaan kolom hard-coded** | `hitungNilai()`, `hitungNilaiSub()` | `map_kolom` duplikat. | Sentralkan di config atau service. |
| **String role/level hard-coded** | `'Kaprodi'`, `'dosen'`, `level == 1` | Tersebar di PHP dan Blade. | Pakai enum Role atau config; cek via Gate/Policy. |
| **Assignment ke properti di `render()`** | CplManager, BahanKajianManager, ProfilLulusanManager | `$this->cpls = Cpl::where(...)->get()` di `render()`. | Kembalikan data dari `render()`. |
| **Pengecekan role inline alih-alih Gate** | DosenManager | `if (auth()->user()->level != 1) return;` membungkam aksi. | Pakai `Gate::authorize()` atau policy; kembalikan 403. |

---

### Keparahan Rendah

| Anti-pattern | Lokasi | Deskripsi | Perbaikan |
|--------------|--------|-----------|-----------|
| **Warna hex hard-coded** | `getKetercapaian()` | `#059669`, dll. di PHP. | Pindah ke config atau kelas Tailwind. |
| **Batas nilai huruf hard-coded** | `NilaiImport` | 85→A, 75→B, 60→C, 45→D. | Pakai config atau enum `NilaiGrade`. |
| **Threshold Lulus hard-coded** | `portofolio_full.blade.php` | `$rerata >= 70 && $persentase >= 60`. | Pindah ke config. |
| **Assignment `$this->prodi_login` berulang** | EvaluasiCpmkManager | Baris sama di mount, loadData, render. | Set sekali di mount. |
| **`profil` nullable tidak ditangani** | PortofolioController, CplManager, dll. | Bisa error bila `profil` null. | Pakai `optional(Auth::user()->profil)->prodi`. |
| **MahasiswaManager tanpa filter prodi** | `MahasiswaManager` | Menampilkan semua mahasiswa. | Tambah scope prodi. |
| **Migrasi `up()`/`down()` kosong** | `2026_01_20_074355` | Migrasi tidak melakukan apa pun. | Hapus atau implementasikan. |

---

### Ringkasan per Kategori

| Kategori | Tinggi | Sedang | Rendah |
|----------|--------|--------|--------|
| Controller gemuk | 1 | 0 | 0 |
| Logika duplikat | 0 | 4 | 0 |
| Logika bisnis di controller | 1 | 1 | 0 |
| Logika bisnis di Livewire | 0 | 2 | 0 |
| DB langsung vs relasi | 2 | 0 | 0 |
| Nilai hard-coded | 0 | 3 | 4 |
| Otorisasi kurang | 2 | 1 | 0 |
| Lainnya | 2 | 1 | 3 |

---

## 13. Peta Jalan Refaktoring

Diprioritaskan berdasarkan **dampak** (keamanan, kebenaran, maintainability) dan **risiko** (integritas data, stabilitas produksi).

---

### Fase 1 — Perbaikan Kritis

**Tujuan:** Perbaiki celah keamanan, kode rusak, dan risiko integritas data. Tanpa fitur baru; perubahan arsitektur minimal.

| # | Tugas | Dampak | Risiko yang Diatasi | Upaya |
|---|-------|--------|---------------------|-------|
| 1.1 | **Implementasikan otorisasi** — Gates untuk Kaprodi/Dosen/Admin; Policy untuk Cpl, MataKuliah, Mahasiswa, Portofolio; `$this->authorize()` di controller dan Livewire | **Tinggi** — Cegah akses tak sah | Keamanan | Sedang |
| 1.2 | **Hapus `SET FOREIGN_KEY_CHECKS=0`** — Refaktor `CplBkMkManager::syncData()`; pakai Eloquent delete dalam transaksi | **Tinggi** — Cegah korupsi data | Integritas data | Rendah |
| 1.3 | **Perbaiki route rusak** — Hapus/implement CplSndiktiController, OrganisasiMkController; hapus route POST import; satukan portofolio.download; perbaiki users.dosen duplikat | **Tinggi** — Hilangkan error 500 | Stabilitas | Rendah |
| 1.4 | **Perbaiki error controller** — PlController: pakai ProfilLulusan; KurikulumController: buat model atau hapus route; PenilaianController: tambah method atau perbarui route; MahasiswaController: route index eksplisit | **Tinggi** — Cegah runtime error | Stabilitas | Rendah |
| 1.5 | **Perbaiki/hapus NilaiImport** — Hapus bila tidak dipakai, atau tulis ulang dengan OpenSpout | **Sedang** — Hindari missing class | Stabilitas | Rendah |
| 1.6 | **Null safety untuk `profil`** — `optional(Auth::user()->profil)->prodi ?? null`; redirect atau flash error bila profil tidak lengkap | **Sedang** — Cegah null pointer | Stabilitas | Rendah |
| 1.7 | **Perbaiki validasi DosenManager** — Rule `unique` untuk nik; hindari string `'NULL'` | **Sedang** — Cegah bug validasi | Kebenaran | Rendah |
| 1.8 | **Tambah filter prodi ke MahasiswaManager** — Scope query berdasarkan prodi user | **Sedang** — Isolasi data per prodi | Keamanan | Rendah |

**Estimasi Fase 1:** 2–3 hari

---

### Fase 2 — Perbaikan Arsitektur

**Tujuan:** Perkenalkan service layer; kurangi kompleksitas controller/Livewire; tingkatkan keterujian.

| # | Tugas | Dampak | Dependensi | Upaya |
|---|-------|--------|------------|-------|
| 2.1 | **Buat `NilaiCalculationService`** — Ekstrak `hitungNilai()`, pemetaan kolom, logika ketercapaian | **Tinggi** — Sumber tunggal logika nilai | - | Sedang |
| 2.2 | **Buat `PortofolioService`** — Ekstrak listing, persiapan download, PDF, agregasi statistik | **Tinggi** — Controller ramping | 2.1 | Sedang |
| 2.3 | **Ganti `DB::table()` dengan Eloquent** — PortofolioController, EvaluasiCpmkManager, CplBkMkManager | **Tinggi** — Maintainability, scope | - | Sedang |
| 2.4 | **Perbaiki N+1 di PortofolioController** — Batch-query MetodePenilaian sekali | **Tinggi** — Performa | 2.1 | Rendah |
| 2.5 | **Pindahkan logika Blade ke service** — Ekstrak perhitungan dari `portofolio_full.blade.php` | **Tinggi** — View bersih | 2.2 | Rendah |
| 2.6 | **Buat `ExcelImportService` atau trait `ImportsExcel`** — Logika import bersama untuk 12 komponen | **Sedang** — DRY | - | Sedang |
| 2.7 | **Tambah helper `auth_prodi()` atau accessor User** | **Sedang** — Kurangi duplikasi | 1.6 | Rendah |

**Estimasi Fase 2:** 4–6 hari

---

### Fase 3 — Peningkatan Kualitas Kode

**Tujuan:** Tingkatkan validasi, konsistensi, maintainability tanpa perubahan arsitektur besar.

| # | Tugas | Dampak | Dependensi | Upaya |
|---|-------|--------|------------|-------|
| 3.1 | **Perkenalkan Form Request** — Untuk download Portofolio, aksi import, input user lain | **Sedang** — Validasi terpusat | Fase 2 | Rendah |
| 3.2 | **Ganti pengecekan role inline dengan Gates** — `Gate::define()`, `@can`, `$this->authorize()` | **Sedang** — Otorisasi konsisten | 1.1 | Sedang |
| 3.3 | **Tambah pengecekan policy di Livewire edit/delete** | **Sedang** — Defense in depth | 1.1 | Rendah |
| 3.4 | **Perbaiki assignment properti di `render()`** — Kembalikan data dari `render()` | **Rendah** — Pola Livewire bersih | - | Rendah |
| 3.5 | **Perbaiki migrasi** — Hapus yang kosong; perbaiki stub prodis; tambah prodi ke tabel yang butuh | **Sedang** — Keselarasan skema | - | Rendah |
| 3.6 | **Perbaiki isu model** — Relasi MataKuliah; return type RelasiCapaian; import User | **Rendah** — Konsistensi | - | Rendah |
| 3.7 | **Perbaiki typo Portofolio** — Rename `lik_jurnal_pengajaran` → `link_jurnal_pengajaran` | **Rendah** — Kebenaran | - | Rendah |
| 3.8 | **Jalankan Laravel Pint** — Normalisasi format | **Rendah** — Konsistensi | - | Rendah |

**Estimasi Fase 3:** 2–3 hari

---

### Fase 4 — Perbaikan Opsional

**Tujuan:** Poles, konfigurabilitas, persiapan ke depan. Prioritas lebih rendah; jadwalkan bila kapasitas memungkinkan.

| # | Tugas | Dampak | Upaya |
|---|-------|--------|-------|
| 4.1 | **Sentralkan config** — `config/obe.php` untuk threshold, pemetaan kolom, batas nilai huruf, threshold Lulus | **Rendah** — Mudah ubah aturan | Rendah |
| 4.2 | **Buat enum `Role`** — Ganti string role dengan enum | **Rendah** — Type safety | Rendah |
| 4.3 | **Konsistensi penamaan route** — Satukan `metodepenilaian` → `metode-penilaian` | **Rendah** — Konsistensi | Rendah |
| 4.4 | **Queue pembuatan PDF** — Untuk laporan portofolio besar | **Rendah** — UX lebih baik | Sedang |
| 4.5 | **Tambah feature test** — CRUD CPL, import, portofolio, otorisasi | **Sedang** — Keamanan regresi | Sedang |
| 4.6 | **Tambah `down()` ke migrasi FK** — Implementasi rollback | **Rendah** — Reversibilitas migrasi | Rendah |

**Estimasi Fase 4:** 2–4 hari (sesuai kapasitas)

---

### Ringkasan Peta Jalan

| Fase | Fokus | Estimasi Upaya | Prioritas |
|------|-------|----------------|-----------|
| **1** | Perbaikan kritis (keamanan, kode rusak, integritas data) | 2–3 hari | Lakukan pertama |
| **2** | Arsitektur (service, DB→Eloquent, N+1, import) | 4–6 hari | Setelah Fase 1 |
| **3** | Kualitas kode (Form Request, Gates, migrasi, model) | 2–3 hari | Setelah Fase 2 |
| **4** | Opsional (config, enum, queue, test) | 2–4 hari | Sesuai kapasitas |

**Total estimasi upaya:** 10–16 hari (fase 1–3); 12–20 hari (termasuk Fase 4).

---

*Tinjauan mengacu pada konvensi Laravel 12, Livewire v3, dan Jetstream v5.*
