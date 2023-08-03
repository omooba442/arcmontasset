<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Commission;
use App\Models\User;

class ReferralController extends Controller
{
    public function commissions()
    {
        $user        = auth()->user();
        $pageTitle   = 'Referral Commission Log';
        $commissions = Commission::where('user_id', $user->id)->with('fromUser')->latest('id')->paginate(getPaginate());
        return view($this->activeTemplate . 'user.commissions', compact('pageTitle', 'commissions'));
    }

    public function referralsLog()
    {
        $user      = auth()->user();
        $pageTitle = 'Referral Log';
        $referrals = User::where('ref_by', $user->id)->latest('id')->paginate(getPaginate());
        return view($this->activeTemplate . 'user.referral', compact('pageTitle', 'referrals'));
    }
}
