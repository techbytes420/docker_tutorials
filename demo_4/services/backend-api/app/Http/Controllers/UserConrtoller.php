<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserConrtoller extends Controller
{
    public function read(Request $request)
    {
        return User::all();
    }
}
