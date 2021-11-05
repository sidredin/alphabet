<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function checkAuth(Request $request): JsonResponse
    {
        $user = $this->getUser($request);
        if ($user) {
            return response()->json(['success' => true, 'data' => $user]);
        } else {
            return response()->json(['success' => false], 401);
        }
    }

    public function addResult(Request $request): JsonResponse
    {
        $user = User::find($request->userId);

        if ($user) {
            if ($request->result == 'win') {
                $user->wins = $user->wins + 1;
            } else {
                $user->losses = $user->losses + 1;
            }
            $user->save();
            return response()->json(['success' => true, 'data' => $user]);
        } else {
            return response()->json(['success' => false], 401);
        }
    }


    private function getUser(Request $request)
    {
        return User::select('id', 'name', 'wins', 'losses')
            ->where('name', $request->name)
            ->where('password', $request->password)
            ->first();
    }
}
