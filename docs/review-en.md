# Laravel Technical Review — Simpobe App

## 1. Project Overview

| Item | Detail |
|------|--------|
| **Laravel** | v12 |
| **PHP** | ^8.2 |
| **Stack** | Laravel Jetstream (Fortify), Livewire v3, Laravel Sanctum |
| **Domain** | OBE (Outcome-Based Education) — kurikulum, penilaian, CPL/CPMK |
| **Packages** | barryvdh/laravel-dompdf, openspout/openspout, Laravel Boost (dev) |

The app manages:
- **Kurikulum OBE**: Profil Lulusan (PL), CPL, Bahan Kajian (BK), Mata Kuliah, CPMK, Sub-CPMK, relasi capaian, metode penilaian
- **Penilaian OBE**: Mahasiswa, KRS, nilai, evaluasi CPMK, portofolio PDF
- **Master**: Fakultas, Prodi, Dosen (via `DosenProfil`)

---

## 2. Architecture Review

### 2.1 Pattern

- **MVC** with Livewire for CRUD and reactive UI.
- Controllers mostly return views; Livewire handles state, validation, and persistence.
- PortofolioController breaks the pattern with heavy business logic.

### 2.2 Separation of Concerns

| Aspect | Status | Notes |
|--------|--------|-------|
| Controllers | ⚠️ Mixed | Slim controllers (CplController) vs fat controller (PortofolioController ~230 lines) |
| Livewire | ✅ OK | CRUD logic lives in components |
| Service layer | ❌ Missing | No `App\Services` |
| Repository | ❌ Missing | Direct Eloquent in controllers/Livewire |

### 2.3 Service / Repository

- No Service or Repository classes.
- Business logic (e.g. `hitungNilai()`, PDF generation) is in controllers and Livewire components.
- Recommend extracting services for: Portofolio generation, nilai calculation, and imports.

---

## 3. Folder Structure

```
app/
├── Actions/Fortify/          # Jetstream/Fortify actions
├── Actions/Jetstream/
├── Http/Controllers/         # 24 controllers
├── Imports/                  # NilaiImport (uses Maatwebsite\Excel - not installed!)
├── Livewire/                 # 22 Livewire components (CRUD managers)
├── Models/                   # 20+ models
├── Providers/
└── View/Components/
```

**Observations:**
- Standard Laravel 12 layout.
- `Imports/NilaiImport.php` uses `Maatwebsite\Excel` (not in composer.json); project uses OpenSpout.
- No `app/Policies/`, `app/Services/`, or `app/Repositories/`.
- No `app/Http/Requests/` (no Form Request classes).

---

## 4. Naming Convention

### 4.1 Models

| Convention | Example | Note |
|------------|---------|------|
| PascalCase | `Cpl`, `ProfilLulusan`, `BahanKajian` | OK |
| Abbreviations | Cpl, Cpmk, Bk, Mk, Pl | Domain (Indonesian OBE) |
| Table override | `Cpl` → `cpl_prodi`, `BahanKajian` → `bahan_kajian` | OK for non-standard tables |

### 4.2 Tables (snake_case)

- `mata_kuliah`, `bahan_kajian`, `cpl_prodi`, `penilaian_komponens`, `dosen_profils`
- Mix of singular/plural; Laravel assumes plural. Override via `$table` when needed.

### 4.3 Controllers

- Resource-style: `CplController`, `MataKuliahController`, `PortofolioController`
- Clear and consistent.

### 4.4 Routes

- Prefixes: `kurikulum-obe`, `penilaian-obe`
- Resource names: `pl`, `cpl`, `cpl-pl`, `mata-kuliah`, `metodepenilaian` (inconsistent hyphenation)

### 4.5 Inconsistencies

- `metodepenilaian` vs `mata-kuliah`
- `cplbk-mk` vs `cpl-bk`, `bk-mk`

---

## 5. Database Design

### 5.1 Table Naming

- Indonesian/snake_case: `mata_kuliah`, `bahan_kajian`, `relasi_capaian`, `pemetaan_mk_cpl_cpmk`
- Domain abbreviations: `cpl`, `cpmk`, `bk`, `mk`

### 5.2 Relationships

- Foreign keys: `kode_mk`, `kode_cpl`, `prodi`, `user_id`
- Mix of string keys (`kode_mk`, `prodi`) and `id`/`user_id`
- String-based relationships are fine but require custom FK columns and can complicate eager loading.

### 5.3 Migration Issues

- `bahan_kajian` migration: no `prodi`; model `BahanKajian` has `prodi` in `$fillable` → possible schema mismatch.
- `mata_kuliah` migration: no `prodi`; model has `prodi` → likely added in later migration (not visible).
- Timestamps: present in most migrations.

### 5.4 Data Integrity

