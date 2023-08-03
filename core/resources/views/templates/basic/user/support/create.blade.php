@extends($activeTemplate.'layouts.master')
@section('content')
    <div class="container">
        <div class="row justify-content-center gy-4">
            <div class="col-12">
                <div class="card custom--card">
                    <div class="card-header d-flex justify-content-between flex-wrap">
                        <h4 class="card-title">@lang('Create New Ticket')</h4>
                        <a href="{{route('ticket.index') }}" class="btn btn--base-outline btn-sm">
                            <i class="las la-list"></i> @lang('ALl Tickets')
                        </a>
                    </div>
                    <div class="card-body">
                        <form  action="{{route('ticket.store')}}"  method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="form-label">@lang('Name')</label>
                                    <input type="text" name="name" value="{{@$user->firstname . ' '.@$user->lastname}}" class="form-control cmn--form--control" required readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label">@lang('Email Address')</label>
                                    <input type="email"  name="email" value="{{@$user->email}}" class="form-control cmn--form--control" required readonly>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="form-label">@lang('Subject')</label>
                                    <input type="text" name="subject" value="{{old('subject')}}" class="form-control cmn--form--control" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="form-label">@lang('Priority')</label>
                                    <select name="priority" class="form-control cmn--form--control" required>
                                        <option value="3">@lang('High')</option>
                                        <option value="2">@lang('Medium')</option>
                                        <option value="1">@lang('Low')</option>
                                    </select>
                                </div>
                                <div class="col-12 form-group">
                                    <label class="form-label">@lang('Message')</label>
                                    <textarea name="message" id="inputMessage" rows="6" class="form-control cmn--form--control" required>{{old('message')}}</textarea>
                                </div>
                            </div>

                            <div class="text-end mb-3">
                                <a href="javascript:void(0)" class="text-muted addFile"><i class="las la-paperclip"></i> <span class="attachment-text">@lang('Attach Files')</span></a>
                            </div>
                            <div class="form-group attachment-wrapper d-none">
                                <div class="file-upload"></div>
                                <div id="fileUploadsContainer"></div>
                                <p class="ticket-attachments-message text-muted mt-2">
                                   <small class="d-block"> @lang('Allowed File Extensions'): .@lang('jpg'), .@lang('jpeg'), .@lang('png'),.@lang('pdf'), .@lang('doc'), .@lang('docx')</small>
                                    <small class="text--danger">@lang('Max 5 files can be uploaded'). @lang('Maximum upload size is') {{ ini_get('upload_max_filesize') }}
                                    </small>
                                </p>
                            </div>
                            <div class="form-group">
                                <button class="cmn--btn btn-block" type="submit"><i class="fa fa-paper-plane"></i>&nbsp;@lang('Submit')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection

@push('style')
    <style>
        .input-group-text:focus{
            box-shadow: none !important;
        }
    </style>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";
            var fileAdded = 0;
            $('.addFile').on('click', function() {
                if (fileAdded >= 5) {
                    notify('error', 'You\'ve added maximum number of file');
                    return false;
                }
                fileAdded++;
                $("#fileUploadsContainer").append(`
                    <div class="d-flex gap-2 mt-3">
                        <input type="file" name="attachments[]" class="form-control cmn--form--control" required />
                        <button type="button" class="input-group-text btn--danger remove-btn btn"><i class="fa fa-times"></i></button>
                    </div>
                `);
                attachmentInfo();
            });

            $(document).on('click', '.remove-btn', function() {
                fileAdded--;
                $(this).closest('.d-flex').remove();
                attachmentInfo();
            });

            function attachmentInfo() {
                if ($('[name="attachments[]"]').length > 0) {
                    $('.attachment-text').text('Add More');
                    $('.attachment-wrapper').removeClass('d-none');
                } else {
                    $('.attachment-text').text('Attach Files');
                    $('.attachment-wrapper').addClass('d-none');
                }
            }
        })(jQuery);
    </script>
@endpush
