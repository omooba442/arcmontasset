<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\TradeLog;
use App\Constants\Status;
use App\Models\PracticeLog;
use App\Models\Transaction;
use App\Models\CryptoCurrency;

class CronController extends Controller
{
    public function index()
    {
        $tradeLogs = TradeLog::where('result', Status::TRADE_PENDING)->where('status', Status::TRADE_RUNNING)->where('in_time','<',Carbon::now())->get();
        $gnl       = gs();

        foreach ($tradeLogs as $tradeLog) {
            $cryptoRate = getCoinRate($tradeLog->crypto->symbol);
            $user       = $tradeLog->user;
            if (!$cryptoRate || !$user) {
                continue;
            }

            if ($tradeLog->high_low == Status::TRADE_HIGH) {
                if ($tradeLog->price_was < $cryptoRate) {
                    $tradeAmountWithProfit = $tradeLog->amount + (($tradeLog->amount / 100) * $gnl->profit);
                    $user->balance += $tradeAmountWithProfit;
                    $user->save();

                    $details        = 'Trade ' . $tradeLog->crypto->name . ' ' . "WIN";
                    $this->transactions($user, $tradeAmountWithProfit, $details);
                    $tradeLog->result = Status::TRADE_WIN;
                } else if ($tradeLog->price_was > $cryptoRate) {
                    $tradeLog->result = Status::TRADE_LOSE;
                } else {
                    $user->balance += $tradeLog->amount;
                    $user->save();

                    $tradeLogAmount = $tradeLog->amount;
                    $details        = 'Trade ' . $tradeLog->crypto->name . ' ' .  "Refund";
                    $this->transactions($user, $tradeLogAmount, $details);
                    $tradeLog->result = Status::TRADE_DRAW;
                }
            } elseif ($tradeLog->high_low == Status::TRADE_LOW) {
                if ($tradeLog->price_was > $cryptoRate) {
                    $tradeAmountWithProfit  = $tradeLog->amount + (($tradeLog->amount / 100) * $gnl->profit);
                    $user->balance         += $tradeAmountWithProfit;
                    $user->save();

                    $details = 'Trade ' . $tradeLog->crypto->name . ' ' . "WIN";
                    $this->transactions($user, $tradeAmountWithProfit, $details);
                    $tradeLog->result = Status::TRADE_WIN;

                } else if ($tradeLog->price_was < $cryptoRate) {
                    $tradeLog->result = Status::TRADE_LOSE;
                } else {
                    $user->balance += $tradeLog->amount;
                    $user->save();

                    $tradeLogAmount = $tradeLog->amount;
                    $details        = 'Trade ' . $tradeLog->crypto->name . ' ' .  "Refund";
                    $this->transactions($user, $tradeLogAmount, $details);
                    $tradeLog->result = Status::TRADE_DRAW;
                }
            }
            $tradeLog->status = Status::TRADE_COMPLETED;
            $tradeLog->save();
        }
        $gnl->last_cron_run = Carbon::now();
        $gnl->save();
        echo "EXECUTED";
    }

    public function transactions($user, $gameLogAmount, $details)
    {
        $transaction               = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $gameLogAmount;
        $transaction->post_balance = $user->balance;
        $transaction->trx_type     = "+";
        $transaction->details      = $details;
        $transaction->trx          = getTrx();
        $transaction->save();
    }

    public function cryptoPrice()
    {
        $gs      = gs();
        $url     = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest';
        $currencies = CryptoCurrency::active()->get();
        $parameters = [
            'symbol' => $currencies->implode('symbol', ','),
        ];
        $headers = [
            'Accepts: application/json',
            'X-CMC_PRO_API_KEY: ' . @$gs->coinmarketcap_api_key
        ];
        $qs      = http_build_query($parameters);
        $request = "{$url}?{$qs}";
        $curl    = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL            => $request,
            CURLOPT_HTTPHEADER     => $headers,
            CURLOPT_RETURNTRANSFER => 1
        ));

        $response = curl_exec($curl);
        curl_close($curl);
        $data = json_decode($response);

        if (!@$data->data) {
            $gs->cron_error_message = @$data->status->error_message;
            $gs->save();
            echo @$data->status->error_message;
            exit;
        } else {
            $gs->cron_error_message = null;
            $gs->last_cron_run      = Carbon::now();
            $gs->save();
        }
        $rates      = $data->data;
        foreach ($currencies as $currency) {
            $curSym = $currency->symbol;
            $rate = @$rates->$curSym;
            if (!$rate) {
                continue;
            }
            $currency->price              = @$rate->quote->USD->price;
            $currency->one_hour           = @$rate->quote->USD->percent_change_1h;
            $currency->twenty_four        = @$rate->quote->USD->percent_change_24h;
            $currency->seven_day          = @$rate->quote->USD->percent_change_7d;
            $currency->market_cap         = @$rate->quote->USD->market_cap;
            $currency->volume_24h         = @$rate->quote->USD->volume_24h;
            $currency->rank               = @$rate->cmc_rank;
            $currency->circulating_supply = @$rate->circulating_supply ?? 0;
            $currency->save();
        }
        echo "EXECUTED";
    }

    public function practiceCron()
    {
        $tradeLogs = PracticeLog::where('result', Status::TRADE_PENDING)->where('in_time', '<', Carbon::now())->where('status', Status::TRADE_RUNNING)->get();
        $gnl       = gs();

        foreach ($tradeLogs as $tradeLog) {
            $cryptoRate = getCoinRate($tradeLog->crypto->symbol);
            $user       = $tradeLog->user;

            if (!$cryptoRate || !$user) {
                continue;
            }
            if ($tradeLog->high_low == Status::TRADE_HIGH) {
                if ($tradeLog->price_was < $cryptoRate) {
                    $user->demo_balance += $tradeLog->amount + (($tradeLog->amount / 100) * $gnl->profit);
                    $user->save();
                    $tradeLog->result = Status::TRADE_WIN;
                } else if ($tradeLog->price_was > $cryptoRate) {
                    $tradeLog->result = Status::TRADE_LOSE;
                } else {
                    $user->demo_balance += $tradeLog->amount;
                    $user->save();

                    $tradeLog->result = Status::TRADE_DRAW;
                }
            } elseif ($tradeLog->high_low == Status::TRADE_LOW) {
                if ($tradeLog->price_was > $cryptoRate) {
                    $user->demo_balance += $tradeLog->amount + (($tradeLog->amount / 100) * $gnl->profit);
                    $user->save();
                    $tradeLog->result = Status::TRADE_WIN;
                } else if ($tradeLog->price_was < $cryptoRate) {
                    $tradeLog->result = Status::TRADE_LOSE;
                } else {
                    $user->demo_balance += $tradeLog->amount;
                    $user->save();

                    $tradeLog->result = Status::TRADE_DRAW;
                }
            }
            $tradeLog->status = Status::TRADE_COMPLETED;
            $tradeLog->save();
        }
        $gnl->last_cron_run = Carbon::now();
        $gnl->save();
        echo "EXECUTED";
    }
}
