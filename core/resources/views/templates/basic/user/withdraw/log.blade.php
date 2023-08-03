@extends($activeTemplate.'layouts.master')
@section('content')
<div class="container">
    <div class="row justify-content-end gy-4">
        <div class="col-4">
            <form action="">
                <div class="input-group">
                    <input type="text" name="search" class="form-control cmn--form--control" value="{{ request()->search }}" placeholder="@lang('Search By Transactions')">
                    <button class="input-group-text bg--base text-white border-0">
                        <i class="las la-search"></i>
                    </button>
                </div>
            </form>
        </div>
        <div class="col-12">
            <div class="table-responsive">
                <table class="table cmn--table">
                    <thead>
                        <tr>
                            <th>@lang('Gateway | Transaction')</th>
                            <th>@lang('Initiated')</th>
                            <th>@lang('Amount')</th>
                            <th>@lang('Conversion')</th>
                            <th>@lang('Status')</th>
                            <th>@lang('Action')</th>
                        </tr>
                    </thead>
                    <tbody>
                    @forelse($withdraws as $withdraw)
                        <tr>
                            <td>
                                <div>
                                    <span class="fw-bold d-block"><span class="text-primary"> {{ __(@$withdraw->method->name) }}</span></span>
                                    <small>{{ $withdraw->trx }}</small>
                                </div>
                            </td>
                            <td> {{ showDateTime($withdraw->created_at) }} <br>  {{ diffForHumans($withdraw->created_at) }}</td>
                            <td>
                                 <div>
                                    {{ __($general->cur_sym) }}{{ showAmount($withdraw->amount ) }} - <span class="text--danger" title="@lang('charge')">{{ showAmount($withdraw->charge)}} </span> <br>
                                    <strong title="@lang('Amount after charge')">
                                        {{ showAmount($withdraw->amount-$withdraw->charge) }} {{ __($general->cur_text) }}
                                    </strong>
                                </div>
                             </td>
                             <td>
                                <div>
                                    1 {{ __($general->cur_text) }} =  {{ showAmount($withdraw->rate) }} {{ __($withdraw->currency) }}
                                 <br>
                                 <strong>{{ showAmount($withdraw->final_amount) }} {{ __($withdraw->currency) }}</strong>
                                </div>
                             </td>
                             <td> @php echo $withdraw->statusBadge @endphp </td>
                            <td>
                                <button class="btn btn--base-outline btn-sm detailBtn"
                                        data-user_data="{{ json_encode($withdraw->withdraw_information) }}"
                                        @if ($withdraw->status == Status::PAYMENT_REJECT)
                                        data-admin_feedback="{{ $withdraw->admin_feedback }}"
                                        @endif>
                                    <i class="la la-desktop"></i> @lang('Details')
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
            @if($withdraws->hasPages())
                {{$withdraws->links()}}
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
                <ul class="list-group userData list-group-flush">

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
                var userData = $(this).data('user_data');
                var html = ``;
                userData.forEach(element => {
                    if(element.type != 'file'){
                        html += `
                        <li class="list-group-item d-flex justify-content-between align-items-center bg-transparent b-input text-white">
                            <span>${element.name}</span>
                            <span">${element.value}</span>
                        </li>`;
                    }
                });
                modal.find('.userData').html(html);

                if($(this).data('admin_feedback') != undefined){
                    var adminFeedback = `
                        <div class="my-3">
                            <strong>@lang('Admin Feedback')</strong>
                            <p class="mt-1">${$(this).data('admin_feedback')}</p>
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
