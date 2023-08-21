@extends($activeTemplate . 'layouts.app')
@section('panel')
    <div class="account-section pt-120 pb-120">
        <div class="container">
            <div class="account-wrapper bg--section" id="particles-js-ctn">
                <div id="particles-js">
                </div>
                <h4 class="text-center p-2">@lang('Sign In')</h4>
                <form class="account-form verify-gcaptcha" method="POST" action="{{ route('user.login') }}"
                    onsubmit="return submitUserForm();">
                    @csrf
                    <div class="cmn--form--group form-group">
                        <label class="cmn--label text--white">@lang('Username')</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-user"></i>
                            </span>
                            <input type="text" class="form-control cmn--form--control" name="username" required
                                value="{{ old('username') }}">
                        </div>
                    </div>
                    <div class="cmn--form--group form-group">
                        <label class="cmn--label text--white">@lang('Password')</label>
                        <div class="input-group">
                            <span class="input-group-text"> <i class="fas fa-key"></i> </span>
                            <input type="password" class="form-control cmn--form--control" name="password" required>
                        </div>
                    </div>
                    <x-captcha hasIcon="true" />
                    <div class="cmn--form--group form-group">
                        <input class="form-check-input" type="checkbox" name="remember" id="remember"
                            {{ old('remember') ? 'checked' : '' }}>
                        <label class="form-check-label" for="remember">@lang('Remember Me')</label>
                    </div>
                    <div class="cmn--form--group form-group">
                        <button type="submit" class="cmn--btn btn-block">@lang('Sign In')</button>
                    </div>
                    <div class="cmn--form--group form-group">
                        <div class="d-flex flex-wrap justify-content-between">
                            <div class=" text--white d-flex align-items-center">
                                <a href="{{ route('user.password.request') }}" class="text--base">@lang('Forget Password')?</a>
                            </div>
                            <div class="text--white">
                                @lang("Don't have an account") ? <a href="{{ route('user.register') }}"
                                    class="text--base">@lang('Signup')</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script-lib')
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
@endpush

@push('script')
    <script>
        particlesJS.load('particles-js', '{{ asset('assets/json/particles.json') }}');
    </script>
@endpush

@push('style')
    <style>
        .account-wrapper {
            position: relative;
            z-index: 1;
        }

        .bg--section {
            background: url('{{ asset('assets/images/authbg.jpeg') }}') !important;
            background-size: contain !important;
        }

        #particles-js {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
    </style>
@endpush
