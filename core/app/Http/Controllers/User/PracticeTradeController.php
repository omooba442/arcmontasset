<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Models\CryptoCurrency;
use App\Models\PracticeLog;
use App\Http\Controllers\Controller;
use App\Lib\Trade;
use App\Models\TradeSetting;

class PracticeTradeController extends Controller
{
    public function index()
    {
        $pageTitle = "Practice Trade Now";
        $cryptos   = CryptoCurrency::active()->orderByRaw('rank = 0, rank ASC')->paginate(getPaginate());
        return view($this->activeTemplate . 'user.trade_practice.index', compact('pageTitle', 'cryptos'));
    }
    public function tradeNow($name)
    {
        $currency      = CryptoCurrency::active()->where('name', $name)->firstOrFail();
        $tradeSettings = TradeSetting::latest()->get();
        $pageTitle     = "Practice Trade With " . $currency->name;
        return view($this->activeTemplate . 'user.trade_practice.trade_with', compact('pageTitle', 'currency', 'tradeSettings'));
    }
    public function store(Request $request)
    {

        $trade = new Trade(true);
        return $trade->store($request);
    }
    public function tradeResult(Request $request)
    {
        $trade = new Trade(true);
        return $trade->result($request);
    }
    public function log()
    {
        $user            = auth()->user();
        $pageTitle       = "Practice Trade Log";
        $practicesTrades = PracticeLog::where('user_id', $user->id)->orderBy('id', 'DESC')->with('crypto')->paginate(getPaginate());
        return view($this->activeTemplate . 'user.trade_practice.log', compact('practicesTrades', 'pageTitle'));
    }
}