- Some tables use string FKs without `foreignId()`/`constrained()`.
- Risk of orphaned rows if references are not enforced at DB level.

---

## 6. Security (Authentication and Authorization)

### 6.1 Authentication

- Jetstream + Fortify.
- Sanctum for session-based auth.
- `verified` middleware for email verification.
- Two-factor auth supported (Jetstream).
- User has `role` and `level`; `DosenProfil` has `prodi`, `nik`, `jabatan_struktural`.

### 6.2 Authorization

- **Policies**: None (`app/Policies/` missing).
- **Gates**: None in `AppServiceProvider` or elsewhere.
- **`authorize()`**: Not used in controllers or Livewire.

Access control is done in application logic:

- `Auth::user()->profil->prodi` to filter by prodi.
- `Auth::user()->role === 'Kaprodi'` vs other roles (e.g. in `NilaiManager`).
- No centralized policy/ability checks.

Risks:

- Any authenticated user can access routes that rely only on `auth` middleware.
- No model-level authorization (create/update/delete).
- Role checks scattered and easy to miss when adding new features.

---

## 7. Code Quality

### 7.1 Controller Size

- Slim: `CplController` (stub), `PenilaianController`, `AnalisisCplController`
- Heavy: `PortofolioController` (228 lines) — queries, calculations, PDF logic, view data prep

### 7.2 Query Logic

- **PortofolioController**: Heavy use of `DB::table()` and manual joins instead of Eloquent.
- N+1 risk in loops (e.g. `MetodePenilaian::where(...)->get()` inside loops).
- Some Livewire components run queries in `render()` without scoping or optimization.

### 7.3 Validation

- Inline in Livewire: `$this->validate([...])`
- No Form Request classes
- No centralized validation rules
- Import validation in each Livewire component (duplication)

### 7.4 Other

- `NilaiImport` depends on `Maatwebsite\Excel` (not in `composer.json`).
- Route POST `/penilaian-obe/import-nilai` → `PenilaianController::importProses` but method does not exist; import uses Livewire `NilaiManager` instead.
- `Auth::user()->profil` used without `optional()` in some places; can cause errors when `profil` is null.

---

## 8. Laravel Best Practice Compliance

| Practice | Status |
|----------|--------|
| Form Request for validation | ❌ Not used |
| Policy for authorization | ❌ Not used |
| Gates / abilities | ❌ Not used |
| Eloquent over DB:: | ⚠️ Mixed (DB:: used in PortofolioController) |
| Eager loading to avoid N+1 | ⚠️ Partial |
| Named routes | ✅ Used |
| Config over `env()` | ✅ Good |
| Queue for heavy work | ❌ PDF generation synchronous |
| `auth` middleware | ✅ Used |

---

## 9. Technical Debt

### 9.1 Broken / Unused Code

- `CplSndiktiController` and `OrganisasiMkController` referenced in routes but not implemented.
- POST `/penilaian-obe/import-nilai` → `PenilaianController::importProses` missing.
- `NilaiImport` uses Maatwebsite\Excel (not installed).
- Duplicate route for `portofolio.download` (3 times in `web.php`).

### 9.2 Anti-patterns

- Fat controller (PortofolioController).
- Business logic in controller instead of service layer.
- Raw `DB::table()` where Eloquent would be clearer.
- No authorization layer; logic-based filtering instead of policies.

### 9.3 Hard-coded Values

- Nilai thresholds in `PortofolioController::getKetercapaian()` (80, 60, 40).
- Column mappings in `hitungNilai()` (`kehadiran`, `tugas`, etc.).
- Role strings (`'Kaprodi'`) scattered in code.

### 9.4 Coupling

- Controllers/Livewire tightly coupled to `Auth::user()->profil`.
- Assumption that all users have `DosenProfil`; no handling when `profil` is null in all code paths.

---

## 10. Refactoring Recommendations

### 10.1 Critical (Security & Correctness)

1. **Add authorization**
   - Policies for main models (Cpl, MataKuliah, Mahasiswa, Portofolio, etc.).
   - Use `$this->authorize()` in controllers and Livewire where appropriate.
   - Consider role-based Gates for Kaprodi vs Dosen vs Admin.

2. **Fix broken routes**
   - Remove or implement `CplSndiktiController` and `OrganisasiMkController`.
   - Either add `PenilaianController::importProses` or remove the POST route and document that import is via Livewire.

3. **Fix or remove NilaiImport**
   - Switch to OpenSpout if import stays in controller, or rely on Livewire import only and remove the class if unused.

### 10.2 High Priority

4. **Extract services**
   - `PortofolioService`: PDF generation, nilai calculation, statistics.
   - `NilaiCalculationService`: logic from `hitungNilai()`.
   - `ImportService` (or similar) for shared import logic across Livewire components.

5. **Introduce Form Requests**
   - For any controller actions that accept input (e.g. import, store, update).

