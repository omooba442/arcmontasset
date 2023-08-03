@extends($activeTemplate.'layouts.master')
@section('content')
@php $kyc = getContent('kyc_content.content', true); @endphp
<div class="container">
    <div class="row justify-content-center gy-4">
        @if ($user->kv == 0)
        <div class="col-12">
            <div class="alert bg--body mb-0">
                <h4 class="alert-heading text--danger">@lang('KYC Verification Required')</h4>
                <hr>
                <p class="mb-0">
                    {{ __(@$kyc->data_values->unverified_content) }}
                    <a href="{{ route('user.kyc.form') }}" class="text--base fw-bold">@lang('Click Here to Verify')</a>
                </p>
            </div>
        </div>
        @endif
        @if ($user->kv == 2)
        <div class="col-12">
            <div class="alert bg--body mb-0">
                <h4 class="alert-heading text--warning">@lang('KYC Verification Pending')</h4>
                <hr>
                <p class="mb-0">
                    {{ __(@$kyc->data_values->pending_content) }}
                    <a href="{{ route('user.kyc.data') }}" class="text--base fw-bold">@lang('See KYC Data')</a>
                </p>
            </div>
        </div>
        @endif
        <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="dashboard__item">
                <div class="dashboard__thumb"> <i class="las la-dollar-sign"></i> </div>
                <div class="dashboard__content">
                    <h4 class="dashboard__title">{{$general->cur_sym}}{{showAmount($user->balance)}}</h4>
                    <span class="subtitle d-block">@lang('Current Balance')</span>
                    <a href="{{route('user.transactions')}}" class="btn btn--sm btn--base">@lang('View All')</a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="dashboard__item">
                <div class="dashboard__thumb">
                    <i class="las la-wallet"></i>
                </div>
                <div class="dashboard__content">
                    <h4 class="dashboard__title">{{$general->cur_sym}}{{showAmount($widget['deposit_amount'])}}</h4>
                    <span class="subtitle d-block">@lang('Total Deposit')</span>
                    <a href="{{route('user.deposit.history')}}" class="btn btn--sm btn--base">@lang('View All')</a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="dashboard__item">
                <div class="dashboard__thumb">
                    <i class="las la-credit-card"></i>
                </div>
                <div class="dashboard__content">
                    <h4 class="dashboard__title">{{$general->cur_sym}}{{showAmount($widget['withdraw_amount'])}}</h4>
                    <span class="subtitle d-block">@lang('Total Withdraw')</span>
                    <a href="{{route('user.withdraw.history')}}" class="btn btn--sm btn--base">@lang('View All')</a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="dashboard__item">
                <div class="dashboard__thumb">
                    <i class="las la-money-bill"></i>
                </div>
                <div class="dashboard__content">
                    <h4 class="dashboard__title">{{$widget['transaction']}}</h4>
                    <span class="subtitle d-block">@lang('Total Transactions')</span>
                    <a href="{{route('user.transactions')}}" class="btn btn--sm btn--base">@lang('View All')</a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="dashboard__item">
                <div class="dashboard__thumb">
                    <i class="las la-gamepad"></i>
                </div>
                <div class="dashboard__content">
                    <h4 class="dashboard__title">{{$widget['total_trade']}}</h4>
                    <span class="subtitle d-block">@lang('Total Trade')</span>
                    <a href="{{route('user.trade.log')}}" class="btn btn--sm btn--base">@lang('View All')</a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="dashboard__item">
                <div class="dashboard__thumb">
                    <i class="las la-trophy"></i>
                </div>
                <div class="dashboard__content">
                    <h4 class="dashboard__title">{{$widget['trade_win']}}</h4>
                    <span class="subtitle d-block">@lang('Total Wining Trade')</span>
                    <a href="{{route('user.trade.wining.log')}}" class="btn btn--sm btn--base">@lang('View All')</a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="dashboard__item">
                <div class="dashboard__thumb">
                    <i class="las la-slash"></i>
                </div>
                <div class="dashboard__content">
                    <h4 class="dashboard__title">{{$widget['trade_loss']}}</h4>
                    <span class="subtitle d-block">@lang('Total Losing Trade')</span>
                    <a href="{{route('user.trade.losing.log')}}" class="btn btn--sm btn--base">@lang('View All')</a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-sm-6">
            <div class="dashboard__item">
                <div class="dashboard__thumb">
                    <i class="las la-pencil-ruler"></i>
                </div>
                <div class="dashboard__content">
                    <h4 class="dashboard__title">{{$widget['trade_draw']}}</h4>
                    <span class="subtitle d-block">@lang('Total Draw Trade')</span>
                    <a href="{{route('user.trade.draw.log')}}" class="btn btn--sm btn--base">@lang('View All')</a>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="input-group">
                <span class="input-group-text bg--base text-white border-0">@lang('My Referral Link')</span>
                <input type="text" name="key" value="{{ route('home')}}?reference={{ $user->username }}" class="form-control cmn--form--control bg--section referralURL" readonly>
                <span class="input-group-text bg--base cursor-pointer text-white border-0" id="copyBoard">
                    <i class="lar la-copy"></i>
                </span>
            </div>
        </div>
        <div class="col-12">
            <div class="table-responsive">
                <table class="table cmn--table">
                    <thead>
                        <tr>
                            <th>@lang('S.N.')</th>
                            <th>@lang('Crypto')</th>
                            <th>@lang('Amount')</th>
                            <th>@lang('High/Low')</th>
                            <th>@lang('Result')</th>
                            <th>@lang('Status')</th>
                            <th>@lang('Date')</th>
                        </tr>
                    </thead>
                    <tbody>
                    @forelse($tradeLogs as $tradeLog)
                        <tr>
                            <td>{{$loop->iteration}}</td>
                            <td>
                                <div>
                                    <span class="d-block">{{__(@$tradeLog->crypto->symbol)}}</span>
                                    <small>{{__(@$tradeLog->crypto->name)}}</small>
                                </div>
                            </td>
                            <td>{{showAmount($tradeLog->amount)}} {{__($general->cur_text)}}</td>
                            <td> @php echo $tradeLog->highLowBadge;@endphp</td>
                            <td> @php echo $tradeLog->resultStatus;@endphp</td>
                            <td> @php echo $tradeLog->statusBadge; @endphp </td>
                            <td>{{showDateTime($tradeLog->created_at,'d M, Y h:i:s')}}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="100%" class="text-center text-muted">{{ __($emptyMessage) }}</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

@push('style')
<style>
    .copied::after{
        background-color:#<?php echo $general->base_color ?>;
    }
</style>
@endpush


@push('script')
    <script>
        (function($) {
            "use strict";
            $('#copyBoard').click(function() {
                var copyText = document.getElementsByClassName("referralURL");
                copyText = copyText[0];
                copyText.select();
                copyText.setSelectionRange(0, 99999);
                document.execCommand("copy");
                copyText.blur();
                this.classList.add('copied');
                setTimeout(() => this.classList.remove('copied'), 1500);
            });
        })(jQuery);
    </script>
@endpush
