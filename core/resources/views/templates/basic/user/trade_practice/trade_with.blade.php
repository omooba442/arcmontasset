@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="container">
      <div class="row gy-4">
        <div class="col-12">
            <ul class="highlow-time-duration">
                @foreach($tradeSettings as $tradeSetting)
                <li class="highlight">
                    <a href="javascript:void(0)" class="gameTime " data-setting='@json($tradeSetting->only('time','unit'))'>
                        <i class="las la-clock"></i>
                        {{$tradeSetting->time}} {{__($tradeSetting->unit)}}
                    </a>
                </li>
                @endforeach
            </ul>
        </div>
            <div class="col-lg-6">
                <div class="card custom--card">
                    <div clasls="card-body">
                        <div id="graph"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card custom--card">
                    <div class="card-header">
                        <h5 class="card-title">
                            @lang('Current') {{$currency->name}} @lang('Price') : <span id="cryptoPrice"></span> @lang("USD")
                        </h5>
                    </div>
                    <div class="card-body text-center">
                        <span class="trade-user-price"></span>
                        <form id="playGame">
                            <div class="predict-group">
                                <div class="input-group">
                                    <input type="text"  placeholder="@lang('Enter Amount')" class="form-control cmn--form--control numeric-validation"
                                        required name="amount" autofocus>
                                    <span class="input-group-text bg--base text-white border-0">
                                        {{__($general->cur_text)}}
                                    </span>
                                </div>

                                <div class="highlow-predict">
                                    <button class="cmn--btn border-0 btn--success highlowButton" type="submit" name="highlow" value="1">
                                        <i class="las la-arrow-up"></i>@lang('High')
                                    </button>
                                    <button class="cmn--btn border-0 btn--danger highlowButton" type="submit" name="highlow" value="2">
                                        <i class="las la-arrow-down"></i>@lang('Low')
                                    </button>
                                </div>
                                <div class="clock w-100 mt-5 text-center"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('style-lib')
<link rel="stylesheet" href="{{asset($activeTemplateTrue.'/css/flipclock.css')}}">
@endpush

@push('script-lib')
<script src="{{asset($activeTemplateTrue.'js/flipclock.min.js')}}"></script>
<script src="{{asset($activeTemplateTrue.'js/plot/plotly-latest.min.js')}}"></script>
@endpush

