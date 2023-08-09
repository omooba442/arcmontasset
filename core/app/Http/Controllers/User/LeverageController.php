<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Models\CryptoCurrency;
use App\Http\Controllers\Controller;
use App\Lib\Trade;
use App\Models\TradeLog;
use App\Models\TradeSetting;

class LeverageController extends Controller
{
    public function index()
    {
        $pageTitle = "Leverage";
        $cryptos   = CryptoCurrency::active()->orderByRaw('rank = 0, rank ASC');
        $balances  = json_decode(auth()->user()->balance, true);
        $durations = TradeSetting::oldest()->get();
        $log           = $this->tradeData();
        $log2           = $this->tradeData();
        return view($this->activeTemplate . 'user.leverage.index', compact('pageTitle', 'cryptos', 'balances', 'durations', 'log', 'log2'));
    }

    protected function tradeData($scope = null)
    {
        if ($scope) {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->$scope();
        } else {
            $tradeLogs = TradeLog::where('user_id', auth()->id());
        }
        // return $tradeLogs->with("crypto")->latest('id')->paginate(getPaginate());
        return $tradeLogs->with("crypto")->latest('id');
    }
}
