@php
    use Illuminate\Support\Str;
    use Carbon\Carbon;
@endphp
@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="not_a_container">
        <div class="row gx-2 mob_gy5">
            <div class="col-12">
                <div class="card px-1 py-2 align-middle text-center">
                    <p class="m-0" style="font-size: 20px;">Assets</p>
                </div>
            </div>
        </div>
        <div class="row gx-2 mob_gy5 mt-3">
            @foreach($data as $symbol => $asset)
                <div class="col-lg-4">
                    <div class="card px-2 py-2">
                        <div class="asset_item_top">
                            <p class="m-0" style="font-size: 21px;"><b> {{$symbol}}</b><small><sub>({{$asset->name}})</sub></small></p>
                            <p class="@if($asset->quote->USD->percent_change_24h < 0) asset_color-red @else asset_color-green @endif">{{number_format($asset->quote->USD->percent_change_24h, 2)}}% (1d) <i class="fa fa-solid"></i></p>
                        </div>
                        <div class="asset_item_top mt-2">
                            <p class="m-0" style="font-size: 15px;">Price</p>
                            <p class="m-0" >{{number_format($asset->quote->USD->price, 8)}}$</p>
                        </div>
                        <div class="asset_item_top mt-2">
                            <p class="m-0" style="font-size: 15px;">Market Cap (Fully diluted)</p>
                            <p class="m-0" >{{number_format($asset->quote->USD->fully_diluted_market_cap, 2)}}$</p>
                        </div>
                        <div class="asset_item_top mt-2 px-6">
                           <a class="asset_a" href="{{route('user.assets.log', $symbol)}}">View log</a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection

@push('script')
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/assets/templates/basic/js/tv.js"></script>
    <script src="/assets/templates/basic/js/easytimer.min.js"></script>
@endpush
