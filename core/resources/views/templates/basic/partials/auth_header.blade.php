<header class="header-section">
    <div class="header-top bg--section">
        <div class="not_a_container">
            <ul class="header-top-area">
                <li>
                    <a href="/"><img width="auto" height="35"
                            src="{{ getImage(getFilePath('logoIcon') . '/logo.png') }}"></a>
                </li>
                <div style="display: contents;">
                    <ul class="menu">
                        <li>
                            <a class="{{ menuActive('user.markets.index') }}"
                                href="{{ route('user.markets.index') }}">@lang('Markets')</a>
                        </li>
                        <li>
                            <a class="{{ menuActive('user.fiat.index') }}"
                                href="{{ route('user.fiat.index') }}">@lang('Fiat')</a>
                        </li>
                        <li>
                            <a class="{{ menuActive('user.exchange.index') }}"
                                href="{{ route('user.exchange.index') }}">@lang('Exchange')</a>
                        </li>
                        <li>
                            <a class="{{ menuActive('user.leverage.index') }}"
                                href="{{ route('user.leverage.index') }}">@lang('Leverage')</a>
                        </li>
                        <li>
                            <a class="{{ menuActive('user.trade.index') }}"
                                href="{{ route('user.trade.index') }}">@lang('Future Trades')</a>
                        </li>
                        <li>
                            <a class="{{ menuActive('user.lockup.index') }}"
                                href="{{ route('user.lockup.index') }}">@lang('Lock-up mining')</a>
                        </li>
                        <li>
                            <a class="{{ menuActive('user.assets.index') }} {{ menuActive('user.assets.log') }}"
                                href="{{ route('user.assets.index') }}">@lang('Assets')</a>
                        </li>
                        <li>
                            <a class="{{ menuActive('user.earn.index') }}"
                                href="{{ route('user.earn.index') }}">@lang('Furures Earn')</a>
                        </li>
                        @auth
                            <ul class="menu m2mble" style="margin-left: auto;">
                                <li>
                                    <b class="mr-1">{{ auth()->user()->email }}</b>
                                    <i class="{{ auth()->user()->kv == 0 ? 'fas fa-exclamation-circle text-danger' : (auth()->user()->kv == 2 ? 'fas fa-exclamation-circle text-warning' : 'fas fa-certificate text-success') }}"
                                        data-toggle="tooltip" data-placement="bottom"
                                        title="{{ auth()->user()->kv == 0 ? 'KYC not verified' : (auth()->user()->kv == 2 ? 'KYC verification ongoing' : 'KYC Verified') }}"
                                        style="cursor: pointer"
                                        onclick="window.location.href = '{{ auth()->user()->kv == 0 ? route('user.kyc.form') : route('user.kyc.data') }}'"></i>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><i class="fa fa-solid fa-user"></i></a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="{{ route('user.profile.setting') }}"
                                                class="{{ menuActive('user.profile.*') }} {{ menuActive('user.change.*') }}">@lang('Profile')</a>
                                        </li>
                                        <li>
                                            <a href="{{ auth()->user()->kv == 0 ? route('user.kyc.form') : route('user.kyc.data') }}"
                                                class="{{ menuActive('user.kyc.*') }}">@lang(auth()->user()->kv == 0 ? 'KYC Form' : 'KYC Data')</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('user.deposit.index') }}"
                                                class="{{ menuActive('user.deposit.index') }}"">@lang('Deposit')</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('user.deposit.history') }}"
                                                class="{{ menuActive('user.deposit.history') }}">@lang('Deposit Log')</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('user.withdraw.index') }}"
                                                class="{{ menuActive('user.withdraw.index') }}">@lang('Withdraw')</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('user.withdraw.history') }}"
                                                class="{{ menuActive('user.withdraw.history') }}">@lang('Withdraw Log')</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('user.referral.log') }}"
                                                class="{{ menuActive('user.referral.log') }}">@lang('Referral Log')</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('user.commissions.log') }}"
                                                class="{{ menuActive('user.commissions.log') }}">@lang('Commissions Log')</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('user.logout') }}"
                                                class="{{ menuActive('user.logout') }}">@lang('Logout')</a>
                                        </li>
                                        <li>
                                        </li>
                                    </ul>
                                </li>
                                {{-- <li>
                                    @if (!$general->multi_language)
                                        <div class="select-bar">
                                            <i class="fa fa-solid fa-globe"></i>
                                            <select class="langSel">
                                                @foreach ($language as $item)
                                                    <option value="{{ $item->code }}" @selected(session('lang') == $item->code)>
                                                        {{ __($item->name) }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    @endif
                                </li> --}}
                                <div id="google_translate_mobile_element"></div>
                            </ul>
                        @endauth
                    </ul>
                    @auth
                        <ul class="menu m2dstp" style="margin-left: auto;">
                            <li>
                                <b class="mr-1">{{ auth()->user()->email }}</b>
                                <i class="{{ auth()->user()->kv == 0 ? 'fas fa-exclamation-circle text-danger' : (auth()->user()->kv == 2 ? 'fas fa-exclamation-circle text-warning' : 'fas fa-certificate text-success') }}"
                                    data-toggle="tooltip" data-placement="bottom"
                                    title="{{ auth()->user()->kv == 0 ? 'KYC not verified' : (auth()->user()->kv == 2 ? 'KYC verification ongoing' : 'KYC Verified') }}"
                                    style="cursor: pointer"
                                    onclick="window.location.href = '{{ auth()->user()->kv == 0 ? route('user.kyc.form') : route('user.kyc.data') }}'"></i>
                            </li>
                            <li>
                                <a href="javascript:void(0)"><i class="fa fa-solid fa-user"></i></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="{{ route('user.profile.setting') }}"
                                            class="{{ menuActive('user.profile.*') }} {{ menuActive('user.change.*') }}">@lang('Profile')</a>
                                    </li>
                                    <li>
                                        <a href="{{ auth()->user()->kv == 0 ? route('user.kyc.form') : route('user.kyc.data') }}"
                                            class="{{ menuActive('user.kyc.*') }}">@lang(auth()->user()->kv == 0 ? 'KYC Form' : 'KYC Data')</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('user.deposit.index') }}"
                                            class="{{ menuActive('user.deposit.index') }}"">@lang('Deposit')</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('user.deposit.history') }}"
                                            class="{{ menuActive('user.deposit.history') }}">@lang('Deposit Log')</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('user.withdraw.index') }}"
                                            class="{{ menuActive('user.withdraw.index') }}">@lang('Withdraw')</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('user.withdraw.history') }}"
                                            class="{{ menuActive('user.withdraw.history') }}">@lang('Withdraw Log')</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('user.referral.log') }}"
                                            class="{{ menuActive('user.referral.log') }}">@lang('Referral Log')</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('user.commissions.log') }}"
                                            class="{{ menuActive('user.commissions.log') }}">@lang('Commissions Log')</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('user.logout') }}"
                                            class="{{ menuActive('user.logout') }}">@lang('Logout')</a>
                                    </li>
                                    <li>
                                    </li>
                                </ul>
                            </li>
                            {{-- <li>
                                @if (!$general->multi_language)
                                    <div class="select-bar">
                                        <i class="fa fa-solid fa-globe"></i>
                                        <select class="langSel">
                                            @foreach ($language as $item)
                                                <option value="{{ $item->code }}" @selected(session('lang') == $item->code)>
                                                    {{ __($item->name) }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                @endif
                            </li> --}}
                            <div id="google_translate_element"></div>
                        </ul>
                    @endauth
                </div>
                <div class="header-bar m-0">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </ul>
        </div>
    </div>
</header>
