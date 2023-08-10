@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table cmn--table">
                    <thead>
                        <tr>
                            <th>@lang('S.N.')</th>
                            <th>@lang('Crypto Currency')</th>
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
                                <td>{{$loop->index+$tradeLogs->firstItem()}}</td>
                                <td>
                                    <div>
                                        <span class="d-block">{{__(@$tradeLog->crypto->symbol)}}</span>
                                        <small>{{__(@$tradeLog->crypto->name)}}</small>
                                    </div>
                                </td>
                                <td>{{showAmount($tradeLog->amount)}} {{__($general->cur_text)}}</td>
                                <td> @php echo $tradeLog->highLowBadge; @endphp </td>
                                <td> @php echo $tradeLog->resultStatus; @endphp </td>
                                <td> @php echo $tradeLog->statusBadge; @endphp </td>
                                <td>{{showDateTime($tradeLog->created_at)}}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="100%" class="text-center text-muted"> {{ __($emptyMessage) }}</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            @if ($tradeLogs->hasPages())
                {{ paginateLinks($tradeLogs) }}
            @endif
        </div>
    </div>
</div>
@endsection
