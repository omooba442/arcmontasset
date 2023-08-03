@extends($activeTemplate.'layouts.frontend')
@section('content')
@php
$content  = getContent('banner.content', true);
$elements = getContent('banner.element',limit:4);
@endphp
<section class="banner-section bg--overlay bg_img" data-background="{{ getImage('assets/images/frontend/banner/'. @$content->data_values->background_image, '1000x560')}}">
    <div class="container">
        <div class="banner-wrapper">
            <div class="banner-content mt-xl-5">
                <h2 class="banner-title">{{__(@$content->data_values->heading)}}</h2>
                <p class="banner-text">{{__(@$content->data_values->sub_heading)}}</p>
                <a href="{{__(@$content->data_values->button_url)}}" class="cmn--btn">{{__(@$content->data_values->button_name)}}</a>
            </div>
            <div class="banner-thumb">
                <img src="{{ getImage('assets/images/frontend/banner/'. @$content->data_values->hero_image, '1000x870')}}">
                <div class="banner-anime-thumbs">
                    @foreach($elements as $element)
                    <div class="banner-anime banner-anime{{$loop->iteration}}">
                        <img src="{{ getImage('assets/images/frontend/banner/'. @$element->data_values->background_image, '70x185')}}">
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
</section>

@if($sections->secs != null)
@foreach(json_decode($sections->secs) as $sec)
    @include($activeTemplate.'sections.'.$sec)
@endforeach
@endif
@endsection
