@php
    use Illuminate\Support\Str;
    use Carbon\Carbon;
    use Carbon\CarbonInterval;
    $changeDurationFunc = 'a' . Str::random(6);
    $durations_var = 'b' . Str::random(13);
    $submit = 'c' . Str::random(20);
    $modal = 'd' . Str::random(20);
    $minimums_var = 'e' . Str::random(13);
    $aprs_var = 'f' . Str::random(13);
    $changeWalletFunc = 'g' . Str::random(6);
    $currentPWallet = 'h' . Str::random(6);
    $currentPCoin = 'i' . Str::random(6);
    $idSymbolMapping = 'j' . Str::random(6);
    $formQuantity = 'k' . Str::random(6);
    $proceed = 'l' . Str::random(13);
    $wallet_shortcuts = [
        1 => 'USDT',
        2 => 'BTC',
        3 => 'ETH',
    ];
@endphp
@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="not_a_container p-0">
        <div class="card">
            <div class="row">
                <div class="col-lg-6 pt-5 pb-lg-5 pb-sm-2 px-5">
                    <p class="m-0 pt-3"><b style="font-size: 35px; color: #97a2c0">Furures Earn</b></p>
                    <p style="font-size: 18px;">Simple and secure. Check our supported coins and start earning.</p>
                </div>
                <div class="col-lg-6 d-flex pt-2 pb-lg-2 pb-sm-5" style="justify-content: center; align-items: center">
                    <div class="card w-50 py-2 px-2" style="background-color: #97a2c01a; height: fit-content;"> 
                        <div class="d-flex" style="justify-content: space-between;">
                            <p style="font-size: 14px;">Running Trades:</p>
                            <p style="font-size: 14px;">{{$log}}</p>
                        </div>
                        <div class="asset_item_top mt-2 px-6">
                            <a class="asset_a" href="{{route('user.earn.log')}}">View log</a>
                         </div>       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-5">
        <div class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                    <tr>
                        <th colspan="2">Coin</th>
                        <th>Est. APR %</th>
                        <th colspan="3">Duration (Days)</th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody>
                    @foreach ($cryptos as $crypto)
                        <tr>
                            <td colspan="2">
                                <div class="author-info d-flex align-items-center">
                                    @if (is_null($crypto->image))
                                    @else
                                        <img width="35" height="35" style="border-radius: 100%; margin-right: 10px;"
                                            src="{{ getImage(getFilePath('crypto_currency') . '/' . $crypto->image, getFileSize('crypto_currency')) }}">
                                    @endif
                                    <div class="name">
                                        <span class="d-block"
                                            style="font-size: 14px;"><b>{{ __(@$crypto->symbol) }}</b></span>
                                        <small>{{ __(@$crypto->name) }}</small>
                                    </div>
                                </div>
                            </td>
                            <td><b id="apr_ref_{{ $crypto->id }}" style="font-size: 20px; font-weight: 900;"
                                    class="text-success">- %</b></td>
                            <td colspan="3">
                                <div class="gx-2" style="display: flex; justify-content: space-between;">
                                    <div class="gx-2" style="display: inline-flex;">
                                        @foreach ($durations as $time)
                                            <div onclick="{{ $changeDurationFunc }}('{{ $crypto->id }}', '{{ $time->time }}', '{{ $crypto->symbol }}')"
                                                id="durtime_ref_{{ $crypto->id }}_{{ $time->time }}"
                                                class="ern_duration_tag col">{{ $time->time }}</div>
                                        @endforeach
                                    </div>
                                    <button onclick="{{ $submit }}('{{ $crypto->id }}', '{{ $crypto->symbol }}')"
                                        class="card px-2 py-1"
                                        style="cursor: pointer; justify-content: center; background-color: #97a2c0; color: white;">Subscribe</button>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div id="{{ $modal }}" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered"" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Subscribe</h5>
                </div>
                <div class="modal-body">
                    <div class="card px-1 py-2 align-middle text-center">
                        <p class="m-0" style="font-size: 20px;"><b id="disp_mod_coin">Coin</b></p>
                    </div>
                    <div>
                        <div class="card px-1 py-2 align-middle text-center mt-2">
                            <p class="m-0" style="font-size: 14px;">Transaction wallet</p>
                        </div>
                        <div class="row gx-2 align-middle text-center mt-1 ">
                            @foreach ($wallet_shortcuts as $id => $wallet)
                                <div onclick="{{ $changeWalletFunc }}({{ $id }})" class="col-4">
                                    <div class="card wallet_tab @if ($id == 1) active @endif"
                                        id="wallt_ref_{{ $wallet }}">{{ $wallet }}</div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="card px-1 py-2 align-middle text-center mt-2">
                        <p style="font-size: 14px;">
                            Wallet Balance</p>
                        <p id="wallt_balance_tx">{{ number_format($balances['USDT'], 8) }} USDT</p>
                    </div>
                    <div class="card px-1 py-2 align-middle text-center mt-2">
                        <p style="font-size: 14px;">
                            Minimum Opening Quantity</p>
                        <p id="opqty_r2">-</p>
                    </div>
                    <div class="card px-1 py-2 align-middle text-center mt-2">
                        <p style="font-size: 14px;">
                            Duration</p>
                        <p id="optim_rd">-</p>
                    </div>
                    <div class="card px-1 py-2 align-middle text-center mt-2">
                        <div class="align-middle text-center mt-2 ">
                            <input class="opqty" type="number" step="any" name="{{ $formQuantity }}"
                                id="{{ $formQuantity }}" placeholder="Enter opening quantity">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="{{ $proceed }}()">Save changes</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('style')
    <style>
        table {
            width: 100%;
            table-layout: fixed;
        }

        .tbl-header {
            background-color: transparent;
        }

        .tbl-content {
            overflow-x: auto;
            margin-top: 0px;
            background-color: #181a20;
        }

        th {
            padding: 20px 15px;
            text-align: left;
            font-weight: 500;
            font-size: 12px;
            color: #97a2c0;
        }

        td {
            padding: 15px;
            text-align: left;
            vertical-align: middle;
            font-weight: 300;
            font-size: 12px;
            color: #fff;
            border-bottom: solid 1px rgba(255, 255, 255, 0.1);
        }

        .ern_duration_tag {
            margin: 6px 10px 0px 0px;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
            padding: 8px;
            position: relative;
            border-radius: 4px;
            box-sizing: border-box;
            height: 28px;
            min-width: 49px;
            background-color: rgb(43, 49, 57);
            border: unset;
            cursor: pointer;
        }

        .ern_duration_tag.active {
            background-color: #97a2c0;
        }

        .modal-content,
        .modal-header,
        .modal-body,
        .modal-footer {
            background-color: #1a253b;
        }

        .modal-header,
        .modal-body {
            border-bottom-color: #97a2c0;
        }
    </style>
