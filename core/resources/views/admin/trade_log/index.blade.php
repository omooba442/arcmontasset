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
                                <th>@lang('Crypto')</th>
                                <th>@lang('Amount')</th>
                                <th>@lang('In Time')</th>
                                <th>@lang('HighLow')</th>
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
                                    <span class="d-block">{{ @$tradeLog->user->full_name }}</span>
                                    <span>
                                        <a href="{{ route('admin.users.detail', $tradeLog->user_id) }}" class="text--small">{{ @$tradeLog->user->username }}</a>
                                    </span>
                                </td>
                                <td>
                                    <span>{{__(@$tradeLog->crypto->symbol)}}</span> <br>
                                    <span class="text--small">{{__(@$tradeLog->crypto->name)}}</span>
                                </td>
                                <td>{{showAmount($tradeLog->amount)}} {{__($general->cur_text)}}</td>
                                <td>{{showDateTime($tradeLog->in_time)}}</td>
                                <td>@php echo $tradeLog->highLowBadge; @endphp </td>
                                <td>@php echo $tradeLog->resultStatus; @endphp </td>
                                <td>@php echo $tradeLog->statusBadge; @endphp</td>
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
