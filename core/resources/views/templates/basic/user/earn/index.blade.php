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
@endphp
@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="not_a_container p-0">
        <div class="card py-5 px-5">
            <p class="m-0"><b style="font-size: 35px;">Furures Earn</b></p>
            <p style="font-size: 18px;">Simple and secure. Check our supported coins ans start earning.</p>
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
                            <td><b id="apr_ref_{{$crypto->id}}" style="font-size: 20px; font-weight: 900;" class="text-success">- %</b></td>
                            <td colspan="3">
                                <div class="gx-2" style="display: flex; justify-content: space-between;">
                                    <div class="gx-2" style="display: inline-flex;">
                                        @foreach ($durations as $time)
                                            <div onclick="{{$changeDurationFunc}}('{{$crypto->id}}', '{{$time->time}}', '{{$crypto->symbol}}')" id="durtime_ref_{{$crypto->id}}_{{$time->time}}" class="ern_duration_tag col">{{ $time->time }}</div>
                                        @endforeach
                                    </div>
                                    <button onclick="{{$submit}}('{{$crypto->id}}')" class="card px-2 py-1"
                                        style="cursor: pointer; justify-content: center; background-color: #97a2c0; color: white;">Subscribe</button>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
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
    </style>
@endpush
@push('script')
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/assets/templates/basic/js/tv.js"></script>
    <script>
        var {{$durations_var}} = new Map([
            @foreach ($cryptos as $crypto)
                ['{{$crypto->id}}', '0'],
            @endforeach
        ]);

        const {{$minimums_var}} = new Map([
            @foreach ($durations as $time)
                @php
                    $mins = json_decode($time->minimum, true)
                @endphp
                ['{{$time->time}}', [{{$mins['USDT']}}, {{$mins['BTC']}}, {{$mins['ETH']}}]],
            @endforeach
        ]);

        const {{$aprs_var}} = {
            @foreach ($durations as $time)
                @php
                    $profits = json_decode($time->profit, true)
                @endphp
                '{{$time->time}}': {
                    @foreach ($profits as $id => $profit)
                        '{{$id}}' : {{$profit}},
                    @endforeach
                },
            @endforeach
        };

        function {{$changeDurationFunc}}(id, val, symbol){
            {{$durations_var}}.get(id) != '0' && document.getElementById('durtime_ref_' + id + '_'+ {{$durations_var}}.get(id)).classList.remove('active');
            {{$durations_var}}.set(id, val);
            document.getElementById('durtime_ref_' + id + '_'+ val).classList.add('active');
            document.getElementById('apr_ref_' + id).innerText = {{$aprs_var}}[val][symbol] + '%';
        }

        function {{$submit}}(id){
            if({{$durations_var}}.get(id) == 0){
                notify('error', 'Please select a duration for the trade.');
                return;
            }
            $('#{{$modal}}').modal(options)
        }
    </script>
@endpush
