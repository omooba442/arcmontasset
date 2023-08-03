@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card custom--card border-0">
                <div class="card-body p-0">
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
                                @forelse($practicesTrades as $practicesTrade)
                                    <tr>
                                        <td>{{$loop->index+$practicesTrades->firstItem()}}</td>
                                        <td>
                                            <div class="text-center">
                                                <span class="d-block">{{__(@$practicesTrade->crypto->symbol)}}</span>
                                                <small>{{__(@$practicesTrade->crypto->name)}}</small>
                                            </div>
                                        </td>
                                        <td>{{showAmount($practicesTrade->amount)}} {{__($general->cur_text)}}</td>
                                        <td> @php echo $practicesTrade->highLowBadge; @endphp </td>
                                        <td> @php echo $practicesTrade->resultStatus; @endphp </td>
                                        <td> @php echo $practicesTrade->statusBadge; @endphp </td>
                                        <td>{{showDateTime($practicesTrade->created_at)}}</td>
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
            @if ($practicesTrades->hasPages())
                {{paginateLinks($practicesTrades) }}
            @endif
        </div>
    </div>
</div>
@endsection
