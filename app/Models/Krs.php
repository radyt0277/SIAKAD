<?php
// Krs.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Krs extends Model
{
    protected $table = 'krs';

    protected $fillable = ['mahasiswa_id', 'tahun_akademik', 'semester', 'status'];

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(Mahasiswa::class, 'mahasiswa_id');
    }

    public function matakuliah(): BelongsToMany
    {
        return $this->belongsToMany(MataKuliah::class, 'krs_detail', 'krs_id', 'mata_kuliah_id')
            ->withTimestamps();
    }
}