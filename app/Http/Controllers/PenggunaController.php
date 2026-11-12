<?php
 
namespace App\Http\Controllers;
 
use App\Models\User;
use Illuminate\View\View;
 
class PenggunaController extends Controller
{
    public function index(): View
    {
        $kolom = [
            'name' => 'Nama', 'email' => 'Email', 'role' => 'Peran',
            'last_login_at' => 'Login Terakhir',          // <-- kolom baru
        ];
         
        // password tidak ikut diambil dari database
        $pengguna = User::orderBy('name')
            ->get(['name', 'email', 'role', 'last_login_at'])
            ->map(fn ($u) => [
                'name' => $u->name,
                'email' => $u->email,
                'role' => $u->role,
                'last_login_at' => $u->last_login_at
                    ?->timezone('Asia/Pontianak')
                    ->format('d/m/Y H:i') ?? '-',
            ])
            ->all();
         
        return view('pengguna.index', compact('kolom', 'pengguna'));
        
    }
}
