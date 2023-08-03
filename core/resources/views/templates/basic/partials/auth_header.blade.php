<header class="header-section">
    <div class="header-top bg--section">
        <div class="container">
            <ul class="header-top-area">
                <li class="me-auto">
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
                </li>
                <li class="dashboard-dashboard-icon">
                    <div class="avatar">
                        <span>{{ strtoupper(substr(auth()->user()->username,0,2)) }}</span>
                    </div>
                    <ul class="dashboard-menu">
                        <li>
                            <a href="{{route('ticket.index')}}">@lang('Support Ticket')</a>
                        </li>
                        <li>
                            <a href="{{route('user.profile.setting')}}">@lang('Profile Setting')</a>
                        </li>
                        <li>
                            <a href="{{route('user.change.password')}}">@lang('Change Password')</a>
                        </li>
                        <li>
                            <a href="{{route('user.twofactor')}}">@lang('2FA Security')</a>
                        </li>
                        <li>
                            <a href="{{route('user.logout')}}">@lang('Logout')</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="header-wrapper">
               
                <ul class="menu">
                    <li>
                        <a href="{{route('user.home')}}" class="{{ menuActive('user.home') }}">@lang('Dashboard')</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="{{ menuActive('user.practice.trade*') }}">@lang('Practice')</a>
                        <ul class="submenu">
                            <li>
                                <a href="{{route('user.practice.trade.index')}}">@lang('Practice Now')</a>
                            </li>
                            <li>
                                <a href="{{route('user.practice.trade.log')}}">@lang('Practice Log')</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="{{ menuActive('user.trade*') }}">@lang('Trade')</a>
                        <ul class="submenu">
                            <li>
                                <a href="{{route('user.trade.index')}}">@lang('Trade Now')</a>
                            </li>
                            <li>
                                <a href="{{route('user.trade.log')}}">@lang('Trade Log')</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="{{ menuActive('user.deposit*') }}">@lang('Deposit')</a>
                        <ul class="submenu">
                            <li>
                                <a href="{{route('user.deposit.index')}}">@lang('Deposit Money')</a>
                            </li>
                            <li>
                                <a href="{{route('user.deposit.history')}}">@lang('Deposit History')</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="{{ menuActive("user.withdraw*") }}">@lang('Withdraw')</a>
                        <ul class="submenu">
                            <li>
                                <a href="{{route('user.withdraw')}}">@lang('Withdraw Money')</a>
                            </li>
                            <li>
                                <a href="{{route('user.withdraw.history')}}">@lang('Withdraw History')</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="{{ menuActive(['user.referral.log','user.commissions.log']) }}">@lang('Referral')</a>
                        <ul class="submenu">
                            <li>
                                <a href="{{route('user.referral.log')}}">@lang('Referral Log')</a>
                            </li>

                            <li>
                                <a href="{{route('user.commissions.log')}}">@lang('Commission Log')</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ menuActive('user.transactions') }}" href="{{route('user.transactions')}}">@lang('Transaction Log')</a>
                    </li>
                </ul>
                <div class="header-bar m-0">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
</header>
