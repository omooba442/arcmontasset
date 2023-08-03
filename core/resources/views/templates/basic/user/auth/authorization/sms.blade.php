@extends($activeTemplate .'layouts.app')
@section('panel')
<div class="account-section pt-120 pb-120">
    <div class="container">
        <div class="d-flex justify-content-center">
            <div class="verification-code-wrapper bg--section">
                <div class="verification-area">
                    <div class="account-logo">
                        <a href="{{route('home')}}">
                            <img src="{{getImage(getFilePath('logoIcon') .'/logo.png')}}">
                        </a>
                    </div>
                    <h5 class="pb-3 text-center border-bottom mb-3">@lang('Verify Mobile Number')</h5>
                    <form action="{{route('user.verify.mobile')}}" method="POST" class="submit-form">
                        @csrf
                        <p class="verification-text">@lang('A 6 digit verification code sent to your mobile number') :  +{{ showMobileNumber(auth()->user()->mobile) }}</p>
                        @include($activeTemplate.'partials.verification_code')
                        <div class="mb-3">
                            <button type="submit" class="cmn--btn btn-block">@lang('Submit')</button>
                        </div>
                        <div class="form-group">
                            <p>
                                @lang('If you don\'t get any code'), <a href="{{route('user.send.verify.code', 'phone')}}" class="forget-pass text--base"> @lang('Try again')</a>
                            </p>
                            @if($errors->has('resend'))
                              
                                <small class="text-danger">{{ $errors->first('resend') }}</small>
                            @endif
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


@push('style')
    <style>
        .verification-code input{
            color: #ffffff !important;
        }
        .verification-code-wrapper{
            width: unset;
            border: unset;
            max-width: 550px;
            padding: 45px;
            border-radius: 10px;
        }
        .verification-code input {
            letter-spacing: 60px !important;
            padding-left: 35px !important;
        }

    </style>
@endpush
