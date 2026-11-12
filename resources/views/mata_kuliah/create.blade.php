@extends('layouts.app')
 
@section('title', 'Tambah Mata Kuliah')
 
@section('content')
<x-page-header judul="Tambah Mata Kuliah"
    deskripsi="Isi kode mata kuliah. Kode mata kuliah harus unik." />
 
<div class="card border-0 shadow-sm">
    <div class="card-header bg-body fw-semibold">Form Tambah Mata Kuliah</div>
    <div class="card-body">
        <form method="POST" action="{{ route('mata_kuliah.store') }}" novalidate>
            @csrf
            @include('mata_kuliah._form')
 
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-save"></i> Simpan
            </button>
            <a href="{{ route('mata_kuliah.index') }}"
               class="btn btn-outline-secondary">Batal</a>
        </form>
    </div>
</div>
@endsection
