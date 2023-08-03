@php
	$customCaptcha = loadCustomCaptcha();
    $googleCaptcha = loadReCaptcha()
@endphp
@props(['hasIcon' => false])
@if($googleCaptcha)
    <div class="@if ($hasIcon) cmn--form--group form-group @else mb-3 @endif">
        @php echo $googleCaptcha @endphp
    </div>
@endif
@if($customCaptcha)
    @if ($hasIcon)
    <div class="cmn--form--group form-group col-md-12">
        @php echo $customCaptcha @endphp
        <div class="input-group mt-3">
            <label class="cmn--label text--white w-100">@lang('Capcha')</label>
            <div class="input-group-prepend">
            <span class="input-group-text h-100">
                <i class="las la-fingerprint"></i>
            </span>
            </div>
            <input type="text" name="captcha" class="form-control cmn--form--control" required>
        </div>
    </div>
    @else
    <div class="form-group">
        <div class="mb-2">
            @php echo $customCaptcha @endphp
        </div>
        <label class="form-label">@lang('Captcha')</label>
        <input type="text" name="captcha" class="form-control form--control" required>
    </div>
    @endif
@endif
@if($googleCaptcha)
@push('script')
    <script>
        (function($){
            "use strict"
            $('.verify-gcaptcha').on('submit',function(){
                var response = grecaptcha.getResponse();
                if (response.length == 0) {
                    document.getElementById('g-recaptcha-error').innerHTML = '<span class="text-danger">@lang("Captcha field is required.")</span>';
                    return false;
                }
                return true;
            });
        })(jQuery);
    </script>
@endpush
@endif
