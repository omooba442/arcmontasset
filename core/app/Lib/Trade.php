<?php

namespace App\Lib;

use App\Models\LockupSetting;
use Carbon\Carbon;
use App\Models\TradeLog;
use App\Constants\Status;
use App\Models\PracticeLog;
use App\Models\Transaction;
use App\Models\CryptoCurrency;
use App\Models\Fiat;
use App\Models\EarnSetting;
use App\Models\LeverageSetting;
use App\Models\TradeSetting;
use Illuminate\Support\Facades\Validator;

class Trade
{

    protected $isPracticeTrade = false;
    protected $isFiatTrade = false;
    protected $isEarnTrade = false;
    protected $isLeverageTrade = false;
    protected $isLockupTrade = false;
    protected $modelName       = TradeLog::class;
    protected $columnName      = 'balance';

    public function __construct($isFiat = false, $isEarn = false, $isLeverage = false, $isLockup = true, $isPractice = false)
    {
        if ($isFiat) {
            $this->isFiatTrade = true;
        }

        if ($isEarn) {
            $this->isEarnTrade = true;
        }

        if ($isLeverage) {
            $this->isLeverageTrade = true;
        }

        if ($isLockup) {
            $this->isLockupTrade = true;
        }

        if ($isPractice) {
            $this->modelName       = PracticeLog::class;
            $this->columnName      = 'demo_balance';
            $this->isPracticeTrade = true;
        }
    }
    public function store($request)
    {
        if ($this->isFiatTrade) {
            $validator = Validator::make($request->all(), [
                'amount'        => 'required|numeric|gt:0',
                'fiat'          => 'required|string|exists:fiats,symbol',
                'high_low_type' => 'required|in:1,2',
                'wallet'        => 'required|in:1,2,3',
                'duration'      => 'required|exists:trade_settings,time',
                'unit'          => 'required|in:seconds,minutes,hours,days'
            ]);
        } else if ($this->isEarnTrade) {
            $validator = Validator::make($request->all(), [
                'amount'        => 'required|numeric|gt:0',
                'coin_id'       => 'required|string|exists:crypto_currencies,symbol',
                'high_low_type' => 'required|in:1,2',
                'wallet'        => 'required|in:1,2,3',
                'duration'      => 'required|exists:earn_settings,time',
                'unit'          => 'required|in:days'
            ]);
            $request->high_low_type = Status::TRADE_HIGH;
        } else if ($this->isLeverageTrade) {
            $validator = Validator::make($request->all(), [
                'amount'        => 'required|numeric|gt:0',
                'coin_id'       => 'required|string|exists:crypto_currencies,symbol',
                'high_low_type' => 'required|in:1,2',
                'wallet'        => 'required|in:1,2,3',
                'duration'      => 'required|exists:leverage_settings,time',
                'unit'          => 'required|in:seconds,minutes,hours,days'
            ]);
        } else if ($this->isLockupTrade) {
            $validator = Validator::make($request->all(), [
                'amount'        => 'required|numeric|gt:0',
                'coin_id'       => 'required|string|exists:crypto_currencies,symbol',
                'high_low_type' => 'required|in:1,2',
                'wallet'        => 'required|in:1,2,3',
                'duration'      => 'required|exists:lockup_settings,time',
                'unit'          => 'required|in:months'
            ]);
        } else {
            $validator = Validator::make($request->all(), [
                'amount'        => 'required|numeric|gt:0',
                'coin_id'       => 'required|string|exists:crypto_currencies,symbol',
                'high_low_type' => 'required|in:1,2',
                'wallet'        => 'required|in:1,2,3',
                'duration'      => 'required|exists:trade_settings,time',
                'unit'          => 'required|in:seconds,minutes,hours,days'
            ]);
        }

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors()->all());
        }

        if (!in_array($request->wallet, [Status::WALLET_USDT, Status::WALLET_BTC, Status::WALLET_ETH])) {
            return $this->errorResponse($this->isFiatTrade ? ['Invalid cryptocurrency'] : ['Invalid wallet.']);
        }

        if ($this->isFiatTrade) {
            $crypto = Fiat::active()->where('symbol', $request->fiat)->first();
        } else {
            $crypto = CryptoCurrency::active()->where('symbol', $request->coin_id)->first();
        }
        if (!$crypto) {
            return $this->errorResponse($this->isFiatTrade ? ['Fiat currency not found'] : ['Crypto currency not found']);
        }
        if ($this->isEarnTrade) {
            $tradeSetting = EarnSetting::where('time', $request->duration)->where('unit', $request->unit)->first();
        } else if ($this->isLeverageTrade) {
            $tradeSetting = LeverageSetting::where('time', $request->duration)->where('unit', $request->unit)->first();
        } else if ($this->isLockupTrade) {
            $tradeSetting = LockupSetting::where('time', $request->duration)->where('unit', $request->unit)->first();
        } else {
            $tradeSetting = TradeSetting::where('time', $request->duration)->where('unit', $request->unit)->first();
        }

        $user      = auth()->user();
        $columName = $this->columnName;
        $wallet_map = [
            1 => 'USDT',
            2 => 'BTC',
            3 => 'ETH',
        ];
        if (!is_null($tradeSetting)) {
            if ($this->isEarnTrade) {
                $profit = json_decode($tradeSetting->profit, true)[$crypto->symbol];
            } else if ($this->isLockupTrade) {
                $profit = json_decode($tradeSetting->profit, true)[$crypto->symbol];
            } else {
                $profit = $tradeSetting->profit;
            }
        } else {
            return $this->errorResponse($this->isEarnTrade ? ['Invalid subscription duration.'] : ['Invalid open time.']);
        }
        if ($crypto->symbol == $wallet_map[$request->wallet]) {
            return $this->errorResponse([$this->isEarnTrade ? 'We\'re sorry, you cant trade the ' . $crypto->symbol . ' coin against itself for earns.' : 'You can\'t trade a coin against itself.']);
        }
        $balances = json_decode($user->$columName, true);
        $balance = $balances[$wallet_map[$request->wallet]] ?? 0;

        if ($request->amount < json_decode($tradeSetting->minimum, true)[$wallet_map[$request->wallet]]) {
            return $this->errorResponse(['You can\'t trade less than ' . json_decode($tradeSetting->minimum, true)[$wallet_map[$request->wallet]] . ' ' . $wallet_map[$request->wallet] . ' for this time setting.']);
        }

        if ($request->amount > $balance) {
            if ($this->isPracticeTrade) {
                $message = "You don\'t have sufficient practice balance. Please add practice balance";
            } else {
                $message = "You don\'t have sufficient balance. Please deposit money";
            }
            return $this->errorResponse([$message]);
        }

        $unit = "add" . ucfirst($request->unit);
        $now = Carbon::now();
        $now2 = Carbon::now();
        $now3 = Carbon::now();
        $then = Carbon::parse($now->toString());
        if ($this->isLockupTrade) {
            $time = $now->$unit($request->duration)->startOfMonth();
            $time2 = $now2->$unit($request->duration);
            $time3 = $now3->$unit($request->duration)->startOfMonth();

            $percentageDifference = (($time3->diffInDays($time2)) / $time3->daysInMonth);
            $profit = $profit - ($profit * $percentageDifference);
        } else {
            $time = $now->$unit($request->duration);
        }

        if ($this->isFiatTrade) {
            $coinRate = getFiatCoinRate($crypto->symbol, intval($request->wallet));
        } else {
            $coinRate = getCoinRate($crypto->symbol, intval($request->wallet));
        }

        $tradeLog                     = new $this->modelName();
        $tradeLog->user_id            = $user->id;
        $tradeLog->amount             = $request->amount;
        $tradeLog->in_time            = $time;
        $tradeLog->high_low           = $this->isEarnTrade ? Status::TRADE_HIGH : $request->high_low_type;
        $tradeLog->price_was          = $coinRate;
        $tradeLog->duration           = $time->diffInSeconds($then);
        $tradeLog->wallet             = $request->wallet;
        $tradeLog->isFiat             = $this->isFiatTrade;
        $tradeLog->isEarn             = $this->isEarnTrade;
        $tradeLog->isLeverage         = $this->isLeverageTrade;
        $tradeLog->isLockup            = $this->isLockupTrade;
        $tradeLog->profit             = $profit ?? 5;
        if ($this->isFiatTrade) {
            $tradeLog->fiat           = $crypto->symbol;
        } else {
            $tradeLog->crypto_currency_id = $crypto->id;
        }
        $tradeLog->save();

        $balances[$wallet_map[$request->wallet]] -= $request->amount;
        $user->$columName = json_encode($balances);
        $user->save();

        if (!$this->isPracticeTrade) {
            $highLow = $this->isEarnTrade ? 'High' : ($request->high_low_type == Status::TRADE_HIGH ? 'High' : "Low");
            if ($this->isFiatTrade) {
                $details = 'Fiat Trade to ' . $crypto->name . ' ' . $highLow;
            } else if ($this->isLeverageTrade) {
                $details = 'Leverage Trade to ' . $crypto->name . ' ' . $highLow;
            } else if ($this->isEarnTrade) {
                $details = $request->duration . ' ' . $request->unit . ' Earn Trade to ' . $crypto->name . ' Deposit';
            } else if ($this->isLockupTrade) {
                $details = $request->duration . ' ' . $request->unit . ' Lockup Trade to ' . $crypto->name . ' Deposit';
            } else {
                $details = 'Trade to ' . $crypto->name . ' ' . $highLow;
            }
            $this->createTransaction($tradeLog->amount, $details, '-', $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
        }
        return response()->json([
            'success'     => true,
            'game_log_id' => $tradeLog->id,
            'trade'       => $tradeLog->price_was
        ]);
    }

    public function result($request)
    {
        $validator = Validator::make($request->all(), [
            'game_log_id' => 'required|integer'
        ]);

        if ($validator->fails()) {
            return $this->errorResponse($validator->errors()->all());
        }
        $tradeLog = $this->modelName::where('id', $request->game_log_id)->where('user_id', auth()->id())->where('result', Status::TRADE_PENDING)->where('status', Status::TRADE_RUNNING)->first();

        if (!$tradeLog) {
            return $this->errorResponse(['Trade not found']);
        }

        if ($tradeLog->isEarn) {
            return $this->errorResponse(['Trade not found']);
        }

        if ($tradeLog->isLockup) {
            return $this->errorResponse(['Trade not found']);
        }

        if ($tradeLog->in_time > Carbon::now()->addSeconds(5)) {
            return $this->errorResponse(['Trade not yet finished.']);
        }

        if ($tradeLog->high_low == Status::TRADE_HIGH) {
            return $this->tradeHigh($tradeLog);
        } else if ($tradeLog->high_low == Status::TRADE_LOW) {
            return $this->tradeLow($tradeLog);
        } else {
            return $this->errorResponse(['Trade must be High/Low']);
        }
    }

    public function tradeHigh($tradeLog)
    {
        if ($this->isFiatTrade) {
            $cryptoRate = getFiatCoinRate($tradeLog->fiat ?? 'USD', $tradeLog->wallet);
        } else {
            $cryptoRate = getCoinRate($tradeLog->crypto->symbol, $tradeLog->wallet);
        }
        $tradeLog->price_is = $cryptoRate;
        $tradeLog->save();

        if ($tradeLog->rig == Status::TRADE_RIG_WIN) {
            return $this->tradeWin($tradeLog);
        } else if ($tradeLog->rig == Status::TRADE_RIG_DRAW) {
            return $this->tradeDraw($tradeLog);
        } else if ($tradeLog->rig == Status::TRADE_RIG_LOSE) {
            return $this->tradeLoss($tradeLog);
        } else {
            if ($tradeLog->price_was < $cryptoRate) {
                return $this->tradeWin($tradeLog);
            } else if ($tradeLog->price_was > $cryptoRate) {
                return $this->tradeLoss($tradeLog);
            } else {
                return $this->tradeDraw($tradeLog);
            }
        }
    }

    public function tradeLow($tradeLog)
    {
        if ($this->isFiatTrade) {
            $cryptoRate = getFiatCoinRate($tradeLog->fiat ?? 'USD', $tradeLog->wallet);
        } else {
            $cryptoRate = getCoinRate($tradeLog->crypto->symbol, $tradeLog->wallet);
        }
        $tradeLog->price_is = $cryptoRate;
        $tradeLog->save();

        if ($tradeLog->rig == Status::TRADE_RIG_WIN) {
            return $this->tradeWin($tradeLog);
        } else if ($tradeLog->rig == Status::TRADE_RIG_DRAW) {
            return $this->tradeDraw($tradeLog);
        } else if ($tradeLog->rig == Status::TRADE_RIG_LOSE) {
            return $this->tradeLoss($tradeLog);
        } else {
            if ($tradeLog->price_was > $cryptoRate) {
                return $this->tradeWin($tradeLog);
            } else if ($tradeLog->price_was < $cryptoRate) {
                return $this->tradeLoss($tradeLog);
            } else {
                return $this->tradeDraw($tradeLog);
            }
        }
    }

    public function tradeWin($tradeLog)
    {
        $columName = $this->columnName;
        $user      = auth()->user();
        $gnl       = gs();


        $balances = json_decode($user->$columName, true);
        $wallet_map = [
            1 => 'USDT',
            2 => 'BTC',
            3 => 'ETH',
        ];
        $balances[$wallet_map[$tradeLog->wallet]] += $tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit);
        $user->$columName = json_encode($balances);
        $user->save();

        if (!$this->isPracticeTrade) {
            if ($this->isFiatTrade) {
                $details = "Fiat Trade to " . $tradeLog->fiat . ' ' . "WIN";
            } else {
                $details = "Trade to " . $tradeLog->crypto->name . ' ' . "WIN";
            }
            $this->createTransaction($tradeLog->amount, $details, '+', $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
        }

        $tradeLog->result = Status::TRADE_WIN;
        $tradeLog->status = Status::TRADE_COMPLETED;
        $tradeLog->save();

        return $this->successResponse("Trade Win");
    }
    public function tradeLoss($tradeLog)
    {
        $tradeLog->result = Status::TRADE_LOSE;
        $tradeLog->status = Status::TRADE_COMPLETED;
        $tradeLog->save();

        return $this->successResponse("Trade Lose");
    }
    public function tradeDraw($tradeLog)
    {
        $columName = $this->columnName;
        $user      = auth()->user();

        $balances = json_decode($user->$columName, true);
        $wallet_map = [
            1 => 'USDT',
            2 => 'BTC',
            3 => 'ETH',
        ];
        $balances[$wallet_map[$tradeLog->wallet]] += $tradeLog->amount;
        $user->save();

        if (!$this->isPracticeTrade) {
            if ($this->isFiatTrade) {
                $details = "Fiat Trade to " . $tradeLog->fiat . ' ' . "DRAW";
            } else {
                $details = "Trade to " . $tradeLog->crypto->name . ' ' . "DRAW";
            }
            $this->createTransaction($tradeLog->amount, $details, '+', $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
        }

        $tradeLog->result = Status::TRADE_DRAW;
        $tradeLog->status = Status::TRADE_COMPLETED;
        $tradeLog->save();

        return $this->successResponse("Trade Draw");
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
