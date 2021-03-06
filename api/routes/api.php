<?php

use App\Http\Controllers\AlphabetController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/check-auth', [UserController::class, 'checkAuth']);

Route::post('/add-result', [UserController::class, 'addResult']);

Route::get('/letters', [AlphabetController::class, 'getLetters']);
