@extends(auth()->check() ? 'layouts.app' : 'layouts.guest')
 
@section('title', 'Akses Ditolak')
 
@section('content')
    <div class="text-center py-5">
        <i class="bi bi-shield-exclamation display-1 text-danger"></i>
        <h1 class="display-5 fw-bold mt-3">403</h1>
        <h2 class="h4 mb-3">Akses Ditolak</h2>
        <p class="text-body-secondary mb-4">
            {{ $exception->getMessage() ?: 'Anda tidak berhak mengakses halaman ini.' }}
        </p>
        <a href="{{ auth()->check() ? route('dashboard') : route('login') }}"
           class="btn btn-primary">
            <i class="bi bi-arrow-left me-1"></i> Kembali
        </a>
    </div>
@endsection
