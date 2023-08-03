@extends($activeTemplate.'layouts.app')
@section('panel')

@include($activeTemplate . 'partials.header')

@if (!request()->routeIs('home'))
@include($activeTemplate . 'partials.breadcrumb')
@endif

@yield('content')

@php
$content = getContent('get_started.content', true);
@endphp
@if(@$content)
<div class="call-to-action bg--base pt-50 pb-50">
    <div class="container">
        <div class="call-to-wrapper p-0">
            <h4 class="title text--dark">{{__(@$content->data_values->heading)}}</h4>
            <div class="call-to-btn">
                <a href="{{__(@$content->data_values->button_url)}}" class="cmn--btn text--black bg--white border-0">
                    {{__(@$content->data_values->button_name)}}
                </a>
            </div>
        </div>
    </div>
</div>
@endif
@include($activeTemplate . 'partials.footer')
@endsection
