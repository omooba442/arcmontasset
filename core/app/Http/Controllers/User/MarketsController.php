<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\CryptoCurrency;

class MarketsController extends Controller
{
    public function index()
    {
        try {
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
            $dataArray = json_decode(json_encode($data), true);

            // Sorting by Top Gaining
            $topGainingData = $dataArray;
            foreach ($topGainingData as $key => &$coinData) {
                $coinData['percentageChange'] = ($coinData['quote']['USD']['percent_change_24h'] ?? 0);
                $coinData['key'] = $key; // Store the key for later reference
            }
            unset($coinData); // Clear the reference

            usort($topGainingData, function ($a, $b) {
                return $b['percentageChange'] - $a['percentageChange'];
            });
            $topGainingData = array_slice($topGainingData, 0, 3);

            // Sorting by Top Volume
            $topVolumeData = $dataArray;
            usort($topVolumeData, function ($a, $b) {
                return ($b['quote']['USD']['volume_24h'] ?? 0) - ($a['quote']['USD']['volume_24h'] ?? 0);
            });
            $topVolumeData = array_slice($topVolumeData, 0, 3);

            // Sorting by Market Cap (Highlight)
            $highlightedData = $dataArray;
            usort($highlightedData, function ($a, $b) {
                return ($b['quote']['USD']['market_cap'] ?? 0) - ($a['quote']['USD']['market_cap'] ?? 0);
            });
            foreach ($highlightedData as $key => &$coinData) {
                $coinData['isHighlighted'] = ($key < 10); // Highlight the top 10 coins
                $coinData['key'] = $key; // Store the key for later reference
            }
            unset($coinData);
            $highlightedData = array_slice($highlightedData, 0, 3);

            // Sorting by New Listing (New)
            $newListings = [];
            foreach (CryptoCurrency::active()->latest()->limit(3)->pluck('symbol') as $symbol) {
                if (isset($data->$symbol)) {
                    $newListings[] = $data->$symbol;
                }
            }

            $pageTitle = "Markets";
            $balances  = json_decode(auth()->user()->balance, true);
            return view($this->activeTemplate . 'user.markets.index', compact('pageTitle', 'balances', 'data', 'topGainingData', 'topVolumeData', 'highlightedData', 'newListings'));
        } catch (\Throwable $th) {
            $notify[] = ['success', 'We encounterd an error fetching market data.'];
            return to_route('user.trade.index')->withNotify($notify);
        }
    }
}
