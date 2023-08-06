<header class="header-section">
    <div class="header-top bg--section">
        <div class="not_a_container">
            <ul class="header-top-area">
                {{-- <li class="me-auto">
                    @if($general->multi_language)
                    <div class="select-bar">
                        <select class="langSel">
                            @foreach($language as $item)
                            <option value="{{$item->code}}" @selected(session('lang')==$item->code)>
                                {{__($item->name) }}
                            </option>
                            @endforeach
                        </select>
                    </div>
                    @endif
                </li> --}}
                <ul class="menu">
                    <li>
                        <a href="/"><img width="25" height="25"
                                src="{{ getImage(getFilePath('logoIcon') . '/favicon.png') }}"></a>
                    </li>
                    <li>
                        <a href="{{route('user.home')}}" class="{{ menuActive('user.home') }}">@lang('Dashboard')</a>
                    </li>
                    <li>
                        <a class="{{ menuActive('user.transactions') }}" href="{{route('user.home')}}">@lang('Markets')</a>
                    </li>
                    <li>
                        <a class="{{ menuActive('user.transactions') }}" href="{{route('user.home')}}">@lang('Fiat')</a>
                    </li>
                    <li>
                        <a class="{{ menuActive('user.transactions') }}" href="{{route('user.home')}}">@lang('Exchange')</a>
                    </li>
                    <li>
                        <a class="{{ menuActive('user.transactions') }}" href="{{route('user.home')}}">@lang('Leverage')</a>
                    </li>
                    <li>
                        <a class="{{ menuActive('user.trade.index') }}" href="{{route('user.trade.index')}}">@lang('Future Trades')</a>
                    </li>
                    <li>
                        <a class="{{ menuActive('user.transactions') }}" href="{{route('user.home')}}">@lang('Lock-up mining')</a>
                    </li>
                    <li>
                        <a class="{{ menuActive('user.transactions') }}" href="{{route('user.home')}}">@lang('Assets')</a>
                    </li>
                </ul>
                <ul class="menu">
                    <li>
                        <b>{{auth()->user()->email}}</b>
                    </li>
                    <li>
                        <a href="javascript:void(0)"><i class="fa fa-solid fa-user"></i></a>
                        <ul class="submenu">
                            <li>
                                <a href="{{ route('user.logout') }}">@lang('Logout')</a>
                            </li>
                        </ul>
                    </li>
                    <li>
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
                    </li>
                    <div class="header-bar m-0">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </ul>
            </ul>
        </div>
    </div>
</header>
