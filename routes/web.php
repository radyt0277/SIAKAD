<?php
 
use App\Http\Controllers\PenggunaController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\BerandaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DosenController;
use App\Http\Controllers\KrsController;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\MataKuliahController;
use Illuminate\Support\Facades\Route;

 
// Halaman untuk tamu: hanya bisa dibuka bila BELUM login
Route::middleware('guest')->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'authenticate'])->name('login.attempt');
});
 
// Halaman internal: hanya bisa dibuka bila SUDAH login
Route::middleware(['auth', 'no-cache'])->group(function () {
    // Halaman awal diarahkan ke dashboard (dari Jobsheet 08)
    Route::get('/', fn () => redirect()->route('dashboard'));
 
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');
 
    Route::get('/dashboard', [DashboardController::class, 'index'])
        ->name('dashboard');

    // Hanya admin; middleware role berjalan SETELAH auth karena berada di dalam grup auth
    Route::get('/pengguna', [PenggunaController::class, 'index'])
        ->middleware('role:admin')
        ->name('pengguna.index');
    // Route::get('/mahasiswa', [MahasiswaController::class, 'index'])
    //     ->name('mahasiswa.index');
    // Route::get('/mahasiswa/{nim}', [MahasiswaController::class, 'show'])
    //     ->name('mahasiswa.show');
    // Route::get('/mata-kuliah', [MataKuliahController::class, 'index'])
    //     ->name('matakuliah.index');
    Route::get('/krs', [KrsController::class, 'index'])
        ->name('krs.index');
 
    // Dari Jobsheet 07; menampilkan versi PHP/MySQL dan nama database, jadi dilindungi
    Route::get('/beranda', [BerandaController::class, 'index'])->name('beranda');
    
    // Data Dosen (Jobsheet 11)
 
    // 1) Endpoint JSON DataTables: HARUS di atas route yang memuat {dosen}
    Route::get('/dosen/data', [DosenController::class, 'data'])->name('dosen.data');
    
    // 2) Tambah, ubah, hapus: khusus admin (role berjalan SETELAH auth)
    Route::middleware('role:admin')->group(function () {
        Route::resource('dosen', DosenController::class)
            ->except(['index', 'show']);
    });
    
    // 3) Daftar dan detail: semua pengguna yang sudah login
    Route::resource('dosen', DosenController::class)
        ->only(['index', 'show']);
    // ---------- Mahasiswa ----------
    Route::get('/mahasiswa/data', [MahasiswaController::class, 'data'])->name('mahasiswa.data');

    Route::middleware('role:admin')->group(function () {
        Route::resource('mahasiswa', MahasiswaController::class)->except(['index', 'show']);
    });

    Route::resource('mahasiswa', MahasiswaController::class)->only(['index', 'show']);

    // ---------- Mata Kuliah ----------
    Route::get('/mata_kuliah/data', [MatakuliahController::class, 'data'])
        ->name('mata_kuliah.data');

    Route::middleware('role:admin')->group(function () {
        Route::resource('mata_kuliah', MatakuliahController::class)
            ->except(['index', 'show'])
            ->parameters(['mata_kuliah' => 'matakuliah']);
    });

    Route::resource('mata_kuliah', MatakuliahController::class)
        ->only(['index', 'show'])
        ->parameters(['mata_kuliah' => 'matakuliah']);

    // ---------- KRS ----------
    Route::get('/krs/data', [KrsController::class, 'data'])->name('krs.data');

    Route::middleware('role:admin')->group(function () {
        Route::resource('krs', KrsController::class)
            ->except(['index', 'show'])
            ->parameters(['krs' => 'krs']);
    });

    Route::resource('krs', KrsController::class)
        ->only(['index', 'show'])
        ->parameters(['krs' => 'krs']);

});