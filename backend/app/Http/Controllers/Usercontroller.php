<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
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
         $userinfo = User::create([
            'name' => $name,
            'email' => $email,
            'password' => $password,
        ]);
        $token =  JWTAuth::fromUser($userinfo);
        $user->save();


        return response()->json([
            "name" => $name,
            "email" => $email,
            "password" => $password,
            "Message" => "User accound creted successfully !",
            "token"=>$token,

        ], 200);

    }
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
    
        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Invalid credentials'], 401);
        }
    
        // Get the authenticated user
        $user = auth()->user();
    
        // Generate a token with custom claims
        $customToken = JWTAuth::claims([
            'name' => $user->name,
            'email' => $user->email,
        ])->fromUser($user);
    
        return response()->json(['token' => $customToken]);
    }
    public function logout(Request $request)
    {
        $token = $request->token;
        // $token->revoke();
        $user = User::where('remember_token', $token)->first();
        if ($user) {
            $user->remember_token = '';
            $user->save();
        }

        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, 200);
    }
    public function getprofile(Request $req)
    {
        $token = $req->token;
        // $token->revoke();
        $user = User::where('remember_token', $token)->first();
        $userdetail = $user::all();
        if ($user) {
            $user->remember_token = '';
            $user->save();
        }

        $response = ['message' => 'You have been successfully logged out!'];
        return response($userdetail, 200);
    }
}