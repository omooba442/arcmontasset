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
        $games     = TradeSetting::latest('id')->paginate(getPaginate());
        return view('admin.trade_setting.index', compact('games', 'pageTitle'));
    }

    public function save(Request $request, $id = 0)
    {
        $request->validate([
            'time' => 'required|integer',
            'unit' => 'required|in:seconds,minutes,hours'
        ]);
        if ($id) {
            $tradeSetting = TradeSetting::findOrFail($id);
            $message      = "Trade setting updated successfully";
        } else {
            $tradeSetting = new TradeSetting();
            $message      = "Trade setting successfully";
        }

        $tradeSetting->time = $request->time;
        $tradeSetting->unit = $request->unit;
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
