@php
    use Illuminate\Support\Str;
    use Carbon\Carbon;
    use App\Models\CryptoCurrency;
    function formatAmount($number, $precision = 2)
    {
        $suffixes = ['', 'k', 'M', 'B', 'T', 'Q'];
    
        $suffixIndex = 0;
        while ($number >= 1000 && $suffixIndex < count($suffixes) - 1) {
            $number /= 1000;
            $suffixIndex++;
        }
    
        return number_format($number, $precision) . $suffixes[$suffixIndex];
    }
@endphp
@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="not_a_container p-0">
        <div class="row gx-2">
            <div class="col-12">
                <div class="px-5 py-5 ">
                    <p class="m-0" style="font-size: 28px; font-weight: 600;">Markets Overview</p>
                    <p class="m-0" style="font-size: 14px;">All price information is in USD</p>
                </div>
            </div>
            <div class="col-12">
                <div class="row gx-2 gy-2 px-5 pb-5 ">
                    <div class="col-lg-3">
                        <div class="card px-3 py-2" style="background-color: #97a2c01a;">
                            <p style="font-size: 12px">Highlight Coins</p>
                            <ul>
                                @foreach ($highlightedData as $crypto)
                                    @php
                                        $crypto = json_decode(json_encode($crypto));
                                    @endphp
                                    <li class="mt-1"
                                        style="
                                    display: flex;
                                    justify-content: space-between;
                                ">
                                        <span class="d-block">{{ __(@$crypto->symbol) }}</span>
                                        <span class="d-block">{{ formatAmount(@$crypto->quote->USD->price, 2) }} USD</span>
                                        @if ($crypto->quote->USD->percent_change_24h < 0)
                                            <span
                                                class=" text-danger">{{ formatAmount(@$crypto->quote->USD->percent_change_24h, 2) }}
                                                %</span>
                                        @else
                                            <span
                                                class=" text-success">{{ formatAmount(@$crypto->quote->USD->percent_change_24h, 2) }}
                                                %</span>
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card px-3 py-2" style="background-color: #97a2c01a;">
                            <p style="font-size: 12px">New Listings</p>
                            <ul>
                                @foreach ($newListings as $crypto)
                                    @php
                                        $crypto = json_decode(json_encode($crypto));
                                    @endphp
                                    <li class="mt-1"
                                        style="
                                    display: flex;
                                    justify-content: space-between;
                                ">
                                        <span class="d-block">{{ __(@$crypto->symbol) }}</span>
                                        <span class="d-block">{{ formatAmount(@$crypto->quote->USD->price, 2) }} USD</span>
                                        @if ($crypto->quote->USD->percent_change_24h < 0)
                                            <span
                                                class=" text-danger">{{ formatAmount(@$crypto->quote->USD->percent_change_24h, 2) }}
                                                %</span>
                                        @else
                                            <span
                                                class=" text-success">{{ formatAmount(@$crypto->quote->USD->percent_change_24h, 2) }}
                                                %</span>
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card px-3 py-2" style="background-color: #97a2c01a;">
                            <p style="font-size: 12px">Top Gainer</p>
                            <ul>
                                @foreach ($topGainingData as $crypto)
                                    @php
                                        $crypto = json_decode(json_encode($crypto));
                                    @endphp
                                    <li class="mt-1"
                                        style="
                                    display: flex;
                                    justify-content: space-between;
                                ">
                                        <span class="d-block">{{ __(@$crypto->symbol) }}</span>
                                        <span class="d-block">{{ formatAmount(@$crypto->quote->USD->price, 2) }} USD</span>
                                        @if ($crypto->quote->USD->percent_change_24h < 0)
                                            <span
                                                class=" text-danger">{{ formatAmount(@$crypto->quote->USD->percent_change_24h, 2) }}
                                                %</span>
                                        @else
                                            <span
                                                class=" text-success">{{ formatAmount(@$crypto->quote->USD->percent_change_24h, 2) }}
                                                %</span>
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card px-3 py-2" style="background-color: #97a2c01a;">
                            <p style="font-size: 12px">Top Volume</p>
                            <ul>
                                @foreach ($topVolumeData as $crypto)
                                    @php
                                        $crypto = json_decode(json_encode($crypto));
                                    @endphp
                                    <li class="mt-1"
                                        style="
                                    display: flex;
                                    justify-content: space-between;
                                ">
                                        <span class="d-block">{{ __(@$crypto->symbol) }}</span>
                                        <span class="d-block">{{ formatAmount(@$crypto->quote->USD->price, 2) }} USD</span>
                                        @if ($crypto->quote->USD->percent_change_24h < 0)
                                            <span
                                                class=" text-danger">{{ formatAmount(@$crypto->quote->USD->percent_change_24h, 2) }}
                                                %</span>
                                        @else
                                            <span
                                                class=" text-success">{{ formatAmount(@$crypto->quote->USD->percent_change_24h, 2) }}
                                                %</span>
                                        @endif
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row gx-2 mt-3 m-0 tabbish_card px-2 py-3">
            <p class="m-0 px-4 pt-2 pb-1" style="font-size: 16px; font-weight: bold;">Top Tokens by Market Capitalization</p>
            <p class="m-0 px-4 pt-1 pb-2" style="font-size: 14px">This a comprehensive snapshot of all cryptocurrencies available on Furures. This page displays the latest
                prices, 24-hour trading volume, price changes, and market capitalizations for all cryptocurrencies on
                Furures and some extra cryptocurrencies. Users can quickly access key information about these digital assets present on Furures and access the trade page from
                here.
                The data presented is for informational purposes only. Some data is provided by CoinMarketCap and is shown
                on an “as is” basis, without representation or warranty of any kind.</p>
            <div class="table-responsive px-4 mt-2" style="overflow-x: auto;">
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
                                        @if (is_null($image))
                                        @else
                                            <img width="35" height="35"
                                                style="border-radius: 100%; margin-right: 5px;"
                                                src="{{ getImage(getFilePath('crypto_currency') . '/' . $image->image, getFileSize('crypto_currency')) }}">
                                        @endif
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
                                        <span
                                            class=" text-success">{{ showAmount($crypto->quote->USD->percent_change_1h) }}
                                            %</span>
                                    @endif
                                </td>
                                <td>{{ showAmount($crypto->quote->USD->price) }} @lang('USD')</td>
                                <td>
                                    @if ($crypto->quote->USD->percent_change_7d < 0)
                                        <span class=" text-danger">{{ showAmount($crypto->quote->USD->percent_change_7d) }}
                                            %</span>
                                    @else
                                        <span
                                            class=" text-success">{{ showAmount($crypto->quote->USD->percent_change_7d) }}
                                            %</span>
                                    @endif
                                </td>
                                <td>${{ showAmount($crypto->quote->USD->fully_diluted_market_cap) }}</td>
                                <td>
                                    @if ($crypto->quote->USD->percent_change_24h < 0)
                                        <span
                                            class=" text-danger">{{ showAmount($crypto->quote->USD->percent_change_24h) }}
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
