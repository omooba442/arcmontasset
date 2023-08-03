<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class UserController extends Controller
{
    //
    public function index(Request $req) {

        // $admins = User::all('admins');
        // return view('admin.user.index', compact('admins'));
        return $req -> input();
    }
}
