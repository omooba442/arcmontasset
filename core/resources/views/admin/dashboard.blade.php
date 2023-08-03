@extends('admin.layouts.app')

@section('panel')
    @if(@json_decode($general->system_info)->version > systemDetails()['version'])
    <div class="row">
        <div class="col-md-12">
            <div class="card text-white bg-warning mb-3">
                <div class="card-header">
                    <h3 class="card-title"> @lang('New Version Available') <button class="btn btn--dark float-end">@lang('Version') {{json_decode($general->system_info)->version}}</button> </h3>
                </div>
                <div class="card-body">
                    <h5 class="card-title text-dark">@lang('What is the Update ?')</h5>
                    <p><pre  class="f-size--24">{{json_decode($general->system_info)->details}}</pre></p>
                </div>
            </div>
        </div>
    </div>
    @endif
    @if(@json_decode($general->system_info)->message)
    <div class="row">
        @foreach(json_decode($general->system_info)->message as $msg)
            <div class="col-md-12">
                <div class="alert border border--primary" role="alert">
                    <div class="alert__icon bg--primary"><i class="far fa-bell"></i></div>
                    <p class="alert__message">@php echo $msg; @endphp</p>
                    <button type="button" class="close" data-bs-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            </div>
        @endforeach
    </div>
    @endif

    @if ($general->cron_error_message != null)
    <div class="row">
        <div class="col-12">
            <div class="alert alert-warning p-3">
                <p>{{ __($general->cron_error_message) }}</p>
            </div>
        </div>
    </div>
    @endif
    <div class="row gy-4">
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                link="{{route('admin.users.all')}}"
                icon="las la-users f-size--56"
                title="Total Users"
                value="{{$widget['total_users']}}"
                bg="primary"
            />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                link="{{route('admin.users.active')}}"
                icon="las la-user-check f-size--56"
                title="Active Users"
                value="{{$widget['verified_users']}}"
                bg="success"
            />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                link="{{route('admin.users.email.unverified')}}"
                icon="lar la-envelope f-size--56"
                title="Email Unverified Users"
                value="{{$widget['email_unverified_users']}}"
                bg="danger"
            />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                link="{{route('admin.users.mobile.unverified')}}"
                icon="las la-comment-slash f-size--56"
                title="Mobile Unverified Users"
                value="{{$widget['mobile_unverified_users']}}"
                bg="red"
            />
        </div><!-- dashboard-w1 end -->
    </div>
    <div class="row gy-4 mt-2">
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="3"
                link="{{route('admin.trade.log.index')}}"
                icon="las la-gamepad"
                title="Total Trades"
                value="{{getAmount($widget['total_trade']) }}"
                bg="15"
            />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="3"
                link="{{route('admin.trade.log.wining')}}"
                icon="las la-trophy"
                title="Win Trades"
                value="{{getAmount($widget['total_wining_trade']) }}"
                bg="success-2"
            />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="3"
                link="{{ route('admin.trade.log.losing') }}"
                icon="las la-slash"
                title="Loss Trades"
                value="{{getAmount($widget['total_losing_trade']) }}"
                bg="danger-2"
            />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="3"
                link="{{ route('admin.trade.log.draw') }}"
                icon="las la-draw-polygon"
                title="Draw Trades"
                value="{{getAmount($widget['total_draw_trade']) }}"
                bg="3"
            />
        </div>
    </div>

    <div class="row gy-4 mt-2">
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="2"
                link="{{route('admin.deposit.list')}}"
                icon="fas fa-hand-holding-usd"
                icon_style="false"
                title="Total Deposited"
                value="{{ $general->cur_sym }}{{showAmount($deposit['total_deposit_amount'])}}"
                color="success"
            />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="2"
                link="{{route('admin.deposit.pending')}}"
                icon="fas fa-spinner"
                icon_style="false"
                title="Pending Deposits"
                value="{{$deposit['total_deposit_pending']}}"
                color="warning"
            />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="2"
                link="{{route('admin.deposit.rejected')}}"
                icon="fas fa-ban"
                icon_style="false"
                title="Rejected Deposits"
                value="{{$deposit['total_deposit_rejected']}}"
                color="warning"
            />
        </div><!-- dashboard-w1 end -->
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="2"
                link="{{route('admin.deposit.list')}}"
                icon="fas fa-percentage"
                icon_style="false"
                title="Deposited Charge"
                value="{{ $general->cur_sym }}{{showAmount($deposit['total_deposit_charge'])}}"
                color="primary"
            />
        </div><!-- dashboard-w1 end -->
    </div>

    <div class="row gy-4 mt-2">
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="2"
                link="{{route('admin.withdraw.log')}}"
                icon="lar la-credit-card"
                title="Total Withdrawan"
                value="{{ $general->cur_sym }}{{showAmount($withdrawals['total_withdraw_amount'])}}"
                color="success"
            />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="2"
                link="{{route('admin.withdraw.pending')}}"
                icon="las la-sync"
                title="Pending Withdrawals"
                value="{{$withdrawals['total_withdraw_pending']}}"
                color="warning"
            />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="2"
                link="{{route('admin.withdraw.rejected')}}"
                icon="las la-times-circle"
                title="Rejected Withdrawals"
                value="{{$withdrawals['total_withdraw_rejected']}}"
                color="danger"
            />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget
                style="2"
                link="{{route('admin.withdraw.log')}}"
                icon="las la-percent"
                title="Withdrawal Charge"
                value="{{ $general->cur_sym }}{{showAmount($withdrawals['total_withdraw_charge'])}}"
                color="primary"
            />
        </div>
    </div><!-- row end-->

    <div class="row mb-none-30 mt-30">
        <div class="col-xl-6 mb-30">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">@lang('Monthly Deposit & Withdraw Report') (@lang('Last 12 Month'))</h5>
                <div id="apex-bar-chart"> </div>
              </div>
            </div>
          </div>
        <div class="col-xl-6 mb-30">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">@lang('Transactions Report') (@lang('Last 30 Days'))</h5>
                <div id="apex-line"></div>
              </div>
            </div>
        </div>
    </div>

    <div class="row mb-none-30 mt-5">
        <div class="col-xl-4 col-lg-6 mb-30">
            <div class="card overflow-hidden">
                <div class="card-body">
                    <h5 class="card-title">@lang('Login By Browser') (@lang('Last 30 days'))</h5>
                    <canvas id="userBrowserChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6 mb-30">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">@lang('Login By OS') (@lang('Last 30 days'))</h5>
                    <canvas id="userOsChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6 mb-30">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">@lang('Login By Country') (@lang('Last 30 days'))</h5>
                    <canvas id="userCountryChart"></canvas>
                </div>
            </div>
        </div>
    </div>


