@extends($activeTemplate.'layouts.sage')
@section('content')
<div class="container" style="height: calc(100vh - 35px);">
    <div class="row justify-content-center gy-4 vertical-center">
        <div class="col-12">
            <div class="show-filter text-end">
                <button type="button" class="cmn--btn btn-block showFilterBtn btn-sm">
                    <i class="las la-filter"></i>@lang('Filter')
                </button>
            </div>
            <div class="card responsive-filter-card custom--card border-0">
                <div class="card-body">
                    <form action="">
                        <div class="d-flex flex-wrap gap-4">
                            <div class="flex-grow-1">
                                <label>@lang('Transaction Number')</label>
                                <input type="text" name="search" value="{{ request()->search }}" class="form-control cmn--form--control">
                            </div>
                            <div class="flex-grow-1">
                                <label>@lang('Type')</label>
                                <select name="trx_type" class="form-control cmn--form--control">
                                    <option value="">@lang('All')</option>
                                    <option value="+" @selected(request()->trx_type == '+')>@lang('Credit')</option>
                                    <option value="-" @selected(request()->trx_type == '-')>@lang('Debit')</option>
                                </select>
                            </div>
                            <div class="flex-grow-1">
                                <label>@lang('Remark')</label>
                                <select class="form-control cmn--form--control" name="remark">
                                    <option value="">@lang('Any')</option>
                                    @foreach($remarks as $remark)
                                    <option value="{{ $remark->remark }}" @selected(request()->remark == $remark->remark)>{{ __(keyToTitle($remark->remark)) }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="align-self-end">
                                <button class="cmn--btn btn-block h-100" style="border-radius: 8px; color: white;border: 0;padding: 7px 12px;"><i class="las la-filter"></i>
                                    @lang('Filter')
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="table-responsive">
                <table class="table cmn--table">
                    <thead>
                        <tr>
                            <th>@lang('Trx')</th>
                            <th>@lang('Transacted')</th>
                            <th>@lang('Amount')</th>
                            <th>@lang('Post Balance')</th>
                            <th>@lang('Detail')</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($transactions as $trx)
                        <tr>
                            <td> <strong>{{ $trx->trx }}</strong> </td>
                            <td> {{ showDateTime($trx->created_at) }}<br>{{ diffForHumans($trx->created_at) }}</td>
                            <td class="budget">
                                <span class="fw-bold @if($trx->trx_type == '+')text--success @else text--danger @endif">
                                    {{ $trx->trx_type }} {{showAmount($trx->amount)}} {{ $trx->wallet }}
                                </span>
                            </td>
                            <td class="budget"> {{ showAmount($trx->post_balance) }} {{ __($trx->wallet) }} </td>
                            <td>{{ __($trx->details) }}</td>
                        </tr>
                        @empty
                        <tr>
                            <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            @if($transactions->hasPages())
                {{ $transactions->links() }}
            @endif
        </div>
    </div>
</div>
@endsection
@push('style')
<style>
.cmn--btn{
    padding: 17px 30px;
}
</style>
@endpush

@push('script')
    <script>
        "use strict";
        (function ($) {
            $('.showFilterBtn').on('click',function(){
                $('.responsive-filter-card').slideToggle();
            });
        })(jQuery);
    </script>
@endpush
