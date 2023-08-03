@extends($activeTemplate.'layouts.app')
@section('panel')
<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10 maintence-page">
                <div class="error-content text-center">
                    <div class="error-content__thumb">
                        <img src="{{getImage(getFilePath('maintenance').'/'.@$maintenance->data_values->image,getFileSize('maintenance')) }}">
                    </div>
                    <h3 class="error-content__title mb-2 mt-3">{{ __(@$maintenance->data_values->heading) }}</h3>
                    <div class="error-content__desc mb-1">
                        @php echo @$maintenance->data_values->description @endphp
                    </div>
                </div>
            </div>
        </div>>
    </div>
</section>
@endsection
@push('script')
    <script>
        "use strict";
        (function ($) {
            $('body').css({
                "min-height"     : "100vh",
                "display"        : "flex",
                "justify-content": "center",
                "align-items"    : "center",
                "flex-direction" : "column"
            });
        })(jQuery);
    </script>
@endpush
@push('style')
    <style>
        .maintence-page{
            padding: 40px;
            border-radius: 10px;
        }

    </style>
@endpush




