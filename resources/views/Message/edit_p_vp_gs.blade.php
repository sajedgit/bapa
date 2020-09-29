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
    <h1 class="h3 mb-2 text-gray-800">{{ __('messages.page_title') }}</h1>
    <p class="mb-4">{{ __('messages.welcome_msg') }}</p>

    <div align="right">
        <a href="{{ route('messages.index') }}" class="btn btn-default">Back</a>
    </div>
    <br/>


    {{ Form::open([ 'method'  => 'post','class'  => 'col-sm-6', 'route' => [ 'messages_update' ] ]) }}

    @csrf



    <div class="form-group row">
        <div class="col-sm-4 mb-3 mb-sm-0">
            {{ Form::label('title', (' Title '),array('class'=>'control-label')) }}
        </div>
        <div class="col-sm-8">
            {{ Form::textArea('title', $value = $data->title ,array('class' => 'form-control')) }}
        </div>
    </div>


    <div class="form-group row">
        <input type="hidden" name="table_name" value="<?php echo $table; ?>">
        <input type="hidden" name="url" value="<?php echo $url; ?>">
    </div>

    <div class="form-group row">
        <div class="col-sm-4 mb-3 mb-sm-0">
            {{ Form::label('description', (' Message '),array('class'=>'control-label')) }}
        </div>
        <div class="col-sm-8">
            {{ Form::textArea('description', $value = $data->description ,array('class' => 'form-control')) }}
        </div>
    </div>




    <br/>



    <div class="form-group text-center">
        <label class="control-label ">&nbsp;&nbsp;</label>
        {{ Form::submit(Lang::get('messages.update_btn_msg'), array('class' => 'btn btn-primary')) }}
    </div>



    {!! Form::close() !!}

@endsection
