@php
    // success dan error -> toast SweetAlert2; warning dan info -> alert Bootstrap
    $toast = [];
    foreach (['success' => 'success', 'error' => 'error'] as $kunci => $ikon) {
        if (session($kunci)) {
            $toast[] = ['icon' => $ikon, 'text' => session($kunci)];
        }
    }
@endphp
 
@if (count($toast) > 0)
    <script src="{{ asset('vendor/sweetalert2/sweetalert2.all.min.js') }}"></script>
    <script>
        @json($toast).forEach(function (pesan) {
            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: pesan.icon,
                text: pesan.text,
                showConfirmButton: false,
                timer: 4000,
                timerProgressBar: true
            });
        });
    </script>
@endif
 
@foreach (['warning' => 'warning', 'info' => 'info'] as $kunci => $kelas)
    @if (session($kunci))
        <div class="alert alert-{{ $kelas }} alert-dismissible fade show"
             role="alert">
            {{ session($kunci) }}
            <button type="button" class="btn-close"
                    data-bs-dismiss="alert" aria-label="Tutup"></button>
        </div>
    @endif
@endforeach
