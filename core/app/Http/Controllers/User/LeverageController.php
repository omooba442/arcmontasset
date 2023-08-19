<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Models\CryptoCurrency;
use App\Http\Controllers\Controller;
use App\Lib\Trade;
use App\Models\TradeLog;
use App\Models\LeverageSetting;
use Illuminate\Support\Facades\Validator;

class LeverageController extends Controller
{
    public function index()
    {
        $pageTitle = "Leverage Trade";
        $cryptos   = CryptoCurrency::active()->orderByRaw('rank = 0, rank ASC');
        $balances  = json_decode(auth()->user()->balance, true);
        $durations = LeverageSetting::oldest()->get();
        $log           = $this->tradeData()->where('status', 0)->paginate($perPage = 15, $columns = ['*'], $pageName = 'page_tr');
        $log2           = $this->tradeData()->where('status', 1)->paginate($perPage = 15, $columns = ['*'], $pageName = 'page_cl');
        $hdata = json_decode(json_encode($this->getHistoricalData(CryptoCurrency::active()->orderByRaw('rank = 0, rank ASC')->first()->symbol, 1)));
        return view($this->activeTemplate . 'user.leverage.index', compact('pageTitle', 'cryptos', 'hdata', 'balances', 'durations', 'log', 'log2'));
    }

    public function store(Request $request)
    {
        $trade = new Trade(isLeverage: true);
        return $trade->store($request);
    }

    public function tradeResult(Request $request)
    {
        $trade = new Trade(isLeverage: true);
        return $trade->result($request);
    }

    protected function tradeData($scope = null)
    {
        if ($scope) {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->where('isLeverage', true)->$scope();
        } else {
            $tradeLogs = TradeLog::where('user_id', auth()->id())->where('isLeverage', true);
        }
        // return $tradeLogs->with("crypto")->latest('id')->paginate(getPaginate());
        return $tradeLogs->with("crypto")->latest('id');
    }

    public function historicalData(Request $request){
        $validator = Validator::make($request->all(), [
            'coin_id'       => 'required|string|exists:crypto_currencies,symbol',
            'wallet'        => 'required|in:1,2,3',
        ]);
        return response()->json($this->getHistoricalData($request->coin_id, $request->wallet));
    }

    protected function getHistoricalData($coin_id, $wallet) : array
    {
        $crypto = CryptoCurrency::where('symbol', $coin_id)->first();
        $data_low = TradeLog::where('crypto_currency_id', $crypto->id)->where('wallet', $wallet)->where('result', "!=", 1)->latest()->limit(5)->get([
            'amount',
            'price_was',
            'result'
        ])->toArray();
        $data_high = TradeLog::where('crypto_currency_id', $crypto->id)->where('wallet', $wallet)->where('result', 1)->latest()->limit(5)->get([
            'amount',
            'price_was',
            'result'
        ])->toArray();
        if (count($data_low) < 5 || count($data_high) < 5) {
            try{
                $rate = getCoinRate($crypto->symbol, $wallet);
            }catch (\Throwable $th){
                // \Illuminate\Support\Facades\Storage::put('chacj_err.txt', $th->getMessage());
                $rate = 0.0;
            }
        } else {
            $rate = 0.0;
        }

        $d_l_c = 5 - count($data_low);
        $d_h_c = 5 - count($data_high);

        if (count($data_low) < 5) {
            for ($i = 0; $i < $d_l_c; $i++) {
                $addition = [
                    'amount' => $wallet == 1 ? mt_rand(10, 100) : ($wallet == 2 ? mt_rand(0.0001, 0.01) : mt_rand(0.5, 3.5)),
                    'price_was' => $this->modifyRate($rate, true, $wallet == 1 ? 2.8 : ($wallet == 2 ? 0.01 : 1.2)),
                    'result' => 0
                ];
                array_splice($data_low, 1, 0, [$addition]);
            }
        }

        if (count($data_high) < 5) {
            for ($i = 0; $i < $d_h_c; $i++) {
                $addition = [
                    'amount' => $wallet == 1 ? mt_rand(10, 100) : ($wallet == 2 ? mt_rand(0.0001, 0.01) : mt_rand(0.5, 3.5)),
                    'price_was' => $this->modifyRate($rate, true),
                    'result' => 1
                ];
                array_splice($data_high, 1, 0, [$addition]);
            }
        }

        return compact('data_high', 'data_low');
        // return response()->json(compact('data_high', 'data_low'));
    }

    protected function modifyRate($rate, $subtract, $percentage = 2.8)
    {
        $percentage = max(0, min(100, $percentage));
        $percentage = mt_rand(0, $percentage) / 100;
        $modificationAmount = $rate * $percentage;
        if ($subtract) {
            return $rate - $modificationAmount;
        } else {
            return $rate + $modificationAmount;
        }
    }
}
