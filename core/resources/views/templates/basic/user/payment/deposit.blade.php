@php
    use Illuminate\Support\Str;
    use Carbon\Carbon;
    use Carbon\CarbonInterval;
    $changeCoinFunc = 'a' . Str::random(6);
    $changeWalletFunc = 'b' . Str::random(6);
    $formQuantity = 'c' . Str::random(20);
    $currentPWallet = 'f' . Str::random(20);
    $formSubmit = 'j' . Str::random(6);
    $minCH = 'k' . Str::random(6);
    $proceed = 'l' . Str::random(20);
    $hiddenForm = 'm' . Str::random(20);
    $hiddenWalletInput = 'n' . Str::random(20);
    $hiddenQuantityInput = 'o' . Str::random(20);
    $wallet_shortcuts = [
        1 => 'USDT',
        2 => 'BTC',
        3 => 'ETH',
    ];
@endphp
@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="container" style="height: calc(100vh - 35px);">
        <div class="row justify-content-center vertical-center">
            <div class="col-lg-6">
                <div class="card custom--card">
                    <div class="card-header">
                        <h5 class="card-title">@lang('Deposit')</h5>
                    </div>
                    <div class="card-body">
                        <div>
                            <div class="px-1 pb-2 align-middle text-center">
                                <p class="m-0" style="font-size: 14px;">To Wallet</p>
                            </div>
                            <div class="row gx-2 align-middle text-center mt-1 mb-2 ">
                                @foreach ($wallet_shortcuts as $id => $wallet)
                                    <div onclick="{{ $changeWalletFunc }}({{ $id }})" class="col-4">
                                        <div class="card wallet_tab @if ($id == 1) active @endif"
                                            id="wallt_ref_{{ $wallet }}">{{ $wallet }}</div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">@lang('Amount')</label>
                            <div class="input-group">
                                <input type="number" step="any" name="{{ $formQuantity }}"
                                    class="form-control cmn--form--control" value="{{ old('amount') }}"
                                    id="{{ $formQuantity }}" autocomplete="off" required>
                                <span class="input-group-text" id="wallet_ref2_">USDT</span>
                            </div>
                        </div>
                        <div class="form-group d-flex mt-1" style="justify-content: space-between;">
                            <p class="m-0" style="font-size: 14px">Minimum Deposit</p>
                            <p class="m-0" style="font-size: 14px" id="{{ $minCH }}">5.00000000 USDT</p>
                        </div>
                        <div class="asset_item_top mt-2 px-6">
                            <a class="asset_a" style="cursor: pointer;" onclick="{{ $proceed }}()">Submit</a>
                        </div>
                    </div>
                </div>
                <form id="{{ $hiddenForm }}" action="{{ route('user.deposit.insert') }}" method="post"
                    style="display: none;">
                    @csrf
                    <input type="hidden" name="{{ $hiddenWalletInput }}" value="" id="{{ $hiddenWalletInput }}">
                    <input type="hidden" name="{{ $hiddenQuantityInput }}" value="" id="{{ $hiddenQuantityInput }}">
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        var {{ $currentPWallet }} = 1;
        const wallets = [
            'USDT',
            'BTC',
            'ETH',
        ];
        const minimums = {
            'USDT': '5.00000000',
            'BTC': '0.00100000',
            'ETH': '0.01000000',
        }

        const minimums_val = {
            'USDT': 5.00000000,
            'BTC': 0.00100000,
            'ETH': 0.01000000,
        }

        function {{ $changeWalletFunc }}(change) {
            if (change >= 1 && change <= 3) {
                document.getElementById('wallt_ref_' + wallets[{{ $currentPWallet }} - 1]).classList.remove('active');
                document.getElementById('wallt_ref_' + wallets[change - 1]).classList.add('active');
                document.getElementById('wallet_ref2_').innerText = wallets[change - 1];
                document.getElementById('{{ $minCH }}').innerText = minimums[wallets[change - 1]] + ' ' + wallets[
                    change - 1];
                {{ $currentPWallet }} = change;
            }
        }

        function {{ $proceed }}() {
            quantity = document.getElementById('{{ $formQuantity }}').value;
            if (quantity != null) {
                if (quantity >= minimums_val[wallets[{{ $currentPWallet }} - 1]]) {
                    $("#{{$hiddenWalletInput}}").attr('name', 'wallet');
                    $("#{{$hiddenQuantityInput}}").attr('name', 'amount');

                    $("#{{$hiddenWalletInput}}").val({{ $currentPWallet }});
                    $("#{{$hiddenQuantityInput}}").val(quantity);

                    $("#{{$hiddenForm}}").submit();
                } else {
                    notify('error', 'You can\'t trade less than ' + minimums[wallets[{{ $currentPWallet }} - 1]] + ' ' +
                        wallets[{{ $currentPWallet }} - 1]);
                }
            } else {
                notify('error', 'Invalid Amount');
            }
        }
    </script>
@endpush
