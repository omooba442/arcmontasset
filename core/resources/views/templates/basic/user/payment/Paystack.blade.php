@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card custom--card">
                <div class="card-header">
                    <h5 class="card-title">@lang('Paystack')</h5>
                </div>
                <div class="card-body">
                    <form action="{{ route('ipn.'.$deposit->gateway->alias) }}" method="POST" class="text-center">
                        @csrf
                        <ul class="list-group text-center list-group-flush mb-3">
                            <li class="list-group-item d-flex justify-content-between bg-transparent text-white b-input">
                                @lang('You have to pay '):
                                <strong>{{showAmount($deposit->final_amo)}} {{__($deposit->method_currency)}}</strong>
                            </li>
                            <li class="list-group-item d-flex justify-content-between bg-transparent text-white b-input">
                                @lang('You will get '):
                                <strong>{{showAmount($deposit->amount)}}  {{__($general->cur_text)}}</strong>
                            </li>
                        </ul>
                        <button type="button" class="cmn--btn btn-block" id="btn-confirm">@lang('Pay Now')</button>
                        <script src="//js.paystack.co/v1/inline.js"
                            data-key="{{ $data->key }}"
                            data-email="{{ $data->email }}"
                            data-amount="{{ round($data->amount) }}"
                            data-currency="{{$data->currency}}"
                            data-ref="{{ $data->ref }}"
                            data-custom-button="btn-confirm">
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