6. **Clean up routes**
   - Remove duplicate `portofolio.download` definitions.
   - Simplify nested `auth` middleware.

### 10.3 Medium Priority

7. **Refactor PortofolioController**
   - Move logic into `PortofolioService`.
   - Replace `DB::table()` with Eloquent where possible.
   - Add eager loading and query optimization.

8. **Centralize configuration**
   - Move nilai thresholds and column mappings to config or enums.

9. **Null safety**
   - Use `optional(Auth::user()->profil)` or similar everywhere `profil` is used.

### 10.4 Lower Priority

10. **Naming consistency**
    - Unify route names (e.g. `metode-penilaian` instead of `metodepenilaian`).

11. **Queue PDF generation**
    - Consider queuing PDF generation for large reports.

12. **Testing**
    - Add feature tests for main flows (CPL CRUD, import, portofolio generation) and authorization.

---

## 11. Best Practices Review — Detailed Issues

### Controllers

| File | Issue | Explanation | Recommended Fix |
|------|-------|-------------|-----------------|
| `app/Http/Controllers/PlController.php` | Uses `Cpl` in type hints without `use` statement; wrong model (should be `ProfilLulusan` for PL resource) | `show()`, `edit()`, `update()`, `destroy()` reference `Cpl` but controller manages Profil Lulusan. Missing `use App\Models\Cpl` and wrong model choice. | Add `use App\Models\ProfilLulusan` and replace all `Cpl` references with `ProfilLulusan` in those methods. |
| `app/Http/Controllers/KurikulumController.php` | References non-existent `Kurikulum` model | `use App\Models\Kurikulum` and `show(Kurikulum $kurikulum)` etc. — `Kurikulum` model does not exist. | Create `App\Models\Kurikulum` or remove/repurpose the controller; fix route if resource is not used. |
| `app/Http/Controllers/PenilaianController.php` | Missing `matriksCpl()` and `portofolio()` methods | Routes `penilaian.matriks-cpl` and `portofolio` (GET) point to these methods but they are not implemented. | Implement both methods or update routes to point to the correct controllers/actions. |
| `app/Http/Controllers/PortofolioController.php` | Heavy use of `DB::table()` instead of Eloquent; business logic in controller; no Form Request | Violates SRP; harder to test and maintain; raw queries bypass model scopes and relationships. | Extract queries into a `PortofolioService`; use Eloquent models; add `PortofolioDownloadRequest` for `download()` validation. |
| `app/Http/Controllers/PortofolioController.php` | N+1 in `download()` | `MetodePenilaian::where(...)->get()` called inside `foreach ($list_cpmk as $c)` loop. | Eager load or batch-query `MetodePenilaian` once before the loop. |
| `app/Http/Controllers/PortofolioController.php` | `Auth::user()->profil->prodi` can throw when `profil` is null | No `optional()`; accessing `->prodi` on null causes error. | Use `optional(Auth::user()->profil)->prodi ?? null` and handle null case (e.g. redirect with message). |
| `app/Http/Controllers/MahasiswaController.php` | Resource controller with only `index()` | Route registers full resource but `create`, `store`, `show`, `edit`, `update`, `destroy` are missing. | Use `Route::get(...)` for index only, or implement all resource methods. |
| Multiple controllers | No `$this->authorize()` calls | No policy-based authorization. | Add policies and call `$this->authorize('action', $model)` in controller actions. |

---

### Models

| File | Issue | Explanation | Recommended Fix |
|------|-------|-------------|-----------------|
| `app/Models/Mahasiswa.php` | Relationship depends on migration order | `hasMany(Krs::class, 'mahasiswa_id', 'nim')` — Krs.mahasiswa_id references Mahasiswa.nim (per migration `2026_01_20_074552`). Ensure migration ran and schema matches. | Verify DB schema; add PHPDoc for relationship clarity. |
| `app/Models/MataKuliah.php` | `metodePenilaian()` uses `$this->kode_mk` in relationship | `->where('kode_mk', $this->kode_mk)` in relationship definition — creates query tied to current instance and can behave unexpectedly when model is not loaded. | Use standard `hasMany(MetodePenilaian::class, 'kode_mk', 'kode_mk')` and filter in queries when needed. |
| `app/Models/MataKuliah.php` | Inconsistent indentation in `pemetaanCpmk()` | Method body indentation differs from rest of class. | Normalize indentation (run Pint). |
| `app/Models/BahanKajian.php` | `prodi` in `$fillable` but migration has no `prodi` column | `database/migrations/2026_01_19_043901_create_bahan_kajian_table.php` does not add `prodi`. | Add migration to add `prodi` to `bahan_kajian`, or remove `prodi` from `$fillable` if not used. |
| `app/Models/RelasiCapaian.php` | `prodi` in `$fillable` but migration has no `prodi` | `relasi_capaian` migration has no `prodi` column. | Add migration for `prodi` or remove from `$fillable`. |
| `app/Models/MetodePenilaian.php` | `prodi` in `$fillable` but migration has no `prodi` | `metode_penilaian` migration has no `prodi` column. PortofolioController filters by `prodi`. | Add migration to add `prodi` to `metode_penilaian`. |
| `app/Models/Portofolio.php` | Typo: `lik_jurnal_pengajaran` | Should likely be `link_jurnal_pengajaran`. Used in PDF view. | Add migration to rename column; update model and views. |
| `app/Models/RelasiCapaian.php` | No return type hints on relationship methods | Laravel best practice is explicit return types. | Add `: BelongsTo` (or appropriate type) to all relationship methods. |
| `app/Models/User.php` | `profil()` return type references `Relations\HasOne` | Uses `\Illuminate\Database\Eloquent\Relations\HasOne` — should use `Relations\HasOne` with proper import. | Add `use Illuminate\Database\Eloquent\Relations\HasOne` and use `HasOne` in return type. |