@endpush
@push('script')
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
    <script>
        var {{ $durations_var }} = new Map([
            @foreach ($cryptos as $crypto)
                ['{{ $crypto->id }}', '0'],
            @endforeach
        ]);

        const {{ $idSymbolMapping }} = {
            @foreach ($cryptos as $crypto)
                '{{ $crypto->symbol }}': '{{ $crypto->id }}',
            @endforeach
        };

        const {{ $minimums_var }} = new Map([
            @foreach ($durations as $time)
                @php
                    $mins = json_decode($time->minimum, true);
                @endphp
                    ['{{ $time->time }}', [{{ $mins['USDT'] }}, {{ $mins['BTC'] }}, {{ $mins['ETH'] }}]],
            @endforeach
        ]);

        const {{ $aprs_var }} = {
            @foreach ($durations as $time)
                @php
                    $profits = json_decode($time->profit, true);
                @endphp
                    '{{ $time->time }}': {
                        @foreach ($profits as $id => $profit)
                            '{{ $id }}': {{ $profit }},
                        @endforeach
                    },
            @endforeach
        };

        var {{ $currentPWallet }} = 1;
        var {{ $currentPCoin }} = 'BTC';

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

        function {{ $changeDurationFunc }}(id, val, symbol) {
            {{ $durations_var }}.get(id) != '0' && document.getElementById('durtime_ref_' + id + '_' +
                {{ $durations_var }}.get(id)).classList.remove('active');
            {{ $durations_var }}.set(id, val);
            document.getElementById('durtime_ref_' + id + '_' + val).classList.add('active');
            document.getElementById('apr_ref_' + id).innerText = {{ $aprs_var }}[val][symbol] + '%';
            {{ $currentPCoin }} = symbol;
            setOpqty();
        }

        function {{ $submit }}(id, symbol) {
            if ({{ $durations_var }}.get(id) == 0) {
                notify('error', 'Please select a duration for the trade.');
                return;
            }
            {{ $currentPCoin }} = symbol;
            document.getElementById('disp_mod_coin').innerText = symbol + ' Earn';
            document.getElementById('optim_rd').innerText = {{ $durations_var }}.get(id) + ' Days';
            setOpqty();
            $('input[name="{{ $formQuantity }}"]').val("");
            $('#{{ $modal }}').modal('show')
        }


        function setOpqty() {
            document.getElementById('opqty_r2').innerText = {{ $minimums_var }}.get({{ $durations_var }}.get(
                {{ $idSymbolMapping }}[{{ $currentPCoin }}]))[{{ $currentPWallet }} -
                1] + ' ' + wallets[{{ $currentPWallet }} - 1];
        }

        function {{ $changeWalletFunc }}(change) {
            if (change >= 1 && change <= 3) {
                document.getElementById('wallt_ref_' + wallets[{{ $currentPWallet }} - 1]).classList.remove('active');
                document.getElementById('wallt_ref_' + wallets[change - 1]).classList.add('active');
                document.getElementById('wallt_balance_tx').innerText = balances[change - 1] + ' ' + wallets[
                    change - 1];
                {{ $currentPWallet }} = change;
                setOpqty();
            }
        }

        function {{ $proceed }}() {
            quantity = document.getElementById('{{ $formQuantity }}').value;
            if (quantity != null) {
                if (quantity >= {{ $minimums_var }}.get({{ $durations_var }}.get(
                        {{ $idSymbolMapping }}[{{ $currentPCoin }}]))[{{ $currentPWallet }} -
                        1]) {
                    $('input[name="{{ $formQuantity }}"]').val("");
                    $.ajax({
                        headers: {
                            "X-CSRF-TOKEN": "{{ csrf_token() }}",
                        },
                        url: "{{ route('user.earn.store') }}",
                        method: "POST",
                        data: {
                            amount: quantity,
                            coin_id: {{ $currentPCoin }},
                            high_low_type: 1,
                            duration: {{ $durations_var }}.get({{ $idSymbolMapping }}[{{ $currentPCoin }}]),
                            unit: 'days',
                            wallet: {{ $currentPWallet }},
                        },
                        success: function(response) {
                            if (response.success) {
                                window.location.reload();
                            } else {
                                notify('error', response.errors)
                            }
                        }
                    });
                } else {
                    notify('error', 'You can\'t trade less than ' + {{ $minimums_var }}.get({{ $durations_var }}.get(
                        {{ $idSymbolMapping }}[{{ $currentPCoin }}]))[{{ $currentPWallet }} -
                        1] + ' ' + wallets[{{ $currentPWallet }} -
                        1] + ' for this time');
                }
            } else {
                notify('error', 'Invalid Opening Quantity.');
            }
        }
    </script>
@endpush
