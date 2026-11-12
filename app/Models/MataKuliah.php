<?php
// MataKuliah.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class MataKuliah extends Model
{
    protected $table = 'mata_kuliah';

    protected $fillable = ['kode_mk', 'nama_mk', 'sks'];

    public function krs(): BelongsToMany
    {
        return $this->belongsToMany(Krs::class, 'krs_detail', 'mata_kuliah_id', 'krs_id')
            ->withTimestamps();
    }
}