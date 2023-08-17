<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Models\CryptoCurrency;
use App\Http\Controllers\Controller;
use App\Lib\Trade;
use App\Models\TradeLog;
use App\Models\LockupSetting;

class LockupController extends Controller
{
    public function index()
    {
        $pageTitle = "Future Trades";
        $cryptos   = CryptoCurrency::active()->orderByRaw('rank = 0, rank ASC');
        $cryptos2   = CryptoCurrency::active()->orderByRaw('rank = 0, rank ASC')->get();
        $balances  = json_decode(auth()->user()->balance, true);
        $durations = LockupSetting::oldest()->get();
        $log           = $this->tradeData()->where('status', 0)->paginate($perPage = 15, $columns = ['*'], $pageName = 'page_tr');
        $log2           = $this->tradeData()->where('status', 1)->paginate($perPage = 15, $columns = ['*'], $pageName = 'page_cl');
        return view($this->activeTemplate . 'user.lockup.index', compact('pageTitle', 'cryptos', 'cryptos2', 'balances', 'durations', 'log', 'log2'));
    }
    public function store(Request $request)
    {
        $trade = new Trade(isLockup: true);
        return $trade->store($request);
    }

    public function tradeResult(Request $request)
    {
        $trade = new Trade(isLockup: true);
        return $trade->result($request);
    }

    public function tradeLog()
    {
        $pageTitle = "Trade Log";
        $tradeLogs = $this->tradeData();
        return view($this->activeTemplate. 'user.trade.log', compact('pageTitle', 'tradeLogs'));
    }

    public function winingTradeLog()
    {
        $pageTitle = "Wining Trade Log";
        $tradeLogs = $this->tradeData('win');
        return view($this->activeTemplate. 'user.trade.log', compact('pageTitle', 'tradeLogs'));
    }

    public function losingTradeLog()
    {
        $pageTitle = "Losing Trade Log";
        $tradeLogs = $this->tradeData('loss');
        return view($this->activeTemplate. 'user.trade.log', compact('pageTitle', 'tradeLogs'));
    }

    public function drawTradeLog()
    {
        $pageTitle = "Draw Trade Log";
        $tradeLogs = $this->tradeData('draw');
        return view($this->activeTemplate. 'user.trade.log', compact('pageTitle', 'tradeLogs'));
    }

    protected function tradeData($scope = null)
    {
        if ($scope) {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->where('isLockup', true)->$scope();
        } else {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->where('isLockup', true);
        }
        // return $tradeLogs->with("crypto")->latest('id')->paginate(getPaginate());
        return $tradeLogs->with("crypto")->latest('id');
    }
}
