<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TradeLog;

class TradeLogController extends Controller
{
    public function index()
    {
        $pageTitle = "Trade Log";
        $tradeLogs = $this->tradeData();
        return view('admin.trade_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function win()
    {
        $pageTitle = "Win Trade Log";
        $tradeLogs = $this->tradeData('win');
        return view('admin.trade_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function loss()
    {
        $pageTitle = "Loss Trade Log";
        $tradeLogs = $this->tradeData('loss');
        return view('admin.trade_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function draw()
    {
        $pageTitle = "Draw Trade Log";
        $tradeLogs = $this->tradeData('draw');
        return view('admin.trade_log.index', compact('pageTitle', 'tradeLogs'));
    }

    protected function tradeData($scope = null)
    {
        if ($scope) {
            $tradeList = TradeLog::$scope();
        } else {
            $tradeList = TradeLog::query();
        }
        return $tradeList->filter(['user_id'])->searchAble(['crypto:name,symbol','user:username'])->dateFilter()->orderBy('id', 'desc')->with('user', 'crypto')->paginate(getPaginate());
    }
}
