<?php

namespace App\Http\Controllers\Admin;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Models\TradeLog;
use App\Models\Transaction;
use Illuminate\Http\Request;

class LockupLogController extends Controller
{
    public function index()
    {
        $pageTitle = "Trade Log";
        $tradeLogs = $this->tradeData();
        return view('admin.lockup_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function win()
    {
        $pageTitle = "Win Trade Log";
        $tradeLogs = $this->tradeData('win');
        return view('admin.lockup_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function loss()
    {
        $pageTitle = "Loss Trade Log";
        $tradeLogs = $this->tradeData('loss');
        return view('admin.lockup_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function draw()
    {
        $pageTitle = "Draw Trade Log";
        $tradeLogs = $this->tradeData('draw');
        return view('admin.lockup_log.index', compact('pageTitle', 'tradeLogs'));
    }

    public function change_profit(Request $request){
        $request->validate([
            'id' => ['required', 'exists:trade_logs,id'],
            'profit' => ['required', 'numeric', 'max:100.00', 'min:0.00'],
        ]);
        $tradeLog = TradeLog::where('id', $request->id)->first();
        $tradeLog->profit = $request->profit;
        $tradeLog->save();
        //Separate earn log
    }

    public function modify(Request $request)
    {
        $request->validate([
            'id' => ['required', 'exists:trade_logs,id'],
            'status' => ['required', 'string', 'in:win,loss,draw'],
        ]);

        $tradeLog = TradeLog::where('id', $request->id)->first();
        $user = $tradeLog->user()->first();
        $balances = json_decode($user->balance, true);
        $wallet_map = [
            1 => 'USDT',
            2 => 'BTC',
            3 => 'ETH',
        ];

        if ($tradeLog->status == Status::TRADE_PENDING) {
            switch ($request->status) {
                case 'win':
                    $tradeLog->rig = Status::TRADE_RIG_WIN;
                    break;
                case 'draw':
                    $tradeLog->rig = Status::TRADE_RIG_DRAW;
                    break;
                case 'loss':
                    $tradeLog->rig = Status::TRADE_RIG_LOSE;
                    break;
                default:
                    break;
            }
            $tradeLog->save();
        } else {
            switch ($request->status) {
                case 'win':
                    $oldResult = $tradeLog->result;
                    $tradeLog->result = Status::TRADE_WIN;
                    $tradeLog->status = Status::TRADE_COMPLETED;
                    $tradeLog->save();

                    switch ($oldResult) {
                        case Status::TRADE_LOSE:
                            $balances[$wallet_map[$tradeLog->wallet]] += $tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit);
                            $user->balance = json_encode($balances);
                            $user->save();
                            $this->createTransaction(($tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit)), 'Administrator action', '+', $balances[$wallet_map[$tradeLog->wallet]] , $wallet_map[$tradeLog->wallet]);
                            break;

                        case Status::TRADE_DRAW:
                            $balances[$wallet_map[$tradeLog->wallet]] += (($tradeLog->amount / 100) * doubleval($tradeLog->profit ?? 10));
                            $user->balance = json_encode($balances);
                            $user->save();
                            $this->createTransaction(((($tradeLog->amount / 100) * $tradeLog->profit)), 'Administrator action', '+', $balances[$wallet_map[$tradeLog->wallet]] , $wallet_map[$tradeLog->wallet]);
                            break;

                        default:
                            break;
                    }
                    break;

                case 'loss':
                    $oldResult = $tradeLog->result;
                    $tradeLog->result = Status::TRADE_LOSE;
                    $tradeLog->status = Status::TRADE_COMPLETED;
                    $tradeLog->save();

                    switch ($oldResult) {
                        case Status::TRADE_WIN:
                            $balances[$wallet_map[$tradeLog->wallet]] -= $tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit);
                            $user->balance = json_encode($balances);
                            $user->save();
                            $this->createTransaction(($tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit)), 'Administrator action', '-', $balances[$wallet_map[$tradeLog->wallet]] , $wallet_map[$tradeLog->wallet]);
                            break;

                        case Status::TRADE_DRAW:
                            $balances[$wallet_map[$tradeLog->wallet]] -= $tradeLog->amount;
                            $user->balance = json_encode($balances);
                            $user->save();
                            $this->createTransaction(($tradeLog->amount), 'Administrator action', '-', $balances[$wallet_map[$tradeLog->wallet]] , $wallet_map[$tradeLog->wallet]);
                            break;

                        default:
                            break;
                    }
                    break;

                case 'draw':
                    $oldResult = $tradeLog->result;
                    $tradeLog->result = Status::TRADE_DRAW;
                    $tradeLog->status = Status::TRADE_COMPLETED;
                    $tradeLog->save();

                    switch ($oldResult) {
                        case Status::TRADE_WIN:
                            $balances[$wallet_map[$tradeLog->wallet]] -= (($tradeLog->amount / 100) * doubleval($tradeLog->profit ?? 10));
                            $user->balance = json_encode($balances);
                            $user->save();
                            $this->createTransaction(((($tradeLog->amount / 100) * $tradeLog->profit)), 'Administrator action', '-', $balances[$wallet_map[$tradeLog->wallet]] , $wallet_map[$tradeLog->wallet]);
                            break;

                        case Status::TRADE_LOSE:
                            $balances[$wallet_map[$tradeLog->wallet]] += $tradeLog->amount;
                            $user->balance = json_encode($balances);
                            $user->save();
                            $this->createTransaction(($tradeLog->amount), 'Administrator action', '+', $balances[$wallet_map[$tradeLog->wallet]] , $wallet_map[$tradeLog->wallet]);
                            break;

                        default:
                            break;
                    }
                    break;

                default:
                    break;
            }
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Result was updated successfully',
        ], 200);
    }

    protected function createTransaction($amount, $details, $trxType = "+", $balance, $wallet)
    {
        $user = auth()->user();

        $transaction               = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $amount;
        $transaction->post_balance = $balance;
        $transaction->trx_type     = $trxType;
        $transaction->details      = $details;
        $transaction->wallet       = $wallet;
        $transaction->remark       = 'Trade Audit';
        $transaction->trx          = getTrx();
        $transaction->save();
    }

    protected function tradeData($scope = null)
    {
        if ($scope) {
            $tradeList = TradeLog::where('isLockup', true)->$scope();
        } else {
            $tradeList = TradeLog::where('isLockup', true);
        }
        return $tradeList->filter(['user_id'])->searchAble(['crypto:name,symbol', 'user:username'])->dateFilter()->orderBy('id', 'desc')->with('user', 'crypto')->paginate(getPaginate());
    }
}
