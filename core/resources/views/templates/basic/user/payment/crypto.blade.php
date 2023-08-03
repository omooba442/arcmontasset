@extends($activeTemplate.'layouts.master')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card custom--card">
                    <div class="card-header">
                        <h4 class="card-title">@lang('Payment Preview')</h4>
                    </div>
                    <div class="card-body card-body-deposit text-center">
                        <h6 class="my-2"> @lang('PLEASE SEND EXACTLY') <span class="text--success"> {{ $data->amount }}</span> {{__($data->currency)}}</h6>
                        <h6 class="mb-2">@lang('TO') <span class="text--success"> {{ $data->sendto }}</span></h6>
                        <img src="{{$data->img}}" alt="@lang('Image')">
                        <h6 class="text-white bold my-4">@lang('SCAN TO SEND')</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
