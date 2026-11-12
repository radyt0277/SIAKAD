@php
    $dipilih = old('matakuliah', $krs->exists ? $krs->matakuliah->pluck('id')->all() : []);
@endphp

<div class="mb-3">
    <label for="mahasiswa_id" class="form-label">Mahasiswa</label>
    <select name="mahasiswa_id" id="mahasiswa_id"
            @class(['form-select', 'is-invalid' => $errors->has('mahasiswa_id')])>
        <option value="">-- Pilih mahasiswa --</option>
        @foreach ($daftarMahasiswa as $m)
            <option value="{{ $m->id }}"
                @selected(old('mahasiswa_id', $krs->mahasiswa_id) == $m->id)>
                {{ $m->nim }} - {{ $m->nama }}
            </option>
        @endforeach
    </select>
    @error('mahasiswa_id')
        <div class="invalid-feedback">{{ $message }}</div>
    @enderror
</div>

<div class="row">
    <div class="col-md-6 mb-3">
        <label for="tahun_akademik" class="form-label">Tahun Akademik</label>
        <input type="text" name="tahun_akademik" id="tahun_akademik" maxlength="9"
               placeholder="contoh: 2026/2027"
               value="{{ old('tahun_akademik', $krs->tahun_akademik) }}"
               @class(['form-control', 'is-invalid' => $errors->has('tahun_akademik')])>
        @error('tahun_akademik')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
    <div class="col-md-6 mb-3">
        <label for="semester" class="form-label">Semester</label>
        <select name="semester" id="semester"
                @class(['form-select', 'is-invalid' => $errors->has('semester')])>
            <option value="">-- Pilih --</option>
            @foreach (['Ganjil', 'Genap'] as $s)
                <option value="{{ $s }}" @selected(old('semester', $krs->semester) === $s)>
                    {{ $s }}
                </option>
            @endforeach
        </select>
        @error('semester')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>

<div class="mb-3">
    <label class="form-label">
        Mata Kuliah (Total SKS: <strong id="total-sks">0</strong> / 24)
    </label>
    <div class="border rounded p-2" style="max-height: 280px; overflow-y: auto;">
        @foreach ($daftarMatakuliah as $mk)
            <div class="form-check">
                <input class="form-check-input cek-mk" type="checkbox"
                       name="matakuliah[]" value="{{ $mk->id }}" id="mk{{ $mk->id }}"
                       data-sks="{{ $mk->sks }}" @checked(in_array($mk->id, $dipilih))>
                <label class="form-check-label" for="mk{{ $mk->id }}">
                    {{ $mk->kode_mk }} - {{ $mk->nama_mk }} ({{ $mk->sks }} SKS)
                </label>
            </div>
        @endforeach
    </div>
    @error('matakuliah')
        <div class="text-danger small mt-1">{{ $message }}</div>
    @enderror
</div>

@push('scripts')
<script>
    function hitungSks() {
        let total = 0;
        document.querySelectorAll('.cek-mk:checked').forEach(function (c) {
            total += Number(c.dataset.sks);
        });
        document.getElementById('total-sks').textContent = total;
    }
    document.querySelectorAll('.cek-mk').forEach(function (c) {
        c.addEventListener('change', hitungSks);
    });
    hitungSks();
</script>
@endpush