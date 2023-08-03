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
                    <h5 class="pb-3 text-center border-bottom mb-3">@lang('2FA Verification')</h5>
                    <form action="{{route('user.go2fa.verify')}}" method="POST" class="submit-form">
                        @csrf
                        @include($activeTemplate.'partials.verification_code')
                        <div class="form--group">
                            <button type="submit" class="cmn--btn  btn-block">@lang('Submit')</button>
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
            border: unset;
            padding: 45px;
            border-radius: 10px;
        }

    </style>
@endpush
