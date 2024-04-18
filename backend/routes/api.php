<?php

use App\Http\Controllers\Listingcontroller;
use App\Http\Controllers\Searchcontroller;
use App\Http\Controllers\Usercontroller;
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

Route::get("/allusers", [Usercontroller::class, 'getalluser'], );
Route::post("/signup", [Usercontroller::class, 'signup'], );
<<<<<<< HEAD
Route::post("/login", [Usercontroller::class, 'login'], );
=======
Route::post("/login", [Usercontroller::class, 'login'], );
Route::post("/logout", [Usercontroller::class, 'logout'], );
Route::post("/userprofile", [Usercontroller::class, 'getprofile'], );

// Search API 
Route::post("/searchbyname", [Searchcontroller::class, 'searchbyname'], );
Route::post("/getlocation", [Searchcontroller::class, 'getlocation'], );

// Lising API 
Route::post("/addlisting", [Listingcontroller::class, 'addlisting'], );
>>>>>>> 53353c71d59e06ec3393305e9182310d0bc934ca