<div class="modal fade cron-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
aria-hidden="true">
<div class="modal-dialog modal-lg" role="document">
   <div class="modal-content">
       <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">@lang('Cron Job Setting Instruction')</h5>
           <button type="button"  class="close" data-bs-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
           </button>
       </div>

       <div class="modal-body">
           <div class="row">
               <div class="form-group">
                   <p>@lang('To Automate trade result run the')<code> @lang('cron job') </code>@lang('on your server. Set the Cron time as minimum as possible. Once per')<code> @lang('5-15') </code>@lang('minutes is ideal').</p>
               </div>
               <div class="form-group">
                   <label>@lang('Update Pending Trade Log')</label>
                   <div class="input-group ">
                       <input type="text" class="form-control border-0" value="curl -s {{route('cron.index')}}"  readonly>
                       <span class="input-group-text bg--primary copyLink">@lang('COPY')</span>
                   </div>
               </div>
                <div class="form-group">
                    <label>@lang('Update Practice Trade Log')</label>
                    <div class="input-group">
                        <input  type="text" class="form-control border-0" value="curl -s {{route('cron.practice')}}" readonly>
                        <span class="input-group-text bg--primary copyLink" >@lang('COPY')</span>
                    </div>
                </div>
                <div class="form-group">
                    <label>@lang('Update Crypto Price')</label>
                    <div class="input-group ">
                        <input type="text" class="form-control border-0" value="curl -s {{route('cron.crypto.price')}}" readonly>
                        <span class="input-group-text bg--primary copyLink">@lang('COPY')</span>
                    </div>
                </div>
           </div>
       </div>
   </div>
</div>
</div>

@endsection

