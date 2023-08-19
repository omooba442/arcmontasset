@extends($activeTemplate.'layouts.frontend')
@section('content')
<section class="card pcard pt-120 pb-80">
    <div class="container">
        <center><h2>{{$policy->data_values->title}}</h2></center>
        <div class="row">
            <div class="col-12">
                @php echo $policy->data_values->details @endphp
            </div>
        </div>
    </div>
</section>
@endsection

@push('style')
    <style>
        .pcard {
            background-color: #1a253b;
        }
        .pcard h2, .pcard p, .pcard ul, .pcard li {
            color: #fff;
            font-family: 'Bricolage Grotesque', sans-serif;
        }
        .pcard h2 {
            font-size: x-large;
            margin-top: 0;
        }
        .pcard p, .pcard ul, .pcard li {
            font-size: medium;
            margin-top: 0;
            padding-left: 30px;
            list-style: inside;
        }
        .pcard h2 {
            font-size: x-large;
        }
    </style>
@endpush
