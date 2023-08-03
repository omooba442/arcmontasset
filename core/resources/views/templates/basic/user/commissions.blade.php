@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="table-responsive">
        <table class="table cmn--table">
            <thead>
                <tr>
                    <th>@lang('S.N.')</th>
                    <th>@lang('User')</th>
                    <th>@lang('TRX')</th>
                    <th>@lang('Amount')</th>
                    <th>@lang('Post Balance')</th>
                    <th>@lang('Detail')</th>
                    <th>@lang('Date')</th>
                </tr>
            </thead>
            <tbody>
                @forelse($commissions as $commission)
                    <tr>
                        <td>{{$loop->index+$commissions->firstItem()}}</td>
                        <td>{{$commission->fromUser->username}}</td>
                        <td>{{$commission->trx }}</td>
                        <td>{{showAmount($commission->amount)}} {{__($general->cur_text)}}</td>
                        <td>{{showAmount($commission->post_balance) }} {{__($general->cur_text)}}</td>
                        <td>{{$commission->details}}</td>
                        <td>{{showDateTime($commission->created_at) }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="100%" class="text-center text-muted">{{ __($emptyMessage) }}</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    @if ($commissions->hasPages())
        {{paginateLinks($commissions)}}
    @endif
</div>
@endsection



