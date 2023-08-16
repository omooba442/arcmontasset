<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Support\Facades\Validator;

class AssetsController extends Controller
{
    public function index()
    {
        $gs      = gs();
        $url     = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest';
        $parameters = [
            'symbol' => 'USDT,BTC,ETH',
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
        $data = json_decode($response)->data;
        $pageTitle = "Assets";
        $balances  = json_decode(auth()->user()->balance, true);
        return view($this->activeTemplate . 'user.assets.index', compact('pageTitle', 'balances', 'data'));
    }

    public function log(Request $request, String $wallet)
    {
        $pageTitle = $wallet." log";
        $user = auth()->user();
        $balance = strval(number_format(json_decode($user->balance, true)[$wallet], 8)) . ' ' . $wallet;
        $log = Transaction::where('user_id', $user->id)->latest()->where('wallet', $wallet)->paginate(20);
        return view($this->activeTemplate . 'user.assets.log', compact('pageTitle', 'log', 'balance'));
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
