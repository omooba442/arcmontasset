@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="row gy-4">
        @foreach($cryptos as $crypto)
            <div class="col-xl-3 col-lg-4 col-sm-6">
                <div class="card custom--card deposit--card">
                    <div class="card-header p-2">
                        <h5 class="card-title">{{__($crypto->name)}}</h5>
                    </div>
                    <div class="card-body">
                        <div class="deposit__thumb">
                            <a href="{{route('user.trade.now', $crypto->name)}}">
                                <img src="{{getImage(getFilePath('crypto_currency').'/'.$crypto->image, getFileSize('crypto_currency'))}}">
                            </a>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="{{route('user.trade.now', $crypto->name)}}" class="btn--sm d-block cmn--btn text-center">
                            @lang('Trade Now')
                        </a>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
@endsection

@push('style')
<style>
.deposit__thumb {
    height: auto;
    max-height: 350px !important;
}
</style>
@endpush


