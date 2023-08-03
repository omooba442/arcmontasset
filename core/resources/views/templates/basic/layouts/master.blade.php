@extends($activeTemplate.'layouts.app')
@section('panel')

@include($activeTemplate . 'partials.auth_header')

@include($activeTemplate . 'partials.breadcrumb')

<div class="dashboard-section pt-120 pb-120 bg--section">
    @yield('content')
</div>

@include($activeTemplate . 'partials.footer')
@endsection

@push('script')
<script>
    "use strict";
    ///customize confirmation modal
    window.addEventListener('DOMContentLoaded', function (e) {
        let confirmationModal = $('#confirmationModal');
        if (confirmationModal.length > 0) {
            $(confirmationModal).addClass('custom--modal');
            $(confirmationModal).find('.close').remove();
            $(confirmationModal).addClass('p-4');
            $(confirmationModal).find('.modal-body').addClass('p-4');
            $(confirmationModal).find('.modal-header').append(`
                <span type="button" data-bs-dismiss="modal">
                    <i class="las la-times"></i>
                </span>
                `);
            $(confirmationModal).find('.btn--primary').addClass('btn--base').removeClass('btn--primary');
        }
    });
</script>
@endpush
