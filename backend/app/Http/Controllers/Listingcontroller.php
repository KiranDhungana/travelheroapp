<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Listing;
use App\Models\User;

class Listingcontroller extends Controller
{
    public function addlisting(Request $req)
    {
        $usertoken = $req->token;
        $erromsg = '';
        $user = User::where('remember_token', $usertoken)->first();
        if ($user) {
            $userid = $user->id;
            $listing = new Listing;
            $listing->userid = $userid;
            $listing->title = $req->title;
            $listing->cost = $req->cost;
            $listing->type = $req->type;  // flat , room , house , apartment 
            $listing->floor = $req->floor; // 1st , 2nd
            $listing->bedroom = $req->bedroom;  // 1 , 2 , 3
            $listing->livingroom = $req->livingroom;  // 1 , 2 , 3
            $listing->kitchen = $req->kitchen;  // 1 , 2 , 3
            $listing->description = $req->description;  // 
            $listing->status = $req->status;  // Booked  , inactive  , Active
            $listing->save();
        } else {
            $erromsg = "Invalid user ";
        }


        return response()->json([
            "data" => $user,
            "Invaliduser" => $erromsg,
        ], 200);

    }
    //


}