@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="container" style="height: calc(100vh - 35px);">
        <div class="row justify-content-center vertical-center">
            <div class="col-lg-6">
                <div class="card custom--card">
                    <div class="card-header">
                        <h5 class="card-title">@lang('Withdraw')</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('user.withdraw.money') }}" method="post">
                            @csrf
                            <div class="form-group">
                                <label class="form-label">@lang('Method')</label>
                                <select class="form-control cmn--form--control" name="method_code" required>
                                    <option value="">@lang('Select Gateway')</option>
                                    @foreach ($withdrawMethod as $data)
                                        <option value="{{ $data->id }}" data-resource="{{ $data }}">
                                            {{ __($data->name) }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="form-label">@lang('Amount')</label>
                                <div class="input-group">
                                    <input type="number" step="any" name="amount" value="{{ old('amount') }}"
                                        class="form-control cmn--form--control" required>
                                </div>
                            </div>
                            <div class="mt-3 preview-details d-none">
                                <ul class="list-group text-center list-group-flush">
                                    <li
                                        class="list-group-item d-flex justify-content-between bg-transparent text-white b-input">
                                        <span>@lang('Limit')</span>
                                        <span> <span class="min fw-bold">0</span> - <span class="max fw-bold">0</span>
                                            <span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between bg-transparent text-white b-input">
                                        <span>@lang('Charge')</span>
                                        <span><span class="charge fw-bold">0</span> </span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between bg-transparent text-white b-input">
                                        <span>@lang('Receivable')</span> <span><span class="receivable fw-bold"> 0</span>
                                        </span>
                                    </li>
                                    <li class="list-group-item d-none justify-content-between rate-element"></li>
                                    <li class="list-group-item d-none justify-content-between in-site-cur ">
                                        <span>@lang('In') <span class="base-currency"></span></span>
                                        <strong class="final_amo">0</strong>
                                    </li>
                                </ul>
                            </div>
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
    <script type="text/javascript">
        (function($) {
            "use strict";
            $('select[name=method_code]').change(function() {
                if (!$('select[name=method_code]').val()) {
                    $('.preview-details').addClass('d-none');
                    return false;
                }
                var resource = $('select[name=method_code] option:selected').data('resource');
                var fixed_charge = parseFloat(resource.fixed_charge);
                var percent_charge = parseFloat(resource.percent_charge);
                var rate = parseFloat(resource.rate)
                var toFixedDigit = 2;
                $('.min').text(parseFloat(resource.min_limit).toFixed(2));
                $('.max').text(parseFloat(resource.max_limit).toFixed(2));
                var amount = parseFloat($('input[name=amount]').val());
                if (!amount) {
                    amount = 0;
                }
                if (amount <= 0) {
                    $('.preview-details').addClass('d-none');
                    return false;
                }
                $('.preview-details').removeClass('d-none');

                var charge = parseFloat(fixed_charge + (amount * percent_charge / 100)).toFixed(2);
                $('.charge').text(charge);
                var receivable = parseFloat((parseFloat(amount) - parseFloat(charge))).toFixed(2);
                $('.receivable').text(receivable + ' ' + resource.currency);
                var final_amo = parseFloat(parseFloat(receivable) * rate).toFixed(toFixedDigit);
                $('.final_amo').text(final_amo);
                $('.base-currency').text(resource.currency);
                $('.method_currency').text(resource.currency);
                $('input[name=amount]').on('input');
            });
            $('input[name=amount]').on('input', function() {
                var data = $('select[name=method_code]').change();
                $('.amount').text(parseFloat($(this).val()).toFixed(2));
            });
        })(jQuery);
    </script>
@endpush
