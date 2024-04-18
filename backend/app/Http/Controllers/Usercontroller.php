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
    public function login(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'email' => 'required|string|email|max:255',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return response(['errors' => $validator->errors()->all()], 422);
        }
        $user = User::where('email', $req->email)->first();
        if ($user) {
            if (Hash::check($req->password, $user->password)) {
                $token = Str::random(10);
                $user->remember_token = $token;
                $user->save();
                $response = ['token' => $token];
                return response($response, 200);
            } else {
                $response = ["message" => "Password mismatch"];
                return response($response, 422);
            }
        } else {
            $response = ["message" => 'User does not exist'];
            return response($response, 422);
        }
    }
    public function logout(Request $request)
    {
        $token = $request->token;
        // $token->revoke();
        $user = User::where('remember_token', $token)->first(); // Find the user with the name 'John Doe'
        if ($user) {
            $user->remember_token = ''; // Update the name
            $user->save(); // Save the changes
        }

        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, 200);
    }
    public function getprofile(Request $req)
    {
        $token = $req->token;
        // $token->revoke();
        $user = User::where('remember_token', $token)->first(); // Find the user with the name 'John Doe'
        $userdetail = $user::all();
        if ($user) {
            $user->remember_token = ''; // Update the name
            $user->save(); // Save the changes
        }

        $response = ['message' => 'You have been successfully logged out!'];
        return response($userdetail, 200);
    }
    //   search by name 

}