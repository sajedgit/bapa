@extends('parent')

@section('main')

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    @if (session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">About Us</h1>
    <p class="mb-4"></p>


    @include('partials.tinymce_editor')

    <br/>


    {{ Form::open([ 'method'  => 'post','class'  => 'col-sm-10', 'route' => [ 'about_update' ] ]) }}

    @csrf


    <div class="form-group row">

        <div class="col-sm-12">
            <textarea class="form-control" placeholder="Details" name="about_content" cols="50" rows="25" id="about_content">{{ $data->about_content }}</textarea>
            <input type="hidden" name="about_id" value="{{ $data->id }}">
        </div>
    </div>

    <div class="row text-center">


        <div class="col-sm-12">
            <input class="btn btn-primary text-center" type="submit" value="Update">
        </div>


    </div>






    {!! Form::close() !!}

@endsection
