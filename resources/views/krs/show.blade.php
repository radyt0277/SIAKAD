@extends('layouts.app')

@section('title', 'Detail KRS')

@section('content')
<x-page-header judul="Detail KRS" deskripsi="Data KRS beserta mata kuliah yang diambil." />

<div class="card border-0 shadow-sm">
    <div class="card-header bg-body fw-semibold">
        {{ $krs->mahasiswa->nim }} - {{ $krs->mahasiswa->nama }}
    </div>
    <div class="card-body">
        <dl class="row mb-3">
            <dt class="col-sm-3">Tahun Akademik</dt>
            <dd class="col-sm-9">{{ $krs->tahun_akademik }}</dd>

            <dt class="col-sm-3">Semester</dt>
            <dd class="col-sm-9">{{ $krs->semester }}</dd>

            <dt class="col-sm-3">Status</dt>
            <dd class="col-sm-9">{{ ucfirst($krs->status) }}</dd>

            <dt class="col-sm-3">Total SKS</dt>
            <dd class="col-sm-9">{{ $krs->matakuliah->sum('sks') }}</dd>
        </dl>

        <table class="table table-sm table-bordered mb-3">
            <thead>
                <tr><th>No</th><th>Kode</th><th>Nama Mata Kuliah</th><th>SKS</th></tr>
            </thead>
            <tbody>
                @forelse ($krs->matakuliah as $mk)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $mk->kode_mk }}</td>
                        <td>{{ $mk->nama_mk }}</td>
                        <td>{{ $mk->sks }}</td>
                    </tr>
                @empty
                    <tr><td colspan="4" class="text-center">Belum ada mata kuliah.</td></tr>
                @endforelse
            </tbody>
        </table>

        <a href="{{ route('krs.index') }}" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left"></i> Kembali
        </a>
        @if (Auth::user()->role === 'admin')
            <a href="{{ route('krs.edit', $krs) }}" class="btn btn-warning">
                <i class="bi bi-pencil-square"></i> Ubah
            </a>
        @endif
    </div>
</div>
@endsection