---

### Validation

| File | Issue | Explanation | Recommended Fix |
|------|-------|-------------|-----------------|
| `app/Http/Controllers` | No Form Request classes | All validation is inline in Livewire or missing. Controllers accept `Request` directly. | Create Form Requests (e.g. `StoreCplRequest`, `ImportNilaiRequest`) for controller actions. |
| `app/Livewire/DosenManager.php` | Invalid `unique` rule for `nik` | `'nik' => 'required|unique:dosen_profils,nik,' . $profilId` — `$profilId` can be string `'NULL'`, which breaks the rule. | Use `$profilId` only when it is a valid integer: `($this->userId && $existingUser?->profil) ? $existingUser->profil->id : 'NULL'` — for new records, omit the third parameter. |
| `app/Livewire/MahasiswaManager.php` | No prodi scoping on unique NIM | `unique:mahasiswas,nim,' . $this->mahasiswaId` — NIM might need to be unique per prodi, not globally. | Confirm business rule; if per-prodi, use `Rule::unique('mahasiswas', 'nim')->where('prodi', $prodi)->ignore($this->mahasiswaId)`. |
| `app/Livewire/CplManager.php` | No validation that user has prodi before filtering | `$this->prodi = Auth::user()->profil->prodi ?? null` — if null, `Cpl::where('prodi', $this->prodi)` returns empty; no user feedback. | Validate in `mount()` or middleware; redirect or flash error if `prodi` is null. |
| Multiple Livewire | Duplicate import validation | `file_import` validation (`required|mimes:xlsx,xls|max:10240`) repeated in many components. | Extract to a shared `ImportRequest` or trait `ValidatesImportFile`. |

---

### Routes

| File | Issue | Explanation | Recommended Fix |
|------|-------|-------------|-----------------|
| `routes/web.php` | `CplSndiktiController` and `OrganisasiMkController` not imported or implemented | Routes reference these controllers; they do not exist. | Add `use` statements and create both controllers, or remove these routes. |
| `routes/web.php` | `PenilaianController::importProses` does not exist | POST `/penilaian-obe/import-nilai` points to non-existent method. Import is done via Livewire `NilaiManager`. | Remove the POST route or implement `importProses()` (e.g. as redirect to import form). |
| `routes/web.php` | Duplicate `portofolio.download` route (3 times) | Lines 97, 105, 108 define the same route. | Keep a single definition; use `Route::match(['get', 'post'], ...)` if both methods are needed. |
| `routes/web.php` | Redundant nested middleware | `Route::middleware(['auth:sanctum', 'verified'])->group()` inside already protected group. | Remove inner middleware; outer group already applies it. |
| `routes/web.php` | Conflicting portofolio routes | `portofolio.index` vs `penilaian.portofolio`; GET `/portofolio` vs GET `/penilaian-obe/portofolio`. | Consolidate to one canonical portofolio index URL. |
| `routes/web.php` | `users.dosen` defined twice | Once via `UserController::dosen`, once via `DosenController::index`; both named `users.dosen`. | Use one controller and one route; remove the duplicate. |
| `routes/web.php` | Missing controller imports | `CplSndiktiController`, `OrganisasiMkController`, `UserController`, `CplMahasiswaController` used but not in `use` block. | Add all required `use` statements. |

---

### Database Migrations

