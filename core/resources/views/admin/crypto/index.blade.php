@extends('admin.layouts.app')
@section('panel')
<div class="row">
    <div class="col-lg-12">
        <div class="card b-radius--10 ">
            <div class="card-body p-0">
                <div class="table-responsive--md  table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('Crypto')</th>
                                <th>@lang('Symbol')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($cryptos as $crypto)
                            <tr>
                                <td>
                                    <div class="user">
                                        <div class="thumb">
                                            <img src="{{getImage(getFilePath('crypto_currency').'/'.$crypto->image, getFileSize('crypto_currency'))}}" >
                                        </div>
                                        <span class="name">{{__(@$crypto->name)}}</span>
                                    </div>
                                </td>
                                <td>{{__(@$crypto->symbol)}}</td>
                                <td> @php echo $crypto->statusBadge; @endphp </td>
                                <td>
                                    <button type="button" class="btn btn-sm btn-outline--primary editBtn"
                                        data-crypto='@json($crypto)'>
                                        <i class="la la-pencil"></i>@lang('Edit')
                                    </button>
                                    @if($crypto->status == Status::DISABLE)
                                    <button class="btn btn-sm btn-outline--success ms-1 confirmationBtn"
                                        data-question="@lang('Are you sure to enable this crypto currency?')"
                                        data-action="{{ route('admin.crypto.currency.status',$crypto->id) }}">
                                        <i class="la la-eye"></i> @lang('Enable')
                                    </button>
                                    @else
                                    <button class="btn btn-sm btn-outline--danger ms-1 confirmationBtn"
                                        data-question="@lang('Are you sure to disable this crypto currency?')"
                                        data-action="{{ route('admin.crypto.currency.status',$crypto->id) }}">
                                        <i class="la la-eye-slash"></i> @lang('Disable')
                                    </button>
                                    @endif
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
            @if ($cryptos->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($cryptos)}}
            </div>
            @endif
        </div>
    </div>
</div>

<div id="cryptoModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Add Crypto Currency')</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    <div class="form-group">
                        <label>@lang('Name')</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('Symbol')</label>
                        <input type="text" class="form-control" name="symbol" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('Image')</label>
                        <input type="file" accept=".jpg,.jpeg,.png" class="form-control" name="image" required>
                         <small class="mt-2  ">@lang('Supported files'): <b>@lang('jpeg'), @lang('jpg'), @lang('png').</b> @lang('Image will be resized into ') {{getFileSize('crypto_currency')}} @lang('px') </small>
                    </div>
                    <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                </div>

            </form>
        </div>
    </div>
</div>
<x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
<x-search-form placeholder="Name,Symbol...." />
<button type="button" class="btn btn-sm btn-outline--primary addBtn">
    <i class="las la-plus"></i>@lang('Add New')
</button>
@endpush

@push('script')
<script>
    "use strict";
    (function ($) {
        let modal = $('#cryptoModal');
        $('.addBtn').on('click', function (e) {
            let action = `{{ route('admin.crypto.currency.save') }}`;
            modal.find('form').trigger('reset');
            modal.find('input[name=image]').prop('required', true);
            modal.find('label[for=image]').addClass('required');
            modal.find('form').prop('action', action);
            modal.find('.modal-title').text("@lang('Add Crypto Currency')");
            $(modal).modal('show');
        });

        $('.editBtn').on('click', function (e) {
            let action = `{{ route('admin.crypto.currency.save',':id') }}`;
            let data = $(this).data('crypto');
            modal.find('form').prop('action', action.replace(':id', data.id))
            modal.find("input[name=name]").val(data.name);
            modal.find("input[name=symbol]").val(data.symbol);
            modal.find('input[name=image]').prop('required', false);
            modal.find('label[for=image]').removeClass('required');
            modal.find('.modal-title').text("@lang('Update Crypto Currency')");
            $(modal).modal('show');
        });
    })(jQuery);
</script>
@endpush

