@extends($activeTemplate.'layouts.sage')
@section('content')
<div class="container" style="height: calc(100vh - 35px);">
    <div class="row justify-content-center vertical-center">
        <div class="col-lg-8">
            <div class="card custom--card">
                <div class="card-body">
                    <h3 class="mb-2"><center>KYC Verification</center></h3>
                    <form action="{{ route('user.kyc.submit') }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <x-viser-form identifier="act" identifierValue="kyc" />
                        <div class="asset_item_top mt-2 px-6">
                            <button type="submit" class="asset_a">@lang('Submit')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
    <script>
        "use strict";
        window.addEventListener('DOMContentLoaded', () => {
            Array.from(document.querySelectorAll(`input[type=checkbox]`)).forEach((checkbox, i) => {
                if (checkbox.hasAttribute('id')) {
                    let id = checkbox.getAttribute('id') + '_' + i;
                    checkbox.setAttribute('id', id);
                    checkbox.nextSibling.nextElementSibling.setAttribute('for', id);
                }
            })
        });
        (function ($) {
            $('.form-control').addClass("cmn--form--control").removeClass('form--control');
        })(jQuery);
    </script>
@endpush
