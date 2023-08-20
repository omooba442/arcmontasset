<header class="header-section">
    <div class="header-top bg--section">
        <div class="container">
            <ul class="header-top-area">
                <li>
                    <a href="/"><img width="auto" height="35"
                            src="{{ getImage(getFilePath('logoIcon') . '/logo.png') }}"></a>
                </li>
                <ul class="menu">
                    <li>
                        <a class="{{ menuActive('home') }}" href="{{ route('home') }}">@lang('Home')</a>
                    </li>
                    @foreach ($pages as $k => $data)
                        <li><a class="{{ menuActive('pages', null, $data->slug) }}"
                                href="{{ route('pages', [$data->slug]) }}">{{ __($data->name) }}</a></li>
                    @endforeach
                    {{-- <li>
                        <a href="{{ route('blog') }}" class="{{ menuActive('blog') }}">@lang('Blog')</a>
                    </li> --}}
                    <li>
                        <a href="{{ route('services') }}" class="{{ menuActive('services') }}">@lang('Services')</a>
                    </li>
                    <li>
                        <a href="{{ route('contact') }}" class="{{ menuActive('contact') }}">@lang('Contact')</a>
                    </li>
                    @guest
                        <li class="auth">
                            <a href="{{ route('user.login') }}">@lang('Sign in')</a>
                        </li>
                        <li class="auth">
                            <a href="{{ route('user.register') }}">@lang('Sign Up')</a>
                        </li>
                    @else
                        <li class="auth">
                            <a href="{{ route('user.home') }}">@lang('Dashboard')</a>
                        </li>
                        <li class="auth">
                            <a href="{{ route('user.logout') }}">@lang('Logout')</a>
                        </li>
                    @endguest
                </ul>
                <li>
                </li>
                <div class="header-bar m-0" style="margin-left: 5px !important;">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </ul>
        </div>
    </div>
</header>
