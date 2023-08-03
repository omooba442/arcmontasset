@extends($activeTemplate.'layouts.app')
@section('panel')
<div class="account-section pt-120 pb-120">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-7 col-xxl-6">
                <div class="d-flex justify-content-center">
                    <div class="verification-code-wrapper bg--section">
                        <div class="verification-area">
                            <div class="account-logo">
                                <a href="{{route('home')}}">
                                    <img src="{{getImage(getFilePath('logoIcon') .'/logo.png')}}">
                                </a>
                            </div>
                            <h5 class="pb-3 text-center border-bottom mb-3">@lang('Verify Email Address')</h5>
                            <form action="{{ route('user.password.verify.code') }}" method="POST" class="submit-form">
                                @csrf
                                <p class="verification-text">@lang('A 6 digit verification code sent to your email address') :  {{ showEmailAddress($email) }}</p>
                                <input type="hidden" name="email" value="{{ $email }}">
                                @include($activeTemplate.'partials.verification_code')
                                <div class="form-group">
                                    <button type="submit" class="cmn--btn btn-block">@lang('Submit')</button>
                                </div>
                                <div class="form-group">
                                    @lang('Please check including your Junk/Spam Folder. if not found, you can')
                                    <a href="{{ route('user.password.request') }}" class="text--base">@lang('Try to send again')</a>
                                </div>
                            </form>
                        </div>
                    </div>
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