| File | Issue | Explanation | Recommended Fix |
|------|-------|-------------|-----------------|
| `database/migrations/2026_01_19_043901_create_bahan_kajian_table.php` | Missing `prodi` column | Model uses `prodi` in fillable and filters. | Add `$table->string('prodi')->nullable();` or required, per business rules. |
| `database/migrations/2026_01_19_043918_create_mata_kuliah_table.php` | Missing `prodi` column | Model has `prodi` in fillable; controllers filter by it. | Add migration to add `prodi` (or confirm it was added in a later migration). |
| `database/migrations/2026_01_19_044104_create_relasi_capaian_table.php` | Missing `prodi` column | Model has `prodi` in fillable. | Add migration to add `prodi` if needed. |
| `database/migrations/2026_01_19_044111_create_metode_penilaian_table.php` | Missing `prodi` column | Model and PortofolioController filter by `prodi`. | Add migration to add `prodi`. |
| `database/migrations/2026_01_20_074355_change_foreign_key_on_krs_table.php` | Empty migration | `up()` and `down()` are empty. | Implement or remove; if KRS FK was changed elsewhere, delete this migration. |
| `database/migrations/2026_02_18_065134_create_prodis_table.php` | Creates stub `prodis` table | Table has only `id` and `timestamps`; `Prodi` model uses `prodi` table. | Remove migration or repurpose; avoid duplicate/confusing table names. |
| `database/migrations/2026_01_20_074355_change_foreign_key_on_krs_table.php` | Missing `down()` implementation | `down()` is empty; rollback will not work. | Implement `down()` to revert FK change. |
| Multiple migrations | Inconsistent `up()` return type | Some use `public function up(): void`, others `public function up()`. | Use `public function up(): void` consistently. |

---

### Livewire Components

| File | Issue | Explanation | Recommended Fix |
|------|-------|-------------|-----------------|
| `app/Livewire/CplManager.php` | `Auth::user()->profil->prodi` without null check | Can throw when `profil` is null. | Use `optional(Auth::user()->profil)->prodi ?? null` and handle null. |
| `app/Livewire/MahasiswaManager.php` | No prodi filtering | Renders all mahasiswa regardless of user's prodi. | Add `->where('prodi', optional(Auth::user()->profil)->prodi)` or equivalent scope. |
| `app/Livewire/BahanKajianManager.php` | Queries `BahanKajian::where('prodi', $this->prodi)` | `bahan_kajian` table may not have `prodi`. | Add `prodi` to table via migration, or remove prodi filter if not applicable. |
| `app/Livewire/DosenManager.php` | Inline role check `auth()->user()->level != 1` | Authorization logic in component; not reusable. | Use Gate/Policy and `$this->authorize()` or `Gate::authorize()`. |
| `app/Livewire/NilaiManager.php` | Repeated `Auth::user()->profil->prodi` and `->nik` | Multiple calls without null safety. | Use `optional(Auth::user()->profil)` and early return with error if profile incomplete. |
| `app/Livewire/DosenManager.php` | Password handling when updating | `User::find($this->userId)->password` — extra query; ensure user exists. | Use `$user->password` from already-fetched model; add null checks. |
| Multiple Livewire | Public properties for IDs without validation | `edit($id)`, `delete($id)` receive ID from wire:click without authorization. | Verify user can act on the resource (e.g. via policy) before load/update/delete. |
| `app/Livewire/CplManager.php` | Assigning to `$this->cpls` in `render()` | Assigning to property during render can cause state/performance issues. | Return data from `render()`: `return view(..., ['cpls' => $query->get()])`. |

---

### Imports & Dependencies

| File | Issue | Explanation | Recommended Fix |
|------|-------|-------------|-----------------|
| `app/Imports/NilaiImport.php` | Uses `Maatwebsite\Excel` | Package not in `composer.json`; project uses OpenSpout. | Remove `NilaiImport` or rewrite to use OpenSpout; remove Maatwebsite dependency. |

---

## 12. Anti-Patterns Analysis (by Severity)

### High Severity

| Anti-pattern | Location | Description | Fix |
|--------------|----------|-------------|-----|
| **Missing authorization checks** | All controllers, most Livewire components | No `$this->authorize()` or policy usage. Any authenticated user can access all routes. | Implement policies; call `$this->authorize('action', $model)` in controllers and Livewire. |
| **Missing authorization on edit/delete** | Livewire: `edit($id)`, `delete($id)`, `confirmDelete($id)` | IDs from `wire:click` accepted without verifying user can act on the resource. | Add policy checks before load/update/delete. |
| **Fat controller** | `app/Http/Controllers/PortofolioController.php` | ~228 lines; contains data fetching, calculations (`hitungNilai`, stats), PDF generation, view prep. | Extract to `PortofolioService` and/or action classes. |
| **Direct DB queries instead of Eloquent** | `PortofolioController` (lines 24–28, 31–46, 79–81), `EvaluasiCpmkManager` (89–96), `CplBkMkManager` (46–47) | `DB::table('penilaian_komponens')`, `DB::table('cpl_mk')`, `DB::table('bk_mk')` bypass models, scopes, and relations. | Replace with Eloquent models and relations (e.g. `PenilaianKomponen::query()->join(...)`). |
| **Dangerous raw SQL** | `app/Livewire/CplBkMkManager.php` | `DB::statement('SET FOREIGN_KEY_CHECKS=0;')` — disables FK checks; risk of data corruption. | Use transactions; avoid disabling FK checks; prefer Eloquent delete/truncate flows. |
| **N+1 query in loop** | `app/Http/Controllers/PortofolioController.php` (lines 116–128) | `MetodePenilaian::where(...)->get()` inside `foreach ($list_cpmk as $c)`. | Batch-query `MetodePenilaian` once, keyed by `kode_cpmk`; reuse in loop. |
| **Business logic in Blade** | `resources/views/pdf/portofolio_full.blade.php` (lines 866–882, 897–948, 1102–1103) | Nilai calculation, stats aggregation, and ketercapaian logic in PHP inside Blade. | Move to service/helper; pass precomputed data to view. |

