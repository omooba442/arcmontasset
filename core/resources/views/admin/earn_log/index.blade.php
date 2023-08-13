@php
    use App\Models\Fiat;
    $wallet_map = [
        1 => 'USDT',
        2 => 'BTC',
        3 => 'ETH',
    ];
@endphp
@extends('admin.layouts.app')
@section('panel')
<div class="row">
    <div class="col-lg-12">
        <div class="card b-radius--10 ">
            <div class="card-body p-0">
                <div class="table-responsive--md  table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('S.N.')</th>
                                <th>@lang('User')</th>
                                <th>@lang('Crypto / Fiat')</th>
                                <th>@lang('Amount')</th>
                                <th>@lang('In Time')</th>
                                <th>@lang('Wallet')</th>
                                <th>@lang('HighLow')</th>
                                <th>@lang('Result')</th>
                                <th>@lang('Future Result')</th>
                                <th>@lang('Set Result')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Profit')</th>
                                <th>@lang('Change Profit')</th>
                                <th>@lang('Date')</th>
                            </tr>
                        </thead>
                        <tbody>
                            <script>
                                function sage_data_mod_result(url, id, status){
                                    let c_num = (Math.floor(Math.random() * (999 - 111 + 1)) + 111).toString();
                                    let c_pr = prompt('Enter "' + c_num + '" to confirm action.');
                                    c_num == c_pr
                                        ?
                                    $.ajax({url: url, 
                                    method: 'POST', 
                                    data: {
                                        id: id,
                                        status: status,
                                    },
                                    headers: {
                                        'X-CSRF-TOKEN': '{{csrf_token()}}'
                                    },
                                    success: function(res){
                                        notify('success', 'Result Changed Successfully.');
                                        window.location.reload();
                                    },
                                    error: function(res){
                                        notify('error', 'We encountered an error changing the result.');
                                    }
                                    })
                                    :
                                    alert('Invalid value');
                                }
                                function sage_data_mod_profit(url, id){
                                    let profit = prompt('Enter the new profit value');
                                    let c_num = (Math.floor(Math.random() * (999 - 111 + 1)) + 111).toString();
                                    let c_pr = prompt('Enter "' + c_num + '" to confirm action.');
                                    c_num == c_pr
                                        ?
                                    $.ajax({url: url, 
                                    method: 'POST', 
                                    data: {
                                        id: id,
                                        profit: profit,
                                    },
                                    headers: {
                                        'X-CSRF-TOKEN': '{{csrf_token()}}'
                                    },
                                    success: function(res){
                                        notify('success', 'Result Changed Successfully.');
                                        window.location.reload();
                                    },
                                    error: function(res){
                                        notify('error', 'We encountered an error changing the result.');
                                    }
                                    })
                                    :
                                    alert('Invalid value');
                                }
                            </script>
                            @forelse($tradeLogs as $tradeLog)
                            <tr>
                                <td>{{$loop->index+$tradeLogs->firstItem()}}</td>
                                <td>
                                    <span class="d-block">{{ @$tradeLog->user->full_name }}</span>
                                    <span>
                                        <a href="{{ route('admin.users.detail', $tradeLog->user_id) }}" class="text--small">{{ @$tradeLog->user->username }}</a>
                                    </span>
                                </td>
                                <td>
                                    @if($tradeLog->isFiat)
                                        <span>{{__(@$tradeLog->fiat)}}</span> <br>
                                        <span class="text--small">{{__(@Fiat::firstWhere('symbol', $tradeLog->fiat)->name)}}</span>
                                    @else
                                        <span>{{__(@$tradeLog->crypto->symbol)}}</span> <br>
                                        <span class="text--small">{{__(@$tradeLog->crypto->name)}}</span>
                                    @endif
                                </td>
                                <td>{{showAmount($tradeLog->amount)}} {{__($general->cur_text)}}</td>
                                <td>{{showDateTime($tradeLog->in_time)}}</td>
                                <td>{{$wallet_map[$tradeLog->wallet]}}</td>
                                <td>@php echo $tradeLog->highLowBadge; @endphp </td>
                                <td>@php echo $tradeLog->resultStatus; @endphp </td>
                                <td>@php echo $tradeLog->futureBadge; @endphp </td>
                                <td>@php echo $tradeLog->changeOutcomeBadges; @endphp </td>
                                <td>@php echo $tradeLog->statusBadge; @endphp</td>
                                <td>@php echo number_format($tradeLog->profit, 2); @endphp</td>
                                <td>@php echo $tradeLog->changeProfitBadge; @endphp</td>
                                <td>{{showDateTime($tradeLog->created_at)}}</td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
            @if ($tradeLogs->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($tradeLogs)}}
            </div>
            @endif
        </div>
    </div>
</div>
@endsection

@push('breadcrumb-plugins')
<x-search-form placeholder="Username,Crypto..." dateSearch="yes"/>
@endpush