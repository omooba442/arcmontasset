<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TradeSetting;
use Illuminate\Http\Request;

class TradeSettingController extends Controller
{
    public function index()
    {
        $pageTitle = "Trade Setting";
        $games     = TradeSetting::oldest('id')->paginate(getPaginate());
        return view('admin.trade_setting.index', compact('games', 'pageTitle'));
    }

    public function save(Request $request, $id = 0)
    {
        $request->validate([
            'time' => 'required|integer',
            'profit' => 'required|integer|max:100|min:0',
            'unit' => 'required|in:seconds,minutes,hours,days',
            'minimum_usdt' => 'required|numeric',
            'minimum_btc' => 'required|numeric',
            'minimum_eth' => 'required|numeric',
        ]);
        if ($id) {
            $tradeSetting = TradeSetting::findOrFail($id);
            $message      = "Trade setting updated successfully";
        } else {
            $tradeSetting = new TradeSetting();
            $message      = "Trade setting successfully";
        }

        $tradeSetting->time = $request->time;
        $tradeSetting->profit = $request->profit;
        $tradeSetting->unit = $request->unit;
        $tradeSetting->minimum = json_encode([
            'USDT' => $request->minimum_usdt,
            'BTC' => $request->minimum_btc,
            'ETH' => $request->minimum_eth,
        ]);
        $tradeSetting->save();

        $notify[] = ['success', $message];
        return back()->withNotify($notify);
    }

    public function delete($id)
    {
        $tradeSetting = TradeSetting::findOrFail($id);
        $tradeSetting->delete();

        $notify[] = ['success', 'Time deleted successfully'];
        return back()->withNotify($notify);
    }

}