---

### Medium Severity

| Anti-pattern | Location | Description | Fix |
|--------------|----------|-------------|-----|
| **Business logic in controller** | `PortofolioController::hitungNilai()`, `getKetercapaian()` | Nilai calculation and ketercapaian thresholds (80, 60, 40) live in controller. | Extract to `NilaiCalculationService` or similar. |
| **Business logic in Livewire** | `EvaluasiCpmkManager::hitungNilai()`, `hitungNilaiSub()`, `getKetercapaian()`; `AnalisisCplManager::hitungAnalisis()`, `getPredikat()`; `CplBkMkManager::syncData()` | Complex logic (nilai calc, sync, predikat) in components. | Move to services; Livewire should delegate. |
| **Duplicated import logic** | 12 Livewire components (CplManager, CpmkManager, MataKuliahManager, MahasiswaManager, BahanKajianManager, etc.) | Same pattern: `Reader()`, `getSheetIterator()`, `getRowIterator()`, validation `required|mimes:xlsx,xls|max:10240`, DB transaction. | Create trait `ImportsExcel` or `ExcelImportService` with shared logic. |
| **Duplicated prodi retrieval** | 15+ Livewire components, PortofolioController, DashboardController | `Auth::user()->profil->prodi ?? null` (or `optional(Auth::user()->profil)->prodi`) repeated everywhere. | Use helper/method `auth_prodi()` or `Auth::user()->prodi()` accessor on User. |
| **Duplicated authorization logic** | Views and Livewire: `Auth::user()->role === 'Kaprodi'`, `auth()->user()->level == 1` | Role/level checks scattered in 20+ blade files and 4 Livewire components. | Use Blade `@can` or `@role`; Gates; component `$this->authorize()`. |
| **Hard-coded ketercapaian thresholds** | `PortofolioController::getKetercapaian()`, `AnalisisCplManager::getPredikat()`, `EvaluasiCpmkManager::getKetercapaian()`, `portofolio_full.blade.php` | 80, 60, 40 used in 4+ places. | Move to `config/obe.php` or enum. |
| **Hard-coded column mapping** | `PortofolioController::hitungNilai()`, `EvaluasiCpmkManager::hitungNilai()`, `hitungNilaiSub()` | `map_kolom` (kehadiran, tugas, quiz, etc.) duplicated. | Centralize in config or service. |
| **Hard-coded role/level strings** | `'Kaprodi'`, `'dosen'`, `level == 1` | Scattered in PHP and Blade. | Use `Role` enum or config; check via Gate/Policy. |
| **Assigning to properties in `render()`** | `CplManager`, `BahanKajianManager`, `ProfilLulusanManager`, and similar | `$this->cpls = Cpl::where(...)->get()` in `render()`. | Return data: `return view(..., ['cpls' => Cpl::where(...)->get()])`. |
| **Inline role check instead of Gate** | `DosenManager` (lines 50, 94, 115, 122) | `if (auth()->user()->level != 1) return;` silences action. | Use `Gate::authorize('manage-dosen')` or policy; return 403 if unauthorized. |

---

### Low Severity

| Anti-pattern | Location | Description | Fix |
|--------------|----------|-------------|-----|
| **Hard-coded hex colors** | `PortofolioController::getKetercapaian()`, `EvaluasiCpmkManager::getKetercapaian()` | `#059669`, `#10B981`, `#D97706`, `#DC2626` in PHP. | Move to config or Tailwind classes. |
| **Hard-coded grade boundaries** | `app/Imports/NilaiImport.php` | 85→A, 75→B, 60→C, 45→D for nilai huruf. | Use config or `NilaiGrade` enum. |
| **Hard-coded Lulus thresholds** | `resources/views/pdf/portofolio_full.blade.php` (1102–1103) | `$rerata >= 70 && $persentase >= 60`. | Move to config. |
| **Repeated `$this->prodi_login` assignment** | `EvaluasiCpmkManager` (lines 54, 189, 324) | Same line in mount, loadData, and render. | Set once in mount; avoid redundant assignment. |
| **Nullable `profil` not handled** | PortofolioController, CplManager, BahanKajianManager, etc. | `Auth::user()->profil->prodi` can throw when `profil` is null. | Use `optional(Auth::user()->profil)->prodi` and handle null. |
| **MahasiswaManager has no prodi filter** | `app/Livewire/MahasiswaManager.php` | Shows all mahasiswa; no `where('prodi', $prodiUser)`. | Add prodi scoping for consistency. |
| **Empty `up()` / `down()` in migration** | `database/migrations/2026_01_20_074355_change_foreign_key_on_krs_table.php` | Migration does nothing. | Remove or implement. |

