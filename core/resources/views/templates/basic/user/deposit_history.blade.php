@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="row justify-content-end gy-4">
        <div class="col-lg-4 text-end">
            <form action="">
                <div class="input-group">
                    <input type="text" name="search" class="form-control cmn--form--control" value="{{ request()->search }}" placeholder="@lang('Search By Transactions')">
                    <button class="input-group-text bg--base border-0 text-white">
                        <i class="las la-search"></i>
                    </button>
                </div>
            </form>
        </div>
        <div class="col-md-12">
            <div class="table-responsive">
                <table class="table cmn--table">
                    <thead>
                        <tr>
                            <th>@lang('Gateway | Transaction')</th>
                            <th>@lang('Initiated')</th>
                            <th>@lang('Amount')</th>
                            <th>@lang('Conversion')</th>
                            <th>@lang('Status')</th>
                            <th>@lang('Details')</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($deposits as $deposit)
                            <tr>
                               <td>
                                    <div>
                                        <span class="fw-bold"> <span class="text--primary">{{ __($deposit->gateway?->name) }}</span> </span> <br>
                                        <small> {{ $deposit->trx }} </small>
                                    </div>
                               </td>
                               <td>{{ showDateTime($deposit->created_at) }}<br>{{ diffForHumans($deposit->created_at) }}</td>
                               <td>
                                   <div>
                                    {{ __($general->cur_sym) }}{{ showAmount($deposit->amount ) }} + <span class="text--danger" title="@lang('charge')">{{ showAmount   ($deposit->charge)}} </span>
                                    <br>
                                    <strong title="@lang('Amount with charge')"> {{ showAmount($deposit->amount+$deposit->charge) }} {{ __($general->cur_text) }}</strong>
                                   </div>
                               </td>
                               <td>
                                    <div>
                                        <span class="d-block">1 {{ __($general->cur_text) }} =  {{ showAmount($deposit->rate) }} {{__($deposit->method_currency)}}</span>
                                        <strong>{{showAmount($deposit->final_amo) }} {{__($deposit->method_currency)}}</strong>
                                    </div>
                               </td>
                               <td> @php echo $deposit->statusBadge @endphp </td>
                                @php $details = ($deposit->detail != null) ? json_encode($deposit->detail) : null; @endphp
                                <td>
                                    <a href="javascript:void(0)" class="btn btn--base-outline btn-sm  @if($deposit->method_code >= 1000) detailBtn @else disabled @endif"
                                        @if($deposit->method_code >= 1000)
                                            data-info="{{ $details }}"
                                        @endif
                                        @if ($deposit->status == Status::PAYMENT_REJECT)
                                            data-admin_feedback="{{ $deposit->admin_feedback }}"
                                        @endif>
                                        <i class="las la-desktop"></i> @lang('Details')
                                    </a>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="100%" class="text-center text-muted">{{ __($emptyMessage) }}</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            @if ($deposits->hasPages())
                {{ paginateLinks($deposits) }}
            @endif
        </div>
    </div>
</div>

{{-- APPROVE MODAL --}}
<div id="detailModal" class="modal fade custom--modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Details')</h5>
                <span type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </span>
            </div>
            <div class="modal-body">
                <ul class="list-group userData mb-2 list-group-flush">
                </ul>
                <div class="feedback"></div>
            </div>
        </div>
    </div>
</div>

@endsection


@push('script')
    <script>
        (function ($) {
            "use strict";
            $('.detailBtn').on('click', function () {
                var modal = $('#detailModal');

                var userData = $(this).data('info');
                console.log(userData);
                var html = '';
                if(userData){
                    userData.forEach(element => {
                        if(element.type != 'file'){
                            html += `
                            <li class="list-group-item d-flex justify-content-between  bg-transparent text-white b-input">
                                <span>${element.name}</span>
                                <span">${element.value}</span>
                            </li>`;
                        }
                    });
                }
                modal.find('.userData').html(html);
                if($(this).data('admin_feedback') != undefined){
                    var adminFeedback = `
                        <div class="my-3">
                            <strong>@lang('Admin Feedback')</strong>
                            <p>${$(this).data('admin_feedback')}</p>
                        </div>
                    `;
                }else{
                    var adminFeedback = '';
                }
                modal.find('.feedback').html(adminFeedback);
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush
