@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="container" style="height: calc(100vh - 35px);">
        <div class="row justify-content-center vertical-center">
            <div class="col-md-8">
                <div class="card custom--card">
                    <div class="card-header card-header-bg">
                        <h5 class="card-title">{{ __($pageTitle) }}</h5>
                    </div>
                    <div class="card-body ">
                        <form action="{{ route('user.deposit.manual.update') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <p class="text-center mt-2" style="font-size: 14px">@lang('You have requested') <b
                                            class="text--success">{{ showAmount($data['amount']) }}
                                            {{ $data['method_currency'] }}</b> , @lang('Please pay')
                                        <b class="text--success">{{ showAmount($data['final_amo']) . ' ' . $data['method_currency'] }}
                                        </b> @lang('for successful deposit')
                                    </p>
                                    <div class="my-4 px-5 qrc text-center">@php echo  $data->gateway->description @endphp</div>
                                    <p class="text-center mt-2 m-0 mb-2 py-2" style="font-size: 16px; font-wight: 800; background-color: #0000001a;">{{$gateway->address}}</p>
                                </div>
                                <x-viser-form identifier="id" identifierValue="{{ $gateway->form_id }}" />
                                <div class="col-md-12">
                                    <div class="asset_item_top mt-2 px-6">
                                        <button type="submit" class="asset_a">@lang('I have made payment')</button>
                                    </div>
                                </div>
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
        (function($) {
            $('.form-control').addClass('cmn--form--control')
        })(jQuery);
    </script>
@endpush

@push('style')
    <style>
        .qrc {
            max-height: 300px;
            max-width: 300px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            align-content: center;
            flex-wrap: nowrap;
            flex-direction: row;
        }
    </style>
@endpush
