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
                                <th>@lang('S.N.')</th>
                                <th>@lang('Time')</th>
                                <th>@lang('Unit')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($games as $game)
                            <tr>
                                <td>{{$loop->index+$games->firstItem()}}</td>
                                <td>{{$game->time}}</td>
                                <td>{{ucfirst($game->unit)}}</td>
                                <td>
                                    <button type="button"  class="btn btn-sm btn-outline--primary editBtn" data-game='@json($game)'>
                                        <i class="la la-pencil"></i>@lang('Edit')
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline--danger ms-1 confirmationBtn"
                                            data-question="@lang('Are you sure to delete this trade setting')?"
                                            data-action="{{route('admin.trade.setting.delete',$game->id) }}">
                                        <i class="las la-trash"></i>@lang('Delete')
                                    </button>
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
            @if ($games->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($games)}}
            </div>
            @endif
        </div>
    </div>
</div>

<div id="cryptoModal" class="modal fade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Add Game Setting')</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    <div class="form-group">
                        <label>@lang('Time')</label>
                        <input type="number" class="form-control" name="time" required>
                    </div>
                    <div class="form-group">
                        <label>@lang('Unit')</label>
                        <select class="form-control" name="unit" required>
                            <option selected disabled>@lang('Select One')</option>
                            <option value="seconds">@lang('Seconds')</option>
                            <option value="minutes">@lang('Minutes')</option>
                            <option value="hours">@lang('Hours')</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                </div>
            </form>
        </div>
    </div>
</div>
<x-confirmation-modal/>
@endsection

@push('breadcrumb-plugins')
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
            let action = `{{ route('admin.trade.setting.save') }}`;
            modal.find('form').trigger('reset');
            modal.find('.modal-title').text("@lang('Add Trade Setting')")
            modal.find('form').prop('action', action);
            $(modal).modal('show');
        });

        $('.editBtn').on('click', function (e) {
            let action = `{{ route('admin.trade.setting.save',':id') }}`;
            let data   = $(this).data('game');
            modal.find('form').prop('action', action.replace(':id', data.id))
            modal.find("input[name=time]").val(data.time);
            modal.find("select[name=unit]").val(data.unit);
            modal.find('.modal-title').text(`@lang('Update Trade Setting')`);
            $(modal).modal('show');
        });
    })(jQuery);
</script>
@endpush
