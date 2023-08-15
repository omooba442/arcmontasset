<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Models\CryptoCurrency;
use App\Http\Controllers\Controller;
use App\Lib\Trade;
use App\Models\TradeLog;
use App\Models\EarnSetting;

class EarnController extends Controller
{
    public function index()
    {
        $pageTitle = "Earn";
        $cryptos   = CryptoCurrency::active()->orderByRaw('rank = 0, rank ASC')->get();
        $balances  = json_decode(auth()->user()->balance, true);
        $durations = EarnSetting::oldest()->get();
        $log           = $this->tradeData();
        $log2           = $this->tradeData();
        return view($this->activeTemplate . 'user.earn.index', compact('pageTitle', 'cryptos', 'balances', 'durations', 'log', 'log2'));
    }
    public function store(Request $request)
    {
        $trade = new Trade(isEarn: true);
        return $trade->store($request);
    }

    
    public function log(Request $request)
    {
        $pageTitle = "Earn log";
        $user = auth()->user();
        $log = $this->tradeData()->paginate(20);
        return view($this->activeTemplate . 'user.earn.log', compact('pageTitle', 'log'));
    }

    protected function tradeData($scope = null)
    {
        if ($scope) {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->where('isEarn', true)->$scope();
        } else {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->where('isEarn', true);
        }
        return $tradeLogs->with("crypto")->latest('id');
    }
}
