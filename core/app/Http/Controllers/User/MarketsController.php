<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\CryptoCurrency;

class MarketsController extends Controller
{
    public function index()
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
        $data = json_decode($response)->data;
        $pageTitle = "Assets";
        $balances  = json_decode(auth()->user()->balance, true);
        return view($this->activeTemplate . 'user.markets.index', compact('pageTitle', 'balances', 'data'));
    }
}
