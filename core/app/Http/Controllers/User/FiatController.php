<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Models\Fiat;
use App\Http\Controllers\Controller;
use App\Lib\Trade;
use App\Models\TradeLog;
use App\Models\TradeSetting;

class FiatController extends Controller
{
    public function index()
    {
        $pageTitle = "Fiat Trades";
        $cryptos   = [
            'USDT',
            'BTC',
            'ETH'
        ];
        $fiats     = Fiat::active()->oldest();
        $balances  = json_decode(auth()->user()->balance, true);
        $durations = TradeSetting::oldest()->get();
        $log           = $this->tradeData()->where('status', 0)->paginate($perPage = 15, $columns = ['*'], $pageName = 'page_tr');
        $log2           = $this->tradeData()->where('status', 1)->paginate($perPage = 15, $columns = ['*'], $pageName = 'page_cl');
        return view($this->activeTemplate . 'user.fiat.index', compact('pageTitle', 'cryptos', 'balances', 'durations', 'log', 'log2', 'fiats'));
    }
    public function store(Request $request)
    {
        $trade = new Trade(isFiat: true);
        return $trade->store($request);
    }

    public function tradeResult(Request $request)
    {
        $trade = new Trade(isFiat: true);
        return $trade->result($request);
    }

    public function tradeLog()
    {
        $pageTitle = "Trade Log";
        $tradeLogs = $this->tradeData();
        return view($this->activeTemplate. 'user.fiat.log', compact('pageTitle', 'tradeLogs'));
    }

    public function winingTradeLog()
    {
        $pageTitle = "Wining Trade Log";
        $tradeLogs = $this->tradeData('win');
        return view($this->activeTemplate. 'user.fiat.log', compact('pageTitle', 'tradeLogs'));
    }

    public function losingTradeLog()
    {
        $pageTitle = "Losing Trade Log";
        $tradeLogs = $this->tradeData('loss');
        return view($this->activeTemplate. 'user.fiat.log', compact('pageTitle', 'tradeLogs'));
    }

    public function drawTradeLog()
    {
        $pageTitle = "Draw Trade Log";
        $tradeLogs = $this->tradeData('draw');
        return view($this->activeTemplate. 'user.fiat.log', compact('pageTitle', 'tradeLogs'));
    }

    protected function tradeData($scope = null)
    {
        if ($scope) {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->where('isFiat', true)->$scope();
        } else {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->where('isFiat', true);
        }
        return $tradeLogs->with("crypto")->latest('id');
    }
}
