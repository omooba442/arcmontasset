@extends($activeTemplate .'layouts.app')
@section('panel')
@php
$banned      = getContent('banned.content',true);
$policyPages = getContent('policy_pages.element',false,null,true);
@endphp
<section class="error-page account-section pt-120 pb-120">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <h3 class="error-content__title mb-2 mt-3 text--danger text-center">{{ __(@$banned->data_values->heading) }}</h3>
                <div class="error-content text-center">
                    <div class="error-content__thumb">
                        <img src="{{ getImage('assets/images/frontend/banned/' . @$banned->data_values->image, '700x400') }}" alt="@lang('image')">
                    </div>
                    <div class="error-content__desc mb-4">
                        <h5> @lang('Ban Reason')</h5>
                        <p class="text--danger mt-1"> {{ __(auth()->user()->ban_reason) }}</p>
                    </div>
                    <a href="{{ route('home') }}" class="cmn--btn">@lang('Go To Home')</a>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection

@push('style')
    <style>
        .error-page {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .error-content {
            padding: 60px;
            border-radius: 10px;
        }
        @media (max-width: 767px) {
            .error-content {
                padding: 45px;
            }
        }
        @media (max-width: 575px) {
            .error-content {
                padding: 25px;
            }
        }
        @media (max-width: 400px) {
            .error-content {
                padding: 15px;
            }
        }
        .error-content__thumb {
            max-width: 700px;
            margin: 0 auto;
        }
        .error-content__thumb img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }
        .error-content__title {
            font-weight: bolder;
        }
        .error-content__desc {
            max-width: 650px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
@endpush