@push('breadcrumb-plugins')
@if($general->last_cron_run != null)
    <span class="text--info">@lang('Last Cron Run:')<strong>{{diffForHumans($general->last_cron_run)}}</strong></span>
@endif
@endpush


@push('style')
    <style>
        .bg--success-2 {
            background-color: #0d5e31;
        }
        .bg--danger-2 {
            background: #a9271e;
        }
        .copyLink{
            cursor: pointer;
        }
    </style>
@endpush

@push('script')

    <script src="{{asset('assets/admin/js/vendor/apexcharts.min.js')}}"></script>
    <script src="{{asset('assets/admin/js/vendor/chart.js.2.8.0.js')}}"></script>

    <script>
        "use strict";

        @if(Carbon\Carbon::parse($general->last_cron_run)->diffInSeconds()>=900)
        $(window).on('load',function(e){
            $('.cron-modal').modal('show');
        });
        @endif
        var options = {
            series: [{
                name: 'Total Deposit',
                data: [
                  @foreach($months as $month)
                    {{ getAmount(@$depositsMonth->where('months',$month)->first()->depositAmount) }},
                  @endforeach
                ]
            }, {
                name: 'Total Withdraw',
                data: [
                  @foreach($months as $month)
                    {{ getAmount(@$withdrawalMonth->where('months',$month)->first()->withdrawAmount) }},
                  @endforeach
                ]
            }],
            chart: {
                type: 'bar',
                height: 450,
                toolbar: {
                    show: false
                }
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '50%',
                    endingShape: 'rounded'
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                show: true,
                width: 2,
                colors: ['transparent']
            },
            xaxis: {
                categories: @json($months),
            },
            yaxis: {
                title: {
                    text: "{{__($general->cur_sym)}}",
                    style: {
                        color: '#7c97bb'
                    }
                }
            },
            grid: {
                xaxis: {
                    lines: {
                        show: false
                    }
                },
                yaxis: {
                    lines: {
                        show: false
                    }
                },
            },
            fill: {
                opacity: 1
            },
            tooltip: {
                y: {
                    formatter: function (val) {
                        return "{{__($general->cur_sym)}}" + val + " "
                    }
                }
            }
        };
        var chart = new ApexCharts(document.querySelector("#apex-bar-chart"), options);
        chart.render();



        var ctx = document.getElementById('userBrowserChart');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: @json($chart['user_browser_counter']->keys()),
                datasets: [{
                    data: {{ $chart['user_browser_counter']->flatten() }},
                    backgroundColor: [
                        '#ff7675',
                        '#6c5ce7',
                        '#ffa62b',
                        '#ffeaa7',
                        '#D980FA',
                        '#fccbcb',
                        '#45aaf2',
                        '#05dfd7',
                        '#FF00F6',
                        '#1e90ff',
                        '#2ed573',
                        '#eccc68',
                        '#ff5200',
                        '#cd84f1',
                        '#7efff5',
                        '#7158e2',
                        '#fff200',
                        '#ff9ff3',
                        '#08ffc8',
                        '#3742fa',
                        '#1089ff',
                        '#70FF61',
                        '#bf9fee',
                        '#574b90'
                    ],
                    borderColor: [
                        'rgba(231, 80, 90, 0.75)'
                    ],
                    borderWidth: 0,

                }]
            },
            options: {
                aspectRatio: 1,
                responsive: true,
                maintainAspectRatio: true,
                elements: {
                    line: {
                        tension: 0 // disables bezier curves
                    }
                },
                scales: {
                    xAxes: [{
                        display: false
                    }],
                    yAxes: [{
                        display: false
                    }]
                },
                legend: {
                    display: false,
                }
            }
        });



        var ctx = document.getElementById('userOsChart');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: @json($chart['user_os_counter']->keys()),
                datasets: [{
                    data: {{ $chart['user_os_counter']->flatten() }},
                    backgroundColor: [
                        '#ff7675',
                        '#6c5ce7',
                        '#ffa62b',
                        '#ffeaa7',
                        '#D980FA',
                        '#fccbcb',
                        '#45aaf2',
                        '#05dfd7',
                        '#FF00F6',
                        '#1e90ff',
                        '#2ed573',
                        '#eccc68',
                        '#ff5200',
                        '#cd84f1',
                        '#7efff5',
                        '#7158e2',
                        '#fff200',
                        '#ff9ff3',
                        '#08ffc8',
                        '#3742fa',
                        '#1089ff',
                        '#70FF61',
                        '#bf9fee',
                        '#574b90'
                    ],
                    borderColor: [
                        'rgba(0, 0, 0, 0.05)'
                    ],
                    borderWidth: 0,

                }]
            },
            options: {
                aspectRatio: 1,
                responsive: true,
                elements: {
                    line: {
                        tension: 0 // disables bezier curves
                    }
                },
                scales: {
                    xAxes: [{
                        display: false
                    }],
                    yAxes: [{
                        display: false
                    }]
                },
                legend: {
                    display: false,
                }
            },
        });


        // Donut chart
        var ctx = document.getElementById('userCountryChart');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: @json($chart['user_country_counter']->keys()),
                datasets: [{
                    data: {{ $chart['user_country_counter']->flatten() }},
                    backgroundColor: [
                        '#ff7675',
                        '#6c5ce7',
                        '#ffa62b',
                        '#ffeaa7',
                        '#D980FA',
                        '#fccbcb',
                        '#45aaf2',
                        '#05dfd7',
                        '#FF00F6',
                        '#1e90ff',
                        '#2ed573',
                        '#eccc68',
                        '#ff5200',
                        '#cd84f1',
                        '#7efff5',
                        '#7158e2',
                        '#fff200',
                        '#ff9ff3',
                        '#08ffc8',
                        '#3742fa',
                        '#1089ff',
                        '#70FF61',
                        '#bf9fee',
                        '#574b90'
                    ],
                    borderColor: [
                        'rgba(231, 80, 90, 0.75)'
                    ],
                    borderWidth: 0,

                }]
            },
            options: {
                aspectRatio: 1,
                responsive: true,
                elements: {
                    line: {
                        tension: 0 // disables bezier curves
                    }
                },
                scales: {
                    xAxes: [{
                        display: false
                    }],
                    yAxes: [{
                        display: false
                    }]
                },
                legend: {
                    display: false,
                }
            }
        });

        // apex-line chart
        var options = {
        chart: {
            height: 450,
            type: "area",
            toolbar: {
            show: false
            },
            dropShadow: {
            enabled: true,
            enabledSeries: [0],
            top: -2,
            left: 0,
            blur: 10,
            opacity: 0.08
            },
            animations: {
            enabled: true,
            easing: 'linear',
            dynamicAnimation: {
                speed: 1000
            }
            },
        },
        dataLabels: {
            enabled: false
        },
        series: [
            {
            name: "Plus Transactions",
            data: [
                @foreach($trxReport['date'] as $trxDate)
                    {{ @$plusTrx->where('date',$trxDate)->first()->amount ?? 0 }},
                @endforeach
            ]
            },
            {
            name: "Minus Transactions",
            data: [
                    @foreach($trxReport['date'] as $trxDate)
                        {{ @$minusTrx->where('date',$trxDate)->first()->amount ?? 0 }},
                    @endforeach
                ]
            }
        ],
        fill: {
            type: "gradient",
            gradient: {
            shadeIntensity: 1,
            opacityFrom: 0.7,
            opacityTo: 0.9,
            stops: [0, 90, 100]
            }
        },
        xaxis: {
            categories: [
                @foreach($trxReport['date'] as $trxDate)
                    "{{ $trxDate }}",
                @endforeach
            ]
        },
        grid: {
            padding: {
            left: 5,
            right: 5
            },
            xaxis: {
            lines: {
                show: false
            }
            },
            yaxis: {
            lines: {
                show: false
            }
            },
        },
        };

        var chart = new ApexCharts(document.querySelector("#apex-line"), options);

        chart.render();

        $('.copyLink').click(function(){
                var copyText =$(this).siblings('input');
                copyText = copyText[0];
                console.log(copyText);
                copyText.select();
                copyText.setSelectionRange(0, 99999);
                /*For mobile devices*/
                document.execCommand("copy");
                copyText.blur();
                this.classList.add('copied');
                setTimeout(() => this.classList.remove('copied'), 1500);
            });

    </script>
@endpush


