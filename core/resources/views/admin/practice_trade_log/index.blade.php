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
                            @forelse($practiceLogs as $practiceLog)
                            <tr>
                                <td>{{$loop->index+$practiceLogs->firstItem()}}</td>
                                <td>
                                    <span>{{ @$practiceLog->user->full_name }}</span> <br>
                                    <span>
                                        <a class="text--small" href="{{ route('admin.users.detail', $practiceLog->user_id) }}">
                                            {{@$practiceLog->user->username }}
                                        </a>
                                    </span>
                                </td>
                                <td>
                                    <span>{{@$practiceLog->crypto->symbol}}</span> <br>
                                    <span class="text--small">{{@$practiceLog->crypto->name}}</span>
                                </td>
                                <td>
                                    {{showAmount($practiceLog->amount)}} {{__($general->cur_text)}}</td>
                                <td>{{showDateTime($practiceLog->in_time)}}</td>
                                <td>
                                    @if($practiceLog->high_low == 1)
                                    <span class="badge badge--success">@lang('High')</span>
                                    @elseif($practiceLog->high_low == 2)
                                    <span class="badge badge--danger">@lang('Low')</span>
                                    @endif
                                </td>
                                <td>@php echo $practiceLog->resultStatus; @endphp </td>
                                <td>@php echo $practiceLog->statusBadge; @endphp</td>
                                <td>{{showDateTime($practiceLog->created_at)}}</td>
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
            @if ($practiceLogs->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($practiceLogs)}}
            </div>
            @endif
        </div>
    </div>
</div>
@endsection

@push('breadcrumb-plugins')
<x-search-form placeholder="Username,Crypto..." dateSearch="yes" />
@endpush
