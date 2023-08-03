@php
$content  = getContent('predict.content', true);
$elements = getContent('predict.element',limit:6);
@endphp
<section class="predict-type-section pb-120 pt-120 bg--section">
    <div class="container">
        <div class="row gy-5">
            <div class="section__header">
                <h3 class="title">{{__(@$content->data_values->heading)}}</h3>
                <p>{{__(@$content->data_values->sub_heading)}}</p>
            </div>
        </div>
        <div class="row g-xl-2 g-lg-4 g-md-2 g-3">
            @foreach($elements as $element)
            <div class="col-xl-2 col-md-3 col-sm-6 ">
                <div class="predict-type-item predictModelShow" data-predict='@json(@$element->data_values)'>
                    <div class="icon"> @php echo @$element->data_values->icon @endphp </div>
                    <span class="title">{{__(@$element->data_values->title)}}</span>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>

<div class="modal fade custom--modal" id="predictModel">
    <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable modal-fullscreen-lg-down">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title"></h6>
                <span type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </span>
            </div>
            <div class="modal-body">
                <div class="predict-type-content">
                    <p class="text-white description"></p>
                    <div class="pt-2 d-flex flex-wrap couple--buttons">
                        <a href="{{route('user.register')}}" class="cmn--btn btn-name">{{__(@$value->data_values->button_name)}}</a>
                        <a href="{{route('user.register')}}" class="cmn--outline--btn">@lang('Sign Up Now')</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@push('script')
<script>
    "use strict";
    (function ($) {
        $('.predictModelShow').on('click', function () {
            let modal = $('#predictModel');
            let data  = $(this).data('predict');
            modal.find('.modal-title').text(data.title);
            modal.find('.description').text(data.description);
            modal.find('.btn-name').text(data.button_name);
            modal.modal('show');
        });
    })(jQuery);
</script>
@endpush
