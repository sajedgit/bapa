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
    <h1 class="h3 mb-2 text-gray-800">General Settings</h1>
    <p class="mb-4"> </p>



    {{ Form::open([ 'method'  => 'post','class'  => 'col-sm-6', 'route' => [ 'settings.update', $data->id ] ]) }}

    @csrf
    @method('PATCH')



    <div class="form-group row">
        <div class="col-sm-4 mb-3 mb-sm-0">
            {{ Form::label('donate_amount', (' Donate Amount '),array('class'=>'control-label')) }}
        </div>
        <div class="col-sm-8">
            {{ Form::text('donate_amount', $value = $data->donate_amount ,array('class' => 'form-control')) }}
        </div>
    </div>




    <div class="form-group row">
        <div class="col-sm-4 mb-3 mb-sm-0">
            {{ Form::label('registration_fee', (' Registration Fee '),array('class'=>'control-label')) }}
        </div>
        <div class="col-sm-8">
            {{ Form::text('registration_fee', $value = $data->registration_fee ,array('class' => 'form-control')) }}
        </div>
    </div>




    <br/>



    <div class="form-group text-center">
        <label class="control-label ">&nbsp;&nbsp;</label>
        {{ Form::submit(Lang::get('messages.update_btn_msg'), array('class' => 'btn btn-primary')) }}
    </div>



    {!! Form::close() !!}

@endsection