@push('script')
<script>
    "use strict";

    var arrayLength = 15;
    var newArray    = [];
    var xArray      = [];
    var timezone;
    var gtime;
    var coinSymbol = "{{$currency->symbol}}";

    for (var i = 0; i < arrayLength; i++) {
        var y;
        var x;
        newArray[i] = y
        xArray[i] = x
    }
    var baseColor = "#{{ $general->base_color }}"
    var trace1 = {
        x: xArray,
        y: newArray,
        showlegend: true,
        line: { color: baseColor },
        visible: true,
        xaxis: 'x1',
        yaxis: 'y1',
    };
    var data = [trace1];
    var layout = {
        xaxis: {
            tickfont: {
                size: 14,
                color: '#fff'
            },
            ticklen: 8,
            tickwidth: 2,
            tickcolor: '#8f2331'
        },
        yaxis: {
            tickfont: {
                size: 14,
                color: '#fff'
            },
            ticklen: 8,
            tickwidth: 2,
            tickcolor: '#8f2331'
        },
        paper_bgcolor: '#141c24',
        plot_bgcolor: '#141c24',
        showlegend: false,
    };
    Plotly.plot('graph', {
        data: data,
        layout: layout
    });
    var inter = setInterval(function () {
        var dateTime = new Date();
        timezone = dateTime.getTimezoneOffset() / 60;
        gtime = dateTime.getHours() + ':' + dateTime.getMinutes() + ':' + dateTime.getSeconds();
        var time = dateTime.getHours() + ':' + dateTime.getMinutes() + ':' + dateTime.getSeconds();
        $.get("{{route('user.crypto.rate')}}", { coinSymbol: coinSymbol }, function (data) {
            $('#cryptoPrice').text(data);
            var y = data;
            var x = time;
            newArray = newArray.concat(y)
            newArray.splice(0, 1)
            xArray = xArray.concat(x)
            xArray.splice(0, 1)
        });

        var data_update = {
            x: [xArray],
            y: [newArray]
        };
        Plotly.update('graph', data_update)
    }, 1000);

    $(document).ready(function () {
        var gameLogId;
        var playTime;
        var playTimeUnit;
        var second;
        var highlowType;
        var coinId = "{{$currency->id}}";
        const highLowArray = [1, 2];
        const userBalance = {{auth()->user()->demo_balance}};

    $(document).on('click', '.gameTime', function () {
        $(".highlight").children().removeClass('active');
        $(this).addClass('active');
        let setting=$(this).data('setting');
        playTime     = setting.time;
        playTimeUnit = setting.unit;
    });

    $(".highlowButton").on('click', function () {
        highlowType = $(this).val();
    })

    $("#playGame").on('submit', function (event) {
       event.preventDefault();
        var amount = $('input[name="amount"]').val();
        var timeCount = secondCount();

        if (!highLowArray.includes(parseInt(highlowType))) {
            notify('error', 'Invalid trade type');
        } else if (userBalance < amount) {
            notify('error', 'You don\'t have sufficient practice balance. Please add practice balance');
        } else if (isNaN(amount) || amount <= 0) {
            notify('error', 'Please insert valid amount')
        } else if (isNaN(timeCount) || timeCount <= 0) {
            notify('error', 'Please select valid time')
        } else {
            $('input[name="amount"]').val("");
            $.ajax({
                headers: { "X-CSRF-TOKEN": "{{ csrf_token() }}", },
                url: "{{ route('user.practice.trade.store') }}",
                method: "POST",
                data: {
                    amount: amount,
                    coin_id: coinId,
                    high_low_type: highlowType,
                    duration: playTime,
                    unit: playTimeUnit
                },
                success: function (response) {
                    if(response.success){
                        gameLogId = response.game_log_id;
                        countDown(timeCount, gameLogId)
                        if (highlowType == 1) {
                            $(".trade-user-price").text("You trade high. price was " + response.trade + " " + "USD");
                            notify('success', 'Trade High');
                        } else {
                            $(".trade-user-price").text("You trade low. price was " + response.trade + " " + "USD");
                            notify('success', 'Trade Low');
                        }
                    }else{
                        notify('error',response.errors);
                    }
                }
            });
        }
    });

    function secondCount() {
        if (playTimeUnit == 'seconds') {
            second = playTime;
            return second;
        } else if (playTimeUnit == 'minutes') {
            second = playTime * 60;
            return second;
        } else if (playTimeUnit == 'hours') {
            second = playTime * 60 * 60;
            return second;
        }
    }

    function countDown(timeCount, gameLogId) {
        var clock = $('.clock').FlipClock({
            defaultClockFace: 'HourlyCounter',
            autoStart: false,
            callbacks: {
                stop: function () {
                    gameResult(gameLogId)
                }
            }
        });
        clock.setTime(timeCount - 1);
        clock.setCountdown(true);
        clock.start();
    }
    function gameResult(gameLogId) {
        $.ajax({
            headers: { "X-CSRF-TOKEN": "{{ csrf_token() }}", },
            url: "{{ route('user.practice.trade.result') }}",
            method: "POST",
            data: { game_log_id: gameLogId },
            success: function (response) {
                if(response.success){
                    notify('success',response.message || '');
                }else{
                    notify('error', response.errors || '')
                }
                setTimeout(function () {
                    location.reload();
                }, 5000);
            }
        });
    }
    $('.numeric-validation').on('input',function(e){
        this.value = this.value.replace (/^\.|[^\d\.]/g, '')
    })
        });
</script>
@endpush