---

### Summary by Category

| Category | High | Medium | Low |
|----------|------|--------|-----|
| Fat controllers | 1 | 0 | 0 |
| Duplicated logic | 0 | 4 | 0 |
| Business logic in controllers | 1 | 1 | 0 |
| Business logic in Livewire | 0 | 2 | 0 |
| Direct DB vs relations | 2 | 0 | 0 |
| Hard-coded values | 0 | 3 | 4 |
| Missing authorization | 2 | 1 | 0 |
| Other | 2 | 1 | 3 |

---

## 13. Refactoring Roadmap

Prioritized by **impact** (security, correctness, maintainability) and **risk** (data integrity, production stability).

---

### Phase 1 — Critical Fixes

**Goal:** Fix security gaps, broken code, and data-integrity risks. No new features; minimal architectural change.

| # | Task | Impact | Risk Addressed | Effort |
|---|------|--------|----------------|--------|
| 1.1 | **Implement authorization** — Add Gates for `Kaprodi` vs `Dosen` vs Admin; create Policies for Cpl, MataKuliah, Mahasiswa, Portofolio; call `$this->authorize()` in controllers and Livewire for create/update/delete | **High** — Prevents unauthorized access | Security | Medium |
| 1.2 | **Remove `SET FOREIGN_KEY_CHECKS=0`** — Refactor `CplBkMkManager::syncData()` to use Eloquent delete/truncate or ordered deletes within transaction; avoid disabling FK checks | **High** — Prevents data corruption | Data integrity | Low |
| 1.3 | **Fix broken routes** — Remove or implement `CplSndiktiController`, `OrganisasiMkController`; remove POST route for `PenilaianController::importProses` (import is via Livewire); consolidate duplicate `portofolio.download`; fix duplicate `users.dosen` | **High** — Eliminates 500s and route conflicts | Stability | Low |
| 1.4 | **Fix controller errors** — PlController: use ProfilLulusan, add `use`; KurikulumController: create Kurikulum model or remove routes; PenilaianController: add `matriksCpl()` and `portofolio()` or update routes; MahasiswaController: use explicit index route | **High** — Prevents runtime errors | Stability | Low |
| 1.5 | **Fix or remove NilaiImport** — Remove if unused, or rewrite to use OpenSpout; ensure no Maatwebsite\Excel dependency | **Medium** — Avoids missing class errors | Stability | Low |
| 1.6 | **Null safety for `profil`** — Use `optional(Auth::user()->profil)->prodi ?? null` everywhere; redirect or flash error when profile is incomplete (e.g. DosenManager, CplManager, PortofolioController) | **Medium** — Prevents null pointer exceptions | Stability | Low |
| 1.7 | **Fix DosenManager validation** — Correct `unique:dosen_profils,nik,...` rule; avoid passing string `'NULL'` as ignore value | **Medium** — Prevents validation bugs | Correctness | Low |
| 1.8 | **Add prodi filter to MahasiswaManager** — Scope queries by `optional(Auth::user()->profil)->prodi` | **Medium** — Data isolation per prodi | Security | Low |

**Estimated Phase 1:** 2–3 days

---

### Phase 2 — Architecture Improvements

**Goal:** Introduce service layer, reduce controller/Livewire complexity, improve testability and maintainability.

| # | Task | Impact | Dependencies | Effort |
|---|------|--------|--------------|--------|
| 2.1 | **Create `NilaiCalculationService`** — Extract `hitungNilai()`, column mapping, and ketercapaian logic from PortofolioController, EvaluasiCpmkManager, AnalisisCplManager | **High** — Single source of truth for nilai logic | None | Medium |
| 2.2 | **Create `PortofolioService`** — Extract index listing, download data prep, PDF generation, stats aggregation from PortofolioController and `portofolio_full.blade.php` | **High** — Slim controller; testable logic | 2.1 | Medium |
| 2.3 | **Replace `DB::table()` with Eloquent** — PortofolioController, EvaluasiCpmkManager, CplBkMkManager; use models (PenilaianKomponen, CplMk, BkMk) and relations | **High** — Better maintainability, scopes | None | Medium |
| 2.4 | **Fix N+1 in PortofolioController** — Batch-query `MetodePenilaian` once (keyed by kode_cpmk) before loop; pass to `hitungNilai` | **High** — Performance | 2.1 | Low |
| 2.5 | **Move Blade logic to service** — Extract PHP calculations from `portofolio_full.blade.php`; pass precomputed data only | **High** — Cleaner views | 2.2 | Low |
| 2.6 | **Create `ExcelImportService` or trait `ImportsExcel`** — Shared import logic (validation, Reader, transaction, error handling) for 12 Livewire components | **Medium** — DRY; easier to change import behavior | None | Medium |
| 2.7 | **Add `auth_prodi()` helper or User accessor** — `Auth::user()->prodi ?? null` (via `getProdiAttribute` on User) | **Medium** — Reduces duplication | 1.6 | Low |

