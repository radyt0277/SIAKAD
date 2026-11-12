<?php

namespace App\Http\Controllers;

use App\Models\MataKuliah;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class MatakuliahController extends Controller
{
    public function index(): View
    {
        return view('mata_kuliah.index');
    }

     // MatakuliahController
    public function show(MataKuliah $matakuliah): View
    {
        $matakuliah->loadCount('krs');

        return view('mata_kuliah.show', compact('matakuliah'));
    }
    public function data(): JsonResponse
    {
        $query = MataKuliah::query()->select(['id', 'kode_mk', 'nama_mk', 'sks']);

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('aksi', function (MataKuliah $matakuliah) {
                return view('mata_kuliah._aksi', compact('matakuliah'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        return view('mata_kuliah.create', ['matakuliah' => new MataKuliah()]);
    }

    public function store(Request $request): RedirectResponse
    {
        $matakuliah = MataKuliah::create($this->validated($request));

        return redirect()->route('mata_kuliah.index')
            ->with('success', 'Mata kuliah ' . $matakuliah->nama_mk . ' berhasil ditambahkan.');
    }

    public function edit(MataKuliah $matakuliah): View
    {
        return view('mata_kuliah.edit', compact('matakuliah'));
    }

    public function update(Request $request, MataKuliah $matakuliah): RedirectResponse
    {
        $matakuliah->update($this->validated($request, $matakuliah));

        return redirect()->route('mata_kuliah.index')
            ->with('success', 'Mata kuliah ' . $matakuliah->nama_mk . ' berhasil diperbarui.');
    }

    public function destroy(MataKuliah $matakuliah): JsonResponse
    {
        // integritas referensial: mata kuliah yang sudah dipakai di KRS tidak boleh dihapus
        if ($matakuliah->krs()->exists()) {
            return response()->json([
                'message' => 'Mata kuliah tidak dapat dihapus: sudah dipakai di KRS.',
            ], 409);
        }

        $matakuliah->delete();

        return response()->json([
            'message' => 'Mata kuliah ' . $matakuliah->nama_mk . ' berhasil dihapus.',
        ]);
    }

    private function validated(Request $request, ?MataKuliah $matakuliah = null): array
    {
        return $request->validate([
            'kode_mk' => ['required', 'string', 'max:10',
                Rule::unique(MataKuliah::class, 'kode_mk')->ignore($matakuliah?->id)],
            'nama_mk' => ['required', 'string', 'max:100'],
            'sks' => ['required', 'integer', 'between:1,6'],
        ], [
            'kode_mk.required' => 'Kode mata kuliah wajib diisi.',
            'kode_mk.max' => 'Kode mata kuliah maksimal 10 karakter.',
            'kode_mk.unique' => 'Kode mata kuliah sudah dipakai.',
            'nama_mk.required' => 'Nama mata kuliah wajib diisi.',
            'sks.required' => 'SKS wajib diisi.',
            'sks.integer' => 'SKS harus berupa angka.',
            'sks.between' => 'SKS harus antara 1 sampai 6.',
        ]);
    }
}