<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\EarnSetting;
use Illuminate\Http\Request;

class EarnSettingController extends Controller
{
    public function index()
    {
        $pageTitle = "Earn Setting";
        $games     = EarnSetting::oldest('id')->paginate(getPaginate());
        return view('admin.earn_setting.index', compact('games', 'pageTitle'));
    }

    public function save(Request $request, $id = 0)
    {
        $request->validate([
            'time' => 'required|integer',
            'profit' => 'required|numeric|max:100.00|min:0.00',
            'unit' => 'required|in:days,days',
            'minimum_usdt' => 'required|numeric',
            'minimum_btc' => 'required|numeric',
            'minimum_eth' => 'required|numeric',
        ]);
        if ($id) {
            $tradeSetting = EarnSetting::findOrFail($id);
            $message      = "Trade setting updated successfully";
        } else {
            $tradeSetting = new EarnSetting();
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
        $tradeSetting = EarnSetting::findOrFail($id);
        $tradeSetting->delete();

        $notify[] = ['success', 'Time deleted successfully'];
        return back()->withNotify($notify);
    }

}
