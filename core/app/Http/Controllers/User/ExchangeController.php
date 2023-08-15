<?php

namespace App\Http\Controllers\User;

use App\Models\TradeLog;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Constants\Status;
use App\Models\Exchange;
use App\Models\Transaction;
use Illuminate\Support\Facades\Validator;

class ExchangeController extends Controller
{
    public function index()
    {
        $pageTitle = "Exchange";
        $balances  = json_decode(auth()->user()->balance, true);
        $log           = Exchange::paginate(20);
        return view($this->activeTemplate . 'user.exchange.index', compact('pageTitle', 'balances', 'log'));
    }

    public function achieve(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'value'        => 'required|numeric|gt:0',
            'from'        => 'required|in:1,2,3',
            'to'        => 'required|in:1,2,3',
        ], [
            'value.required'        => 'The quantity field is required.',
            'value.gt'        => 'The exchange quantity must be greater than 0.',
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors()->all());
        }

        if (!in_array($request->from, [Status::WALLET_USDT, Status::WALLET_BTC, Status::WALLET_ETH])) {
            return $this->errorResponse(['Invalid From wallet.']);
        }

        if (!in_array($request->to, [Status::WALLET_USDT, Status::WALLET_BTC, Status::WALLET_ETH])) {
            return $this->errorResponse(['Invalid To wallet.']);
        }
        
        $user = auth()->user();
        $wallet_map = [
            1 => 'USDT',
            2 => 'BTC',
            3 => 'ETH',
        ];
        $balances = json_decode($user->balance, true);
        $balance_from = $balances[$wallet_map[$request->from]] ?? 0;
        $balance_to = $balances[$wallet_map[$request->to]] ?? 0;
        if($request->from == $request->to){
            return $this->errorResponse(['You can\'t exchange a wallet with itself.']);
        }
        if($balance_from < $request->value){
            return $this->errorResponse(['Insufficient balance.']);
        }
        $coinRate = getCoinRate($wallet_map[$request->from], intval($request->to));

        $newFrom = $balance_from - $request->value;
        $newTo = $balance_to + ($request->value * $coinRate);

        $balances[$wallet_map[$request->from]] = $newFrom;
        $balances[$wallet_map[$request->to]] = $newTo;

        $details = strval($request->value) . ' ' . $wallet_map[$request->from] . ' exchange with ' . $wallet_map[$request->to];
        $exhange = new Exchange();
        $exhange->user_id      = $user->id;
        $exhange->amount       = $request->value;
        $exhange->details      = $details;
        $exhange->from_wallet  = $wallet_map[$request->from];
        $exhange->to_wallet    = $wallet_map[$request->to];
        $exhange->rate         = $coinRate;
        $exhange->trx          = getTrx();
        $exhange->save();

        $this->createTransaction($request->value, $details, '-', $balances[$wallet_map[$request->from]], $wallet_map[$request->from]);
        $this->createTransaction(($request->value * $coinRate), $details, '+', $balances[$wallet_map[$request->to]], $wallet_map[$request->to]);

        $user->balance = json_encode($balances);
        $user->save();
        return $this->successResponse('Success');
    }

    public function createTransaction($amount, $details, $trxType = "+", $balance, $wallet)
    {
        $user = auth()->user();

        $transaction               = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $amount;
        $transaction->post_balance = $balance;
        $transaction->trx_type     = $trxType;
        $transaction->details      = $details;
        $transaction->wallet      = $wallet;
        $transaction->trx          = getTrx();
        $transaction->save();
    }

    public function errorResponse($errors)
    {
        return response()->json([
            'success' => false,
            'errors'  => $errors
        ]);
    }

    public function successResponse($message)
    {
        return response()->json([
            'success' => true,
            "message" => $message
        ]);
    }
}
