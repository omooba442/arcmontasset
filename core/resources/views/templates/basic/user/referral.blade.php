@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="table-responsive">
        <table class="table cmn--table">
            <thead>
                <tr>
                    <th>@lang('S.N.')</th>
                    <th>@lang('Name')</th>
                    <th>@lang('Username')</th>
                    <th>@lang('Date')</th>
                </tr>
            </thead>
            <tbody>
                @forelse($referrals as $referral)
                    <tr>
                        <td>{{$loop->index+$referrals->firstItem()}}</td>
                        <td>{{$referral->fullname}}</td>
                        <td> {{$referral->username}}</td>
                        <td>{{ showDateTime($referral->created_at) }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="100%" class="text-center text-muted">{{ __($emptyMessage) }}</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    @if ($referrals->hasPages())
        {{paginateLinks($referrals) }}
    @endif
</div>
@endsection



