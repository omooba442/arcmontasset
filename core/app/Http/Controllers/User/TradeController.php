<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Models\CryptoCurrency;
use App\Http\Controllers\Controller;
use App\Lib\Trade;
use App\Models\TradeLog;
use App\Models\TradeSetting;

class TradeController extends Controller
{
    public function index()
    {
        $pageTitle = "Trade Now";
        $cryptos   = CryptoCurrency::active()->orderByRaw('rank = 0, rank ASC')->get();
        return view($this->activeTemplate . 'user.trade.index', compact('pageTitle', 'cryptos'));
    }
    public function tradeNow($name)
    {
        $currency      = CryptoCurrency::active()->where('name', $name)->firstOrFail();
        $tradeSettings = TradeSetting::latest()->get();
        $pageTitle     = "Trade With " . $currency->name;
        return view($this->activeTemplate. 'user.trade.trade_with', compact('pageTitle','currency', 'tradeSettings'));
    }
    public function store(Request $request)
    {
        $trade = new Trade();
        return $trade->store($request);
    }

    public function tradeResult(Request $request)
    {
        $trade = new Trade();
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
            $tradeLogs = TradeLog::where('user_id', auth()->id())->$scope();
        } else {
            $tradeLogs = TradeLog::where('user_id', auth()->id());
        }
        return $tradeLogs->with("crypto")->latest('id')->paginate(getPaginate());
    }
}
