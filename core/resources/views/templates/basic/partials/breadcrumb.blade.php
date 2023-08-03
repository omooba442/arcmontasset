@php $content = getContent('breadcrumb.content', true); @endphp
<section class="hero-section bg--overlay bg_img bg_fixed" data-background="{{ getImage('assets/images/frontend/breadcrumb/'. @$content->data_values->background_image, '1200x600')}}">
    <div class="container">
        <div class="hero-content text-center">
            <h2 class="m-0">{{__($pageTitle)}}</h2>
        </div>
    </div>
</section>
