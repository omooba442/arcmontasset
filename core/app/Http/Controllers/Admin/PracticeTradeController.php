<?php

namespace App\Http\Controllers\Admin;

use App\Models\PracticeLog;
use App\Http\Controllers\Controller;

class PracticeTradeController extends Controller
{
    public function index()
    {
        $pageTitle    = "Practice Trade Log";
        $practiceLogs = $this->practiceTradeData();
        return view('admin.practice_trade_log.index', compact('pageTitle', 'practiceLogs'));
    }
    public function wining()
    {
        $pageTitle    = "Practice Wining Trade Log";
       $practiceLogs = $this->practiceTradeData('win');
        return view('admin.practice_trade_log.index', compact('pageTitle', 'practiceLogs'));
    }

    public function losing()
    {
        $pageTitle    = "Practice Losing Trade Log";
        $practiceLogs = $this->practiceTradeData("loss");
        return view('admin.practice_trade_log.index', compact('pageTitle', 'practiceLogs'));
    }

    public function draw()
    {
        $pageTitle    = "Practice Draw Trade Log";
        $practiceLogs = $this->practiceTradeData("draw");
        return view('admin.practice_trade_log.index', compact('pageTitle', 'practiceLogs'));
    }


    protected function practiceTradeData($scope = null)
    {
        if ($scope) {
            $practiceLogs = PracticeLog::$scope();
        }else {
            $practiceLogs = PracticeLog::query();
        }

        return $practiceLogs->with("user","crypto")->searchAble(['user:username','crypto:name,symbol'])->latest('id')->dateFilter()->paginate(getPaginate());
    }
}
