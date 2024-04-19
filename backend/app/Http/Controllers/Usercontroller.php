<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class Usercontroller extends Controller
{
    public function getalluser()
    {
        $user = User::all();
        return response()->json([
            "data" => $user
        ], 200);

    }
    public function signup(Request $req)
    {
        $user = new user;
        $name = $req->name;
        $email = $req->email;
        $password = Hash::make($req->password);
        $user->name = $name;
        $user->email = $email;
        $user->password = $password;
        $token = Str::random(10);
        $user->remember_token = $token;
        $user->save();


        return response()->json([
            "name" => $name,
            "email" => $email,
            "password" => $password,
            "Message" => "User accound creted successfully !"

        ], 200);

    }
}