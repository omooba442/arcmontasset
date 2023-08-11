@php
    use Illuminate\Support\Str;
    use Carbon\Carbon;
    $changeFromWalletFunc = 'a' . Str::random(6);
    $changeToWalletFunc = 'b' . Str::random(6);
    $currentFromWallet = 'f' . Str::random(6);
    $currentToWallet = 'g' . Str::random(6);
    $formSubmit = 'j' . Str::random(6);
    $formQuantity = 'k' . Str::random(6);
    $wallet_shortcuts = [
        1 => 'USDT',
        2 => 'BTC',
        3 => 'ETH',
    ];
    
@endphp
@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="not_a_container">
        <div class="row gx-2 mob_gy5">
            <div class="col-lg-9">
                <div class="card trading-view">
                    <div class="tab-content pt-50">
                        <div class="tab-pane fade show active" id="expert">
                            <div class="chart-wrapper">
                                <div class="chart">
                                    <div class="card custom--card h-100">
                                        <div class="not_card-body">
                                            <div class="tradingview-widget-container">
                                                <div id="expert_chart" class="safe"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div>
                    <div class="card px-1 py-2 align-middle text-center">
                        <p class="m-0" style="font-size: 14px;"> <span class="icon_dot mx-2"><i
                                    class="fa fa-solid fa-check"></i></span>From wallet</p>
                    </div>
                    <div class="row gx-2 align-middle text-center mt-1 ">
                        @foreach ($wallet_shortcuts as $id => $wallet)
                            <div onclick="{{ $changeFromWalletFunc }}({{ $id }})" class="col-4">
                                <div class="card wallet_tab @if ($id == 1) active @endif"
                                    id="from_wallt_ref_{{ $wallet }}">{{ $wallet }}</div>
                            </div>
                        @endforeach
                    </div>
                </div>
                <div>
                    <div class="card px-1 py-2 align-middle text-center mt-2">
                        <p class="m-0" style="font-size: 14px;"> <span class="icon_dot mx-2"><i
                                    class="fa fa-solid fa-check"></i></span>To wallet</p>
                    </div>
                    <div class="row gx-2 align-middle text-center mt-1 ">
                        @foreach ($wallet_shortcuts as $id => $wallet)
                            <div onclick="{{ $changeToWalletFunc }}({{ $id }})" class="col-4">
                                <div class="card wallet_tab @if ($id == 2) active @endif"
                                    id="to_wallt_ref_{{ $wallet }}">{{ $wallet }}</div>
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="card px-1 py-2 align-middle text-center mt-2">
                    <p style="font-size: 14px;"> <span class="icon_dot mx-1"><i class="fa fa-solid fa-check"></i></span>
                        Wallet Balance</p>
                    <p id="from_wallt_balance_tx">{{ number_format($balances['USDT'], 8) }} USDT</p>
                    <p id="to_wallt_balance_tx">{{ number_format($balances['BTC'], 8) }} BTC</p>
                </div>
                <div>
                    <div class="card px-1 py-2 align-middle text-center mt-2">
                        <p class="m-0" style="font-size: 14px;"> <span class="icon_dot mx-2"><i
                                    class="fa fa-solid fa-check"></i></span>Exchange details</p>
                    </div>
                    <p class="m-0 mt-1" style="font-size: 14px;">Quantity:</p>
                    <div class="align-middle text-center mt-2 ">
                        <input class="opqty" type="number" step="any" name="{{ $formQuantity }}" id="{{ $formQuantity }}"
                            placeholder="Enter quantity">
                    </div>
                    <div class="mt-2">
                        <p class="m-0 mt-1" style="font-size: 14px;">Swiping:</p>
                    </div>
                    <div class="px-5 mt-2 buy_trx_ctn">
                        <button onclick="{{ $formSubmit }}()" class="buy_trx mb-1 mt-2" style="background-color: green;"
                            type="button">Exchange</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/assets/templates/basic/js/tv.js"></script>
    <script src="/assets/templates/basic/js/easytimer.min.js"></script>
    <script>
        "use strict";
        var tv = new TradingView.widget({
            "width": 980,
            "height": 610,
            "symbol": "USDTBTC",
            "interval": "D",
            "timezone": "Etc/UTC",
            "theme": "dark",
            "style": "1",
            "locale": "en",
            "toolbar_bg": "#f1f3f6",
            "enable_publishing": false,
            "allow_symbol_change": true,
            "overrides": {
                "paneProperties": {
                    "background": "#FF0000",
                },
            },
            "container_id": "expert_chart"
        });
        tv.onChartReady(function() {
            const symbolSearchInput = document.querySelector(".symbol-edit");
            if (symbolSearchInput) {
                symbolSearchInput.setAttribute("disabled", "true");
            }
        });
    </script>
    <script>
        var {{ $currentFromWallet }} = 1;
        var {{ $currentToWallet }} = 2;
        const wallets = [
            'USDT',
            'BTC',
            'ETH',
        ];
        const balances = [
            @foreach ($wallet_shortcuts as $id => $wallet)
                '{{ number_format($balances[$wallet], 8) }}',
            @endforeach
        ];
        const balances_val = [
            @foreach ($wallet_shortcuts as $id => $wallet)
                {{ $balances[$wallet] }},
            @endforeach
        ];

        function {{ $formSubmit }}() {
            if(document.getElementById('{{ $formQuantity }}').value == null){
                notify('error', 'Invalid amount.');
            }else{
                if(balances_val[{{$currentFromWallet}} - 1] >= document.getElementById('{{ $formQuantity }}').value){
                    $.ajax({
                        headers: {
                            "X-CSRF-TOKEN": "{{ csrf_token() }}",
                        },
                        url: "{{ route('user.exchange.achieve') }}",
                        method: "POST",
                        data: {
                            value: document.getElementById('{{ $formQuantity }}').value,
                            from: {{ $currentFromWallet }},
                            to: {{ $currentToWallet }},
                        },
                        success: function(response) {
                            if (response.success) {
                                notify('success', response.message || '');
                            } else {
                                notify('error', response.errors || '')
                            }
                            setTimeout(function() {
                                window.location.reload();
                            }, 1000);
                        }
                    });
                }else{
                    notify('error', 'Your current ' + wallets[{{$currentFromWallet}} - 1] +' balance is not enough for this exchange.')
                }
            }
        }

        function {{ $changeFromWalletFunc }}(change) {
            if (change >= 1 && change <= 3) {
                if (change == {{ $currentToWallet }}) {
                    notify('error', 'You can\'t exchange a coin with itself.');
                    return;
                }
                tv = new TradingView.widget({
                    "width": 980,
                    "height": 610,
                    "symbol": wallets[change - 1] + wallets[{{ $currentToWallet }} - 1],
                    "interval": "D",
                    "timezone": "Etc/UTC",
                    "theme": "dark",
                    "style": "1",
                    "locale": "en",
                    "toolbar_bg": "#f1f3f6",
                    "enable_publishing": false,
                    "allow_symbol_change": true,
                    "overrides": {
                        "paneProperties": {
                            "background": "#FF0000",
                        },
                    },
                    "container_id": "expert_chart"
                });
                document.getElementById('from_wallt_ref_' + wallets[{{ $currentFromWallet }} - 1]).classList.remove(
                    'active');
                document.getElementById('from_wallt_ref_' + wallets[change - 1]).classList.add('active');
                document.getElementById('from_wallt_balance_tx').innerText = balances[change - 1] + ' ' + wallets[
                    change - 1];
                {{ $currentFromWallet }} = change;
                tv.onChartReady(function() {
                    const symbolSearchInput = document.querySelector(".symbol-edit");
                    if (symbolSearchInput) {
                        symbolSearchInput.setAttribute("disabled", "true");
                    }
                });
            }
        }

        function {{ $changeToWalletFunc }}(change) {
            if (change >= 1 && change <= 3) {
                if (change == {{ $currentFromWallet }}) {
                    notify('error', 'You can\'t exchange a coin with itself.');
                    return;
                }
                tv = new TradingView.widget({
                    "width": 980,
                    "height": 610,
                    "symbol": wallets[{{ $currentFromWallet }} - 1] + wallets[change - 1],
                    "interval": "D",
                    "timezone": "Etc/UTC",
                    "theme": "dark",
                    "style": "1",
                    "locale": "en",
                    "toolbar_bg": "#f1f3f6",
                    "enable_publishing": false,
                    "allow_symbol_change": true,
                    "overrides": {
                        "paneProperties": {
                            "background": "#FF0000",
                        },
                    },
                    "container_id": "expert_chart"
                });
                document.getElementById('to_wallt_ref_' + wallets[{{ $currentToWallet }} - 1]).classList.remove('active');
                document.getElementById('to_wallt_ref_' + wallets[change - 1]).classList.add('active');
                document.getElementById('to_wallt_balance_tx').innerText = balances[change - 1] + ' ' + wallets[
                    change - 1];
                {{ $currentToWallet }} = change;
                tv.onChartReady(function() {
                    const symbolSearchInput = document.querySelector(".symbol-edit");
                    if (symbolSearchInput) {
                        symbolSearchInput.setAttribute("disabled", "true");
                    }
                });
            }
        }
    </script>
@endpush
