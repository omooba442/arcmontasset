@extends('admin.layouts.app')
@section('panel')
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <form action="" method="post" enctype="multipart/form-data">
                @csrf
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label>@lang('Description')</label>
                                <textarea class="form-control nicEdit" rows="10" name="description">@php echo @$maintenance->data_values->description @endphp</textarea>
                          </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="image-upload">
                            <label>@lang('Maintanece Mode Image')</label>
                            <div class="thumb">
                                <div class="avatar-preview">
                                    <div class="profilePicPreview" style="background-image: url({{getImage(getFilePath('maintenance').'/'.@$maintenance->data_values->image,getFileSize('maintenance')) }})">
                                        <button type="button" class="remove-image"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="avatar-edit">
                                    <input type="file" class="profilePicUpload" name="image" id="profilePicUpload1" accept=".png, .jpg, .jpeg">
                                    <label for="profilePicUpload1" class="bg--success">@lang('Upload Image')</label>
                                    <small class="mt-2">@lang('Supported files'): <b>@lang('jpeg'), @lang('jpg'). @lang('png').</b> @lang('Image will be resized into 700x400') </small>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>@lang('Heading')</label>
                            <input type="text" class="form-control" required name="heading" value="{{ @$maintenance->data_values->heading }}">
                        </div>
                        <div class="form-group col-12">
                            <label>@lang('Status')</label>
                            <input type="checkbox" data-width="100%" data-height="50" data-onstyle="-success" data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Enable')" data-off="@lang('Disabled')" @if(@$general->maintenance_mode) checked @endif name="status">
                          </div>
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('style')
    <style>
        .image-upload .thumb .profilePicPreview{
            background-position: center;
        }
    </style>
@endpush
