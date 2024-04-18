<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Listing;

class Listingcontroller extends Controller
{
    public function addlisting(Request $req)
    {
        $listing = new listing;
        $listing->useid = $req->userid;
        $listing->title = $req->title;
        $listing->cost = $req->cost;
        $listing->type = $req->type;  // flat , room , house , apartment 
        $listing->floor = $req->floor; // 1st , 2nd
        $listing->bedroom = $req->bedroom;  // 1 , 2 , 3
        $listing->livingroom = $req->livingroom;  // 1 , 2 , 3
        $listing->kitchen = $req->kitchen;  // 1 , 2 , 3
        $listing->description = $req->description;  // 
        $listing->status = $req->status;  // Booked  , inactive  , Active
        return response()->json([
            "data" => $req->all(),
        ], 200);

    }
    //


}