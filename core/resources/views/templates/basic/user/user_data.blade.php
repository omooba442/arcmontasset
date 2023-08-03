@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-7 col-xl-6">
            <div class="card custom--card">
                <div class="card-body">
                    <div class="alert bg--section" role="alert">
                        <strong> @lang('Complete your profile')</strong>
                        <p class="mt-0">@lang('You need to complete your profile by providing below information.')</p>
                    </div>
                    <form method="POST" action="{{ route('user.data.submit') }}">
                        @csrf
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="form-label">@lang('First Name')</label>
                                <input type="text" class="form-control cmn--form--control" name="firstname" value="{{ old('firstname') }}" required>
                            </div>

                            <div class="form-group col-sm-6">
                                <label class="form-label">@lang('Last Name')</label>
                                <input type="text" class="form-control cmn--form--control" name="lastname" value="{{ old('lastname') }}" required>
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="form-label">@lang('Address')</label>
                                <input type="text" class="form-control cmn--form--control" name="address" value="{{ old('address') }}">
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="form-label">@lang('State')</label>
                                <input type="text" class="form-control cmn--form--control" name="state" value="{{ old('state') }}">
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="form-label">@lang('Zip Code')</label>
                                <input type="text" class="form-control cmn--form--control" name="zip" value="{{ old('zip') }}">
                            </div>

                            <div class="form-group col-sm-6">
                                <label class="form-label">@lang('City')</label>
                                <input type="text" class="form-control cmn--form--control" name="city" value="{{ old('city') }}">
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="cmn--btn btn-block">
                                @lang('Submit')
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
