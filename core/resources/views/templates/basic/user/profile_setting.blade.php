@extends($activeTemplate . 'layouts.sage')
@section('content')
    <div class="container" style="height: calc(100vh - 35px);">
        <div class="row justify-content-center vertical-center">
            <div class="col-lg-10">
                <div class="card custom--card">
                    <div class="card-body">
                        <div class="row gy-4 justify-content-center flex-wrap-reverse">
                            <div class="col-md-5 col-lg-4">
                                <ul class="list-group list-group-flush bg--light h-100 p-3">
                                    <li
                                        class="list-group-item d-flex flex-column justify-content-between border-0 bg-transparent">
                                        <span class="fw-bold text-muted">{{ $user->username }}</span>
                                        <small class="text-muted"> <i class="la la-user"></i> @lang('Userame')</small>
                                    </li>
                                    <li
                                        class="list-group-item d-flex flex-column justify-content-between border-0 bg-transparent">
                                        <span class="fw-bold text-muted">{{ $user->email }}</span>
                                        <small class="text-muted"><i class="la la-envelope"></i> @lang('Email')</small>
                                    </li>
                                    <li
                                        class="list-group-item d-flex flex-column justify-content-between border-0 bg-transparent">
                                        <span class="fw-bold text-muted">+{{ $user->mobile }}</span>
                                        <small class="text-muted"><i class="la la-mobile"></i> @lang('Mobile')</small>
                                    </li>
                                    <li
                                        class="list-group-item d-flex flex-column justify-content-between border-0 bg-transparent">
                                        <span class="fw-bold text-muted">{{ $user->address->country }}</span>
                                        <small class="text-muted"><i class="la la-globe"></i> @lang('Country')</small>
                                    </li>

                                    <li
                                        class="list-group-item d-flex flex-column justify-content-between border-0 bg-transparent">
                                        <span class="fw-bold text-muted">{{ $user->address->address }}</span>
                                        <small class="text-muted"><i class="la la-map-marked"></i> @lang('Address')</small>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-7 col-lg-8">
                                <div class="d-flex flex-wrap gap-2">
                                    <div class="flex-grow-1 col-12">
                                        <label>@lang('Referral Link')</label>
                                        <div class="input-group">
                                            <input id="rlink" type="text" name="reflink"
                                                value="{{ route('user.register') . '?ref=' . auth()->user()->refCode }}"
                                                class="form-control cmn--form--control" readonly>
                                            <span class="input-group-text" style="cursor: pointer;" onclick="copyRLink();"><i class="fas fa-copy" ></i></span>
                                        </div>
                                    </div>
                                    <script>
                                        function copyRLink() {
                                            let text = "{{ route('user.register') . '?ref=' . auth()->user()->refCode }}";
                                            navigator.clipboard.writeText(text).then(function() {
                                                alert('Referral link copied successfuly.');
                                            }, function(err) {
                                                console.error('Async: Could not copy text: ', err);
                                                alert('We encountered an error copying your referral link.');
                                            });
                                        }
                                    </script>
                                </div>
                                <form class="register py-3 pe-3 ps-3 ps-md-0" action="" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="row gy-2">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('First Name')</label>
                                                <input type="text" class="form-control cmn--form--control"
                                                    name="firstname" value="{{ $user->firstname }}" required>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('Last Name')</label>
                                                <input type="text" class="form-control cmn--form--control"
                                                    name="lastname" value="{{ $user->lastname }}" required>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('State')</label>
                                                <input type="text" class="form-control cmn--form--control" name="state"
                                                    value="{{ @$user->address->state }}">
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('City')</label>
                                                <input type="text" class="form-control cmn--form--control" name="city"
                                                    value="{{ @$user->address->city }}">
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('Zip Code')</label>
                                                <input type="text" class="form-control cmn--form--control" name="zip"
                                                    value="{{ @$user->address->zip }}">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-label">@lang('Address')</label>
                                                <input type="text" class="form-control cmn--form--control" name="address"
                                                    value="{{ @$user->address->address }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="asset_item_top mt-2 px-6">
                                        <button type="submit" class="asset_a">@lang('Submit')</button>
                                    </div>
                                </form>
                                <div class="asset_item_top mt-2 px-6">
                                    <a href="{{ route('user.change.password') }}" class="asset_a">@lang('Change Password')</a>
                                </div>
                                <div class="asset_item_top mt-2 px-6">
                                    <a href="{{ route('user.twofactor') }}" class="asset_a">@lang('Enable/Disable 2FA')</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
