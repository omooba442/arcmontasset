@php
    $content        = getContent('crypto_price.content', true);
    $cryptoCurrency = App\Models\CryptoCurrency::active()->orderBy('rank','ASC')->where('rank','!=',0)->take(20)->get();
@endphp
<section class="trend-trade-section pt-120 pb-120">
    <div class="container">
        <div class="row g-4">
            <div class="col-12">
                <div class="section__header ">
                    <h3 class="title">{{__(@$content->data_values->heading)}}</h3>
                    <p>{{__(@$content->data_values->sub_heading)}}</p>
                </div>
                <div class="table-responsive">
                    <table class="table cmn--table">
                        <thead>
                        <tr>
                            <th>@lang('S.N.')</th>
                            <th>@lang('Name')</th>
                            <th>@lang('1h%')</th>
                            <th>@lang('Price')</th>
                            <th>@lang('7d%')</th>
                            <th>@lang('Market Cap')</th>
                            <th>@lang('24h%')</th>
                            <th>@lang('Volume(24h)')</th>
                         
                        </tr>
                        </thead>
                        <tbody>
                            @forelse($cryptoCurrency as $crypto)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>
                                        <div class="author-info d-flex align-items-center">
                                            <img src="{{getImage(getFilePath('crypto_currency').'/'.$crypto->image, getFileSize('crypto_currency'))}}" >
                                            <div class="name">
                                                <span class="d-block">{{__(@$crypto->symbol)}}</span>
                                                <small>{{__(@$crypto->name)}}</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        @if($crypto->one_hour < 0)
                                            <span class="badge badge--danger">{{ showAmount($crypto->one_hour) }} %</span>
                                        @else
                                            <span class="badge badge--success">{{ showAmount($crypto->one_hour) }} %</span>
                                        @endif
                                    </td>
                                    <td>{{showAmount($crypto->price)}} @lang("USD")</td>
                                    <td>
                                        @if($crypto->seven_day < 0)
                                            <span class="badge badge--danger">{{ showAmount($crypto->seven_day) }} %</span>
                                        @else
                                            <span class="badge badge--success">{{ showAmount($crypto->seven_day) }} %</span>
                                        @endif
                                    </td>
                                    <td>${{showAmount($crypto->market_cap) }}</td>
                                    <td>
                                        @if($crypto->twenty_four < 0)
                                            <span class="badge badge--danger">{{ showAmount($crypto->twenty_four) }} %</span>
                                        @else
                                            <span class="badge badge--success">{{ showAmount($crypto->twenty_four) }} %</span>
                                        @endif
                                    </td>
                                    <td>${{showAmount($crypto->volume_24h) }}</td>
                                   
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="100%" class="text-muted text-center">{{ __($emptyMessage) }}</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>


@push('style')
<style>
.author-info  img{
    width: 30px;
    height: 30px;
    border: 3px solid #fff;
    border-radius: 50%;
    margin-right: 8px;
}
.author-info .name{
    text-align: left;
}
</style>
@endpush
