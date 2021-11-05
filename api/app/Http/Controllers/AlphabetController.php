<?php

namespace App\Http\Controllers;

use App\Services\LettersServices;
use Illuminate\Http\JsonResponse;

class AlphabetController extends Controller
{
    public function getLetters(): JsonResponse
    {
        return response()->json(['success' => true, 'data' => LettersServices::generateLettersList()]);
    }
}
