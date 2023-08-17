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
        $tradeLogs = TradeLog::where('result', Status::TRADE_PENDING)->where('status', Status::TRADE_RUNNING)->where('in_time', '<', Carbon::now())->get();
        $gnl       = gs();

        foreach ($tradeLogs as $tradeLog) {
            $user           = $tradeLog->user;
            $isFiatTrade    = $tradeLog->isFiat;
            $isEarnTrade    = $tradeLog->isEarn;
            $isLockupTrade  = $tradeLog->isLockup;
            $balances       = json_decode($user->balance, true);
            $wallet_map     = [
                1 => 'USDT',
                2 => 'BTC',
                3 => 'ETH',
            ];
            if ($isFiatTrade) {
                $cryptoRate = getFiatCoinRate($tradeLog->fiat ?? 'USD', $tradeLog->wallet);
            } else {
                $cryptoRate = getCoinRate($tradeLog->crypto->symbol, $tradeLog->wallet);
            }
            if (!$cryptoRate || !$user) {
                continue;
            }

            if ($tradeLog->rig == Status::TRADE_RIG_WIN) {
                $tradeAmountWithProfit = $tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit);
                $balances[$wallet_map[$tradeLog->wallet]] += $tradeAmountWithProfit;
                $user->balance = json_encode($balances);
                $user->save();

                if ($isFiatTrade) {
                    $details = "Fiat Trade to " . $tradeLog->fiat . ' ' . "WIN";
                } else {
                    $details = "Trade to " . $tradeLog->crypto->name . ' ' . "WIN";
                }
                $this->transactions($user, $tradeAmountWithProfit, $details, $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
                $tradeLog->result = Status::TRADE_WIN;
            } else if ($tradeLog->rig == Status::TRADE_RIG_DRAW) {
                $tradeLog->result = Status::TRADE_LOSE;
            } else if ($tradeLog->rig == Status::TRADE_RIG_LOSE) {
                $balances[$wallet_map[$tradeLog->wallet]] += $tradeLog->amount;
                $user->balance = json_encode($balances);
                $user->save();

                $tradeLogAmount = $tradeLog->amount;
                if ($isFiatTrade) {
                    $details = "Fiat Trade to " . $tradeLog->fiat . ' ' . "Refund";
                } else {
                    $details = "Trade to " . $tradeLog->crypto->name . ' ' . "Refund";
                }
                $this->transactions($user, $tradeLogAmount, $details, $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
                $tradeLog->result = Status::TRADE_DRAW;
            } else {
                if ($tradeLog->high_low == Status::TRADE_HIGH) {
                    if ($tradeLog->price_was < $cryptoRate) {
                        $tradeAmountWithProfit = $tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit);
                        $balances[$wallet_map[$tradeLog->wallet]] += $tradeAmountWithProfit;
                        $user->balance = json_encode($balances);
                        $user->save();

                        if ($isFiatTrade) {
                            $details = "Fiat Trade to " . $tradeLog->fiat . ' ' . "WIN";
                        } else if ($isEarnTrade) {
                            $details = "Earn Trade to " . $tradeLog->crypto->name . ' ' . "Reward";
                        } else if ($isLockupTrade) {
                            $details = "Lockup Trade to " . $tradeLog->crypto->name . ' ' . "Reward";
                        } else {
                            $details = "Trade to " . $tradeLog->crypto->name . ' ' . "WIN";
                        }
                        $this->transactions($user, $tradeAmountWithProfit, $details, $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
                        $tradeLog->result = Status::TRADE_WIN;
                    } else if ($tradeLog->price_was > $cryptoRate) {
                        $tradeLog->result = Status::TRADE_LOSE;
                        if ($isEarnTrade || $isLockupTrade) {
                            $balances[$wallet_map[$tradeLog->wallet]] += $tradeLog->amount;
                            $user->balance = json_encode($balances);
                            $user->save();
                            $details = $isEarnTrade? "Earn" : "Lockup" ." Trade to " . $tradeLog->crypto->name . ' ' . "Refund";
                            $this->transactions($user, $tradeLog->amount, $details, $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
                        }
                    } else {
                        $balances[$wallet_map[$tradeLog->wallet]] += $tradeLog->amount;
                        $user->balance = json_encode($balances);
                        $user->save();

                        $tradeLogAmount = $tradeLog->amount;
                        if ($isFiatTrade) {
                            $details = "Fiat Trade to " . $tradeLog->fiat . ' ' . "Refund";
                        } else if ($isEarnTrade) {
                            $details = "Earn Trade to " . $tradeLog->crypto->name . ' ' . "Refund";
                        } else if ($isLockupTrade) {
                            $details = "Lockup Trade to " . $tradeLog->crypto->name . ' ' . "Refund";
                        } else {
                            $details = "Trade to " . $tradeLog->crypto->name . ' ' . "Refund";
                        }
                        $this->transactions($user, $tradeLogAmount, $details, $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
                        $tradeLog->result = Status::TRADE_DRAW;
                    }
                } elseif ($tradeLog->high_low == Status::TRADE_LOW) {
                    if ($tradeLog->price_was > $cryptoRate) {
                        $tradeAmountWithProfit = $tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit);
                        $balances[$wallet_map[$tradeLog->wallet]] += $tradeAmountWithProfit;
                        $user->balance = json_encode($balances);
                        $user->save();
                        if ($isFiatTrade) {
                            $details = "Fiat Trade to " . $tradeLog->fiat . ' ' . "WIN";
                        } else {
                            $details = "Trade to " . $tradeLog->crypto->name . ' ' . "WIN";
                        }
                        $this->transactions($user, $tradeAmountWithProfit, $details, $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
                        $tradeLog->result = Status::TRADE_WIN;
                    } else if ($tradeLog->price_was < $cryptoRate) {
                        $tradeLog->result = Status::TRADE_LOSE;
                    } else {
                        $balances[$wallet_map[$tradeLog->wallet]] += $tradeLog->amount;
                        $user->balance = json_encode($balances);
                        $user->save();;

                        $tradeLogAmount = $tradeLog->amount;
                        if ($isFiatTrade) {
                            $details = "Fiat Trade to " . $tradeLog->fiat . ' ' . "Refund";
                        } else {
                            $details = "Trade to " . $tradeLog->crypto->name . ' ' . "Refund";
                        }
                        $this->transactions($user, $tradeLogAmount, $details, $balances[$wallet_map[$tradeLog->wallet]], $wallet_map[$tradeLog->wallet]);
                        $tradeLog->result = Status::TRADE_DRAW;
                    }
                }
            }

            $tradeLog->status = Status::TRADE_COMPLETED;
            $tradeLog->price_is = $cryptoRate;
            $tradeLog->save();
        }
        $gnl->last_cron_run = Carbon::now();
        $gnl->save();
        echo "EXECUTED";
    }

    public function transactions($user, $gameLogAmount, $details, $balance, $wallet)
    {
        $transaction               = new Transaction();
        $transaction->user_id      = $user->id;
        $transaction->amount       = $gameLogAmount;
        $transaction->post_balance = $balance;
        $transaction->trx_type     = "+";
        $transaction->details      = $details;
        $transaction->wallet      = $wallet;
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
        // $tradeLogs = PracticeLog::where('result', Status::TRADE_PENDING)->where('in_time', '<', Carbon::now())->where('status', Status::TRADE_RUNNING)->get();
        // $gnl       = gs();

        // foreach ($tradeLogs as $tradeLog) {
        //     $cryptoRate = getCoinRate($tradeLog->crypto->symbol, 1);
        //     $user       = $tradeLog->user;

        //     if (!$cryptoRate || !$user) {
        //         continue;
        //     }
        //     if ($tradeLog->high_low == Status::TRADE_HIGH) {
        //         if ($tradeLog->price_was < $cryptoRate) {
        //             $user->demo_balance += $tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit);
        //             $user->save();
        //             $tradeLog->result = Status::TRADE_WIN;
        //         } else if ($tradeLog->price_was > $cryptoRate) {
        //             $tradeLog->result = Status::TRADE_LOSE;
        //         } else {
        //             $user->demo_balance += $tradeLog->amount;
        //             $user->save();

        //             $tradeLog->result = Status::TRADE_DRAW;
        //         }
        //     } elseif ($tradeLog->high_low == Status::TRADE_LOW) {
        //         if ($tradeLog->price_was > $cryptoRate) {
        //             $user->demo_balance += $tradeLog->amount + (($tradeLog->amount / 100) * $tradeLog->profit);
        //             $user->save();
        //             $tradeLog->result = Status::TRADE_WIN;
        //         } else if ($tradeLog->price_was < $cryptoRate) {
        //             $tradeLog->result = Status::TRADE_LOSE;
        //         } else {
        //             $user->demo_balance += $tradeLog->amount;
        //             $user->save();

        //             $tradeLog->result = Status::TRADE_DRAW;
        //         }
        //     }
        //     $tradeLog->status = Status::TRADE_COMPLETED;
        //     $tradeLog->save();
        // }
        // $gnl->last_cron_run = Carbon::now();
        // $gnl->save();
        echo "EXECUTED";
    }
}
