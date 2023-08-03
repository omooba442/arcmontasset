@extends('admin.layouts.app')
@section('panel')
    <div class="row mb-none-30">
        <div class="col-lg-12 col-md-12 mb-30">
            <div class="card">
                <div class="card-body">
                    <form action="" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-4 col-sm-6">
                                <div class="form-group ">
                                    <label> @lang('Site Title')</label>
                                    <input class="form-control" type="text" name="site_name" required value="{{$general->site_name}}">
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="form-group ">
                                    <label>@lang('Currency')</label>
                                    <input class="form-control" type="text" name="cur_text" required value="{{$general->cur_text}}">
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="form-group ">
                                    <label>@lang('Currency Symbol')</label>
                                    <input class="form-control" type="text" name="cur_sym" required value="{{$general->cur_sym}}">
                                </div>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label> @lang('Timezone')</label>
                                <select class="select2-basic" name="timezone">
                                    @foreach($timezones as $timezone)
                                    <option value="'{{ @$timezone}}'">{{ __($timezone) }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label> @lang('Site Base Color')</label>
                                <div class="input-group">
                                    <span class="input-group-text p-0 border-0">
                                        <input type='text' class="form-control colorPicker" value="{{$general->base_color}}"/>
                                    </span>
                                    <input type="text" class="form-control colorCode" name="base_color" value="{{ $general->base_color }}"/>
                                </div>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label>@lang('Practice Balance')</label>
                                <div class="input-group">
                                    <input type="number" step="any" class="form-control" name="practice_balance" value="{{ $general->practice_balance }}"/>
                                    <span class="input-group-text">{{ __($general->cur_text) }} </span>
                                </div>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label>@lang('Referral Bonus')</label>
                                <div class="input-group">
                                    <input type="number" step="any" class="form-control" name="referral_bonus" value="{{getAmount($general->referral_bonus)}}"/>
                                    <span class="input-group-text">%</span>
                                </div>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label>@lang('Trade Profit')</label>
                                <div class="input-group">
                                    <input type="number" step="any" class="form-control" name="trade_profit" value="{{ getAmount($general->trade_profit) }}"/>
                                    <span class="input-group-text">%</span>
                                </div>
                            </div>
                            <div class="form-group col-md-4 col-sm-6">
                                <label class="form-control-label font-weight-bold">@lang('Coinmarketcap Api Key') </label>
                                <input class="form-control form-control-lg" type="text" name="coinmarketcap_api_key" value="{{$general->coinmarketcap_api_key}}">
                                <a href="https://cryptocompare.com/" target="__blank"><small>https://coinmarketcap.com/api/</small></a>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script-lib')
    <script src="{{ asset('assets/admin/js/spectrum.js') }}"></script>
@endpush

@push('style-lib')
    <link rel="stylesheet" href="{{ asset('assets/admin/css/spectrum.css') }}">
@endpush

@push('script')
    <script>
        (function ($) {
            "use strict";
            $('.colorPicker').spectrum({
                color: $(this).data('color'),
                change: function (color) {
                    $(this).parent().siblings('.colorCode').val(color.toHexString().replace(/^#?/, ''));
                }
            });

            $('.colorCode').on('input', function () {
                var clr = $(this).val();
                $(this).parents('.input-group').find('.colorPicker').spectrum({
                    color: clr,
                });
            });

            $('select[name=timezone]').val("'{{ config('app.timezone') }}'").select2();
            $('.select2-basic').select2({
                dropdownParent:$('.card-body')
            });
        })(jQuery);

    </script>
@endpush

