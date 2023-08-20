@extends($activeTemplate . 'layouts.frontend')
@section('panel')
    @php $policyPages = getContent('policy_pages.element',false); @endphp
    <div class="account-section pt-120 pb-120">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="account-wrapper bg--section mw-100">
                        <div class="account-logo">

                        </div>
                        <h4 class="text-center p-2">@lang('Sign Up')</h4>
                        <form action="{{ route('user.register') }}" method="POST" class="verify-gcaptcha account-form">
                            @csrf
                            <div class="row">
                                <div class="cmn--form--group form-group">
                                    <label class="cmn--label text--white">@lang('Username')</label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="fas fa-user"></i>
                                        </span>
                                        <input type="text" class="form-control cmn--form--control checkUser"
                                            name="username" value="{{ old('username') }}" required>
                                    </div>
                                    <small class="text--danger usernameExist"></small>
                                </div>
                                <div class="cmn--form--group form-group">
                                    <label class="cmn--label text--white">@lang('E-Mail Address')</label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="fas fa-envelope"></i>
                                        </span>
                                        <input type="email" class="form-control cmn--form--control checkUser"
                                            name="email" value="{{ old('email') }}" required>
                                    </div>
                                </div>
                                <div class="cmn--form--group form-group">
                                    <label class="cmn--label text--white">@lang('Country')</label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="fas fa-flag"></i>
                                        </span>
                                        <select name="country" class="form-control cmn--form--control">
                                            @foreach ($countries as $key => $country)
                                                <option data-mobile_code="{{ $country->dial_code }}"
                                                    value="{{ $country->country }}" data-code="{{ $key }}">
                                                    {{ __($country->country) }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="cmn--form--group form-group">
                                    <label class="cmn--label text--white">@lang('Mobile')</label>
                                    <div class="input-group">
                                        <span class="input-group-text mobile-code"></span>
                                        <input type="hidden" name="mobile_code">
                                        <input type="hidden" name="country_code">
                                        <input type="number" name="mobile" value="{{ old('mobile') }}"
                                            class="form-control cmn--form--control checkUser" required>
                                    </div>
                                    <small class="text--danger mobileExist"></small>
                                </div>
                                <div class="cmn--form--group form-group">
                                    <label class="cmn--label text--white">@lang('Password')</label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="fas fa-key"></i>
                                        </span>
                                        <input type="password" class="form-control cmn--form--control" name="password"
                                            required>
                                        @if ($general->secure_password)
                                            <div class="input-popup">
                                                <p class="error lower">@lang('1 small letter minimum')</p>
                                                <p class="error capital">@lang('1 capital letter minimum')</p>
                                                <p class="error number">@lang('1 number minimum')</p>
                                                <p class="error special">@lang('1 special character minimum')</p>
                                                <p class="error minimum">@lang('6 character password')</p>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="cmn--form--group form-group">
                                    <label class="cmn--label text--white">@lang('Confirm Password')</label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="fas fa-key"></i>
                                        </span>
                                        <input type="password" class="form-control cmn--form--control"
                                            name="password_confirmation" required>
                                    </div>
                                </div>
                                {{-- @if (session()->get('reference') != null) --}}
                                <div class="form-group cmn--form--group">
                                    <label for="referenceBy" class="cmn--label text--white">@lang('Referral Code')@if (request()->input('ref') == null)
                                            (Optional)
                                        @endif
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="fas fa-at"></i>
                                        </span>
                                        <input type="text" name="referBy" id="referenceBy"
                                            class="form-control cmn--form--control bg--section"
                                            value="{{ request()->input('ref') ?? '' }}"
                                            @if (request()->input('ref') != null) readonly @endif>
                                    </div>
                                </div>
                                {{-- @endif --}}
                                <x-captcha hasIcon="true" />
                            </div>
                            @if ($general->agree)
                                <div class="form-group">
                                    <input type="checkbox" id="agree" @checked(old('agree')) name="agree"
                                        required>
                                    <label for="agree">@lang('I agree with')</label> <span>
                                        @foreach ($policyPages as $policy)
                                            <a class="text--base"
                                                href="{{ route('policy.pages', [slug($policy->data_values->title), $policy->id]) }}">
                                                {{ __($policy->data_values->title) }}</a>
                                            @if (!$loop->last)
                                                ,
                                            @endif
                                        @endforeach
                                    </span>
                                </div>
                            @endif
                            <div class="form-group">
                                <button type="submit" id="recaptcha" class="cmn--btn btn-block">
                                    @lang('Register')</button>
                            </div>
                            <p class="mb-0">@lang('Already have an account?') <a class="text--base"
                                    href="{{ route('user.login') }}">@lang('Login')</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade custom--modal" id="existModalCenter" tabindex="-1" role="dialog"
        aria-labelledby="existModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="existModalLongTitle">@lang('You are with us')</h5>
                    <span type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </span>
                </div>
                <div class="modal-body">
                    <h6 class="text-center">@lang('You already have an account please Login ')</h6>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn--dark btn-sm"
                        data-bs-dismiss="modal">@lang('Close')</button>
                    <a href="{{ route('user.login') }}" class="btn btn--base btn-sm">@lang('Login')</a>
                </div>
            </div>
        </div>
    </div>
@endsection

@if ($general->secure_password)
    @push('script-lib')
        <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
    @endpush
@endif
@push('script')
    <script>
        "use strict";
        (function($) {

            @if ($mobileCode)
                $(`option[data-code={{ $mobileCode }}]`).attr('selected', '');
            @endif

            $('select[name=country]').change(function() {
                $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
                $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
                $('.mobile-code').text('+' + $('select[name=country] :selected').data('mobile_code'));
            });
            $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
            $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
            $('.mobile-code').text('+' + $('select[name=country] :selected').data('mobile_code'));

            $('.checkUser').on('focusout', function(e) {
                var url = '{{ route('user.checkUser') }}';
                var value = $(this).val();
                var token = '{{ csrf_token() }}';
                if ($(this).attr('name') == 'mobile') {
                    var mobile = `${$('.mobile-code').text().substr(1)}${value}`;
                    var data = {
                        mobile: mobile,
                        _token: token
                    }
                }
                if ($(this).attr('name') == 'email') {
                    var data = {
                        email: value,
                        _token: token
                    }
                }
                if ($(this).attr('name') == 'username') {
                    var data = {
                        username: value,
                        _token: token
                    }
                }
                $.post(url, data, function(response) {
                    if (response.data != false && response.type == 'email') {
                        $('#existModalCenter').modal('show');
                    } else if (response.data != false) {
                        $(`.${response.type}Exist`).text(`${response.type} already exist`);
                    } else {
                        $(`.${response.type}Exist`).text('');
                    }
                });
            });
        })(jQuery);
    </script>
@endpush
