@php
    use Illuminate\Support\Str;
    use Carbon\Carbon;
    $wallet_map = [
        1 => 'USDT',
        2 => 'BTC',
        3 => 'ETH',
    ];
@endphp
@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="not_a_container">
        <div class="row gx-2 mob_gy5">
            <div class="col-12">
                <div class="card px-1 py-2 align-middle text-center">
                    <p class="m-0" style="font-size: 20px;">{{ $pageTitle }}</p>
                </div>
                <div class="mt-3 card">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th scope="col">Coin</th>
                                <th scope="col">Locked amount</th>
                                <th scope="col">Completed</th>
                                <th scope="col">Refund</th>
                                <th scope="col">Start Date</th>
                                <th scope="col">End Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($log->count() < 1)
                                <tr>
                                    <td colspan="6">
                                        <center>No data, yet.</center>
                                    </td>
                                </tr>
                            @endif
                            @foreach ($log as $transaction)
                                <tr>
                                    <td>{{ $transaction->crypto->symbol }}</td>
                                    <td>{{ number_format($transaction->amount, 8) }} {{ $wallet_map[$transaction->wallet] }}
                                    </td>
                                    <td>{{ $transaction->status ? 'True' : 'False' }}</td>
                                    <td>{{ $transaction->status ? (number_format(($transaction->rig == 1 || $transaction->result == 1) ? ($transaction->amount + ($transaction->amount * ($transaction->profit / 100))) : $transaction->amount, 8) . ' ' . $wallet_map[$transaction->wallet]) : '-' }}</td>
                                    <td>{{ $transaction->created_at->format('Y/m/d') }}</td>
                                    <td>{{ Carbon::parse($transaction->in_time)->format('Y/m/d') }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    @if ($log->hasPages())
                        <div style="display: flex; justify-content: center;">{{ paginateLinks($log) }}</div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/assets/templates/basic/js/tv.js"></script>
    <script src="/assets/templates/basic/js/easytimer.min.js"></script>
@endpush
