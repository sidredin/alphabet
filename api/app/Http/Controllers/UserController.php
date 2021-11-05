<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function checkAuth(Request $request)
    {
        $user = User::select('id', 'name')
            ->where('name', $request->name)
            ->where('password', $request->password)
            ->first();
        if ($user) {
            return response()->json(['success' => true, 'data' => $user]);
        } else {
            return response()->json(['success' => false], 401);
        }
    }
}
