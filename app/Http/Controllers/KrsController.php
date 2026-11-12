<?php

namespace App\Http\Controllers;

use App\Models\Krs;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class KrsController extends Controller
{
    private const BATAS_SKS = 24;

    public function index(): View
    {
        return view('krs.index');
    }

    // KrsController
    public function show(Krs $krs): View
    {
        $krs->load(['mahasiswa', 'matakuliah']);

        return view('krs.show', compact('krs'));
    }

    public function data(): JsonResponse
    {
        $query = Krs::query()
            ->join('mahasiswa', 'mahasiswa.id', '=', 'krs.mahasiswa_id')
            ->select('krs.id', 'krs.tahun_akademik', 'krs.semester', 'krs.status',
                'mahasiswa.nim', 'mahasiswa.nama')
            ->withCount('matakuliah')
            ->withSum('matakuliah as total_sks', 'sks');

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('aksi', function (Krs $krs) {
                return view('krs._aksi', compact('krs'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        return view('krs.create', $this->dataForm(new Krs()));
    }

    public function store(Request $request): RedirectResponse
    {
        $data = $this->validated($request);

        DB::transaction(function () use ($data) {
            $krs = Krs::create(
                Arr::only($data, ['mahasiswa_id', 'tahun_akademik', 'semester'])
            );
            $krs->matakuliah()->sync($data['matakuliah']);
        });

        return redirect()->route('krs.index')
            ->with('success', 'Data KRS berhasil ditambahkan.');
    }

    public function edit(Krs $krs): View
    {
        return view('krs.edit', $this->dataForm($krs));
    }

    public function update(Request $request, Krs $krs): RedirectResponse
    {
        $data = $this->validated($request, $krs);

        DB::transaction(function () use ($data, $krs) {
            $krs->update(Arr::only($data, ['mahasiswa_id', 'tahun_akademik', 'semester']));
            $krs->matakuliah()->sync($data['matakuliah']);
        });

        return redirect()->route('krs.index')
            ->with('success', 'Data KRS berhasil diperbarui.');
    }

    public function destroy(Krs $krs): JsonResponse
    {
        // hapus detail dulu, baru KRS, dalam satu transaksi
        DB::transaction(function () use ($krs) {
            $krs->matakuliah()->detach();
            $krs->delete();
        });

        return response()->json(['message' => 'Data KRS berhasil dihapus.']);
    }

    /** Pilihan di form: mahasiswa dan mata kuliah diambil dari database. */
    private function dataForm(Krs $krs): array
    {
        return [
            'krs' => $krs,
            'daftarMahasiswa' => Mahasiswa::orderBy('nama')->get(['id', 'nim', 'nama']),
            'daftarMatakuliah' => MataKuliah::orderBy('kode_mk')
                ->get(['id', 'kode_mk', 'nama_mk', 'sks']),
        ];
    }

    private function validated(Request $request, ?Krs $krs = null): array
    {
        $data = $request->validate([
            'mahasiswa_id' => ['required', 'exists:mahasiswa,id'],
            'tahun_akademik' => ['required', 'regex:/^\d{4}\/\d{4}$/'],
            'semester' => ['required', Rule::in(['Ganjil', 'Genap'])],
            'matakuliah' => ['required', 'array', 'min:1'],
            'matakuliah.*' => ['distinct', 'exists:mata_kuliah,id'],
        ], [
            'mahasiswa_id.required' => 'Mahasiswa wajib dipilih.',
            'mahasiswa_id.exists' => 'Mahasiswa tidak ditemukan.',
            'tahun_akademik.required' => 'Tahun akademik wajib diisi.',
            'tahun_akademik.regex' => 'Format tahun akademik harus seperti 2026/2027.',
            'semester.required' => 'Semester wajib dipilih.',
            'semester.in' => 'Semester harus Ganjil atau Genap.',
            'matakuliah.required' => 'Pilih minimal satu mata kuliah.',
            'matakuliah.min' => 'Pilih minimal satu mata kuliah.',
        ]);

        // FITUR TAMBAHAN 1: cegah KRS ganda (mahasiswa + tahun akademik + semester sama)
        $sudahAda = Krs::where('mahasiswa_id', $data['mahasiswa_id'])
            ->where('tahun_akademik', $data['tahun_akademik'])
            ->where('semester', $data['semester'])
            ->when($krs, fn ($q) => $q->where('id', '!=', $krs->id))
            ->exists();

        if ($sudahAda) {
            throw ValidationException::withMessages([
                'semester' => 'KRS mahasiswa ini untuk semester dan tahun akademik '
                    . 'tersebut sudah ada.',
            ]);
        }

        // FITUR TAMBAHAN 2: batasi total SKS
        $totalSks = MataKuliah::whereIn('id', $data['matakuliah'])->sum('sks');

        if ($totalSks > self::BATAS_SKS) {
            throw ValidationException::withMessages([
                'matakuliah' => "Total SKS {$totalSks} melebihi batas "
                    . self::BATAS_SKS . ' SKS.',
            ]);
        }

        return $data;
    }
}