**Estimated Phase 2:** 4–6 days

---

### Phase 3 — Code Quality Improvements

**Goal:** Improve validation, consistency, and maintainability without major architectural changes.

| # | Task | Impact | Dependencies | Effort |
|---|------|--------|--------------|--------|
| 3.1 | **Introduce Form Requests** — For PortofolioController download, import actions; any controller accepting user input | **Medium** — Centralized validation | Phase 2 | Low |
| 3.2 | **Replace inline role checks with Gates** — Use `Gate::define()`, `@can`, `$this->authorize()`; remove `Auth::user()->role === 'Kaprodi'` and `level == 1` from Blade and Livewire | **Medium** — Consistent authorization | 1.1 | Medium |
| 3.3 | **Add policy checks to Livewire edit/delete** — Verify user can act on resource before load/update/delete | **Medium** — Defense in depth | 1.1 | Low |
| 3.4 | **Fix `render()` property assignment** — Return data from `render()` in CplManager, BahanKajianManager, ProfilLulusanManager, etc. | **Low** — Cleaner Livewire patterns | None | Low |
| 3.5 | **Fix migrations** — Remove empty `2026_01_20_074355`; fix/remove stub `prodis` migration; add `prodi` to `bahan_kajian`, `mata_kuliah`, `relasi_capaian`, `metode_penilaian` if used | **Medium** — Schema alignment | None | Low |
| 3.6 | **Fix model issues** — MataKuliah `metodePenilaian()` relationship; add return types to RelasiCapaian; fix User `profil()` import | **Low** — Code consistency | None | Low |
| 3.7 | **Fix Portofolio typo** — Migration to rename `lik_jurnal_pengajaran` → `link_jurnal_pengajaran`; update model and views | **Low** — Correctness | None | Low |
| 3.8 | **Run Laravel Pint** — Normalize formatting (indentation, style) | **Low** — Consistency | None | Low |

**Estimated Phase 3:** 2–3 days

---

### Phase 4 — Optional Improvements

**Goal:** Polish, configurability, and future-proofing. Lower priority; schedule when capacity allows.

| # | Task | Impact | Effort |
|---|------|--------|--------|
| 4.1 | **Centralize config** — Create `config/obe.php` for ketercapaian thresholds (80, 60, 40), column mapping, grade boundaries (85→A, etc.), Lulus thresholds | **Low** — Easier to change rules | Low |
| 4.2 | **Create `Role` enum** — Replace `'Kaprodi'`, `'dosen'`, `level == 1` strings with enum | **Low** — Type safety, discoverability | Low |
| 4.3 | **Route naming consistency** — Unify `metodepenilaian` → `metode-penilaian`; align `cplbk-mk` with other hyphenated routes | **Low** — Consistency | Low |
| 4.4 | **Queue PDF generation** — For large portofolio reports; return job ID or redirect to download when ready | **Low** — Better UX for heavy PDFs | Medium |
| 4.5 | **Add feature tests** — CPL CRUD, import flows, portofolio generation, authorization | **Medium** — Regression safety | Medium |
| 4.6 | **Add `down()` to FK migration** — Implement rollback in `2026_01_20_074552` if kept | **Low** — Migration reversibility | Low |

**Estimated Phase 4:** 2–4 days (as capacity allows)

---

### Roadmap Summary

| Phase | Focus | Est. Effort | Priority |
|-------|-------|-------------|----------|
| **1** | Critical fixes (security, broken code, data integrity) | 2–3 days | Do first |
| **2** | Architecture (services, DB→Eloquent, N+1, imports) | 4–6 days | After Phase 1 |
| **3** | Code quality (Form Requests, Gates, migrations, models) | 2–3 days | After Phase 2 |
| **4** | Optional (config, enums, queues, tests) | 2–4 days | As capacity allows |

**Total estimated effort:** 10–16 days (phases 1–3); 12–20 days (including Phase 4).

---

*Review conducted against Laravel 12, Livewire v3, and Jetstream v5 conventions.*
