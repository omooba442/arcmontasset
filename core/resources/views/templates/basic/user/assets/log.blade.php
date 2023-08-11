@php
    use Illuminate\Support\Str;
    use Carbon\Carbon;
@endphp
@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="not_a_container">
        <div class="row gx-2 mob_gy5">
            <div class="col-12">
                <div class="card px-1 py-2 align-middle text-center">
                    <p class="m-0" style="font-size: 20px;">{{$pageTitle}}</p>
                </div>
                <div class="mt-3 card">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Charge</th>
                                <th scope="col">Post Quantity</th>
                                <th scope="col">Type</th>
                                <th scope="col">Details</th>
                                <th scope="col">Remarks</th>
                                <th scope="col">Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($log->count() < 1)
                                <tr>
                                    <td colspan="8">
                                        <center>No data, yet.</center>
                                    </td>
                                </tr>
                            @endif
                            @foreach ($log->get() as $transaction)
                                <tr>
                                    <td>{{ $transaction->trx }}</td>
                                    <td>{{ number_format($transaction->amount, 8) }}</td>
                                    <td>{{ number_format($transaction->charge, 8) }}</td>
                                    <td>{{ number_format($transaction->post_balance, 8) }}</td>
                                    <td>@if($transaction->trx_type == '+') Credit @else Debit @endif</td>
                                    <td>{{ $transaction->details }}</td>
                                    <td>{{ $transaction->remark }}</td>
                                    <td>{{ $transaction->created_at->diffForHumans() }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="card px-1 py-2 align-middle text-center mt-2">
                    <p class="m-0" style="font-size: 16px;">Current Balance: {{$balance}}</p>
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
