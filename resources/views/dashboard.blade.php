@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
    <x-page-header judul="Dashboard"
                   deskripsi="Ringkasan data akademik dari database." />

    {{-- Statistik Akademik --}}
    <div class="row row-cols-1 row-cols-sm-2 row-cols-xl-4 g-3 mb-4 dashboard-statistik">
        @foreach ($statistik as $item)
            <div class="col dashboard-stat-item">
                <x-stat-card :judul="$item['judul']"
                             :jumlah="$item['jumlah']"
                             :ikon="$item['ikon']"
                             :warna="$item['warna']" />
            </div>
        @endforeach
    </div>

    {{-- KRS dan Status --}}
    <div class="row g-3">
        <div class="col-12 col-xl-8">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-body fw-semibold">
                    KRS Terbaru
                </div>
                <div class="card-body p-0">
                    <x-tabel :kolom="$kolomKrs" :baris="$krsTerbaru" />
                </div>
            </div>
        </div>

        <div class="col-12 col-xl-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-body fw-semibold">
                    Status KRS
                </div>
                <div class="card-body">
                    @foreach ($statusKrs as $s)
                        <div class="mb-3">
                            <div class="d-flex justify-content-between small mb-1">
                                <span>{{ $s['label'] }}</span>
                                <span>{{ $s['persen'] }}%</span>
                            </div>

                            <div class="progress" role="progressbar"
                                 aria-valuenow="{{ $s['persen'] }}"
                                 aria-valuemin="0"
                                 aria-valuemax="100">
                                <div class="progress-bar bg-{{ $s['warna'] }}"
                                     style="width: {{ $s['persen'] }}%">
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    {{-- Efek Hover Statistik --}}
    <style>
        .dashboard-stat-item {
            transition: transform 0.25s ease;
        }

        .dashboard-stat-item .card {
            transition: box-shadow 0.25s ease;
        }

        .dashboard-stat-item:hover {
            transform: translateY(-4px) scale(1.02);
        }

        .dashboard-stat-item:hover .card {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12) !important;
        }
    </style>
@endsection
