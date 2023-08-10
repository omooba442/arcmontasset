@php
    use Illuminate\Support\Str;
    use Carbon\Carbon;
    use App\Models\CryptoCurrency;
@endphp
@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="not_a_container">
        <div class="row gx-2">
            <div class="col-12">
                <div class="px-4 py-5 ">
                    <p class="m-0" style="font-size: 28px;">Markets Overview</p>
                    <p class="m-0" style="font-size: 14px;">All price overview is in USD</p>
                </div>
            </div>
        </div>
        <div class="row gx-2 mt-3 m-0 tabbish_card px-2 py-3">
            <div class="table-responsive px-4" style="overflow-x: auto;">
                <table class="table markets-table">
                    <thead>
                        <tr>
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
                        @forelse($data as $crypto)
                            @php
                                $image = CryptoCurrency::where('symbol', $crypto->symbol)->first();
                            @endphp
                            <tr>
                                <td>
                                    <div class="author-info d-flex align-items-center">
                                        @if(is_null($image)) @else <img width="35" height="35" style="border-radius: 100%; margin-right: 5px;" src="{{getImage(getFilePath('crypto_currency').'/'.$image->image, getFileSize('crypto_currency'))}}" >@endif
                                        <div class="name">
                                            <span class="d-block">{{ __(@$crypto->symbol) }}</span>
                                            <small>{{ __(@$crypto->name) }}</small>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    @if ($crypto->quote->USD->percent_change_1h < 0)
                                        <span class=" text-danger">{{ showAmount($crypto->quote->USD->percent_change_1h) }}
                                            %</span>
                                    @else
                                        <span class=" text-success">{{ showAmount($crypto->quote->USD->percent_change_1h) }}
                                            %</span>
                                    @endif
                                </td>
                                <td>{{ showAmount($crypto->quote->USD->price) }} @lang('USD')</td>
                                <td>
                                    @if ($crypto->quote->USD->percent_change_7d < 0)
                                        <span class=" text-danger">{{ showAmount($crypto->quote->USD->percent_change_7d) }}
                                            %</span>
                                    @else
                                        <span class=" text-success">{{ showAmount($crypto->quote->USD->percent_change_7d) }}
                                            %</span>
                                    @endif
                                </td>
                                <td>${{ showAmount($crypto->quote->USD->fully_diluted_market_cap) }}</td>
                                <td>
                                    @if ($crypto->quote->USD->percent_change_24h < 0)
                                        <span class=" text-danger">{{ showAmount($crypto->quote->USD->percent_change_24h) }}
                                            %</span>
                                    @else
                                        <span
                                            class=" text-success">{{ showAmount($crypto->quote->USD->percent_change_24h) }}
                                            %</span>
                                    @endif
                                </td>
                                <td>${{ showAmount($crypto->quote->USD->volume_24h) }}</td>

                            </tr>
                        @empty
                            <tr>
                                <td colspan="100%" class="text-muted text-center">No data, yet</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/assets/templates/basic/js/tv.js"></script>
    <script src="/assets/templates/basic/js/easytimer.min.js"></script>
@endpush
