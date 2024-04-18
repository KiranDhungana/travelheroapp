<?php

namespace App\Http\Controllers;

use App\Models\location;

use Illuminate\Support\Facades\DB;
use App\Models\User;

use Illuminate\Http\Request;

class Searchcontroller extends Controller
{
    public function searchbyname(Request $req)
    {
        $para = $req->input('query');
        $para = trim($para);
        if (empty($para)) {
            $users = collect();
        } else {
            $users = DB::table('users')->where('name', 'LIKE', '%' . $para . "%")->get();
        }
        return response()->json($users);
    }

    public function getlocation(Request $req)
    {
        $location = new location;
        $latitude = $req->latitude;
        $longitude = $req->longitude;
        $userid = $req->uid;
        $user = location::where('uid', $userid)->first()->exists();
        if ($user) {
            $location->latitude = $latitude;
            $location->longitude = $longitude;
            $location->uid = $userid;
            $location->save();
        } else {
            $location->latitude = $latitude;
            $location->longitude = $longitude;
            $location->uid = $userid;
            $location->save();
        }
        return response()->json([
            "userinfo " => $user,
            "message" => "Location Received successfully"
        ], 200);



    }

}