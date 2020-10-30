@extends('front/front_inner_layout')

@section('main')

<style>


    .member_update_form {
        max-width: 500px;
        margin: 0 auto;
        padding: 15px;
    }


</style>


    <div class="container">

        <div class="row col-md-12 ">

            @if (session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            {{ Form::open([ 'method'  => 'post','class'  => 'member_update_form','files'=>'true', 'route' => [ 'profile_update' ] ]) }}

            @csrf



            <br/>  <br/>

             <input type="hidden" name="profile" value="profile">
             <input type="hidden" name="user_type_id" value="{{ $user->user_type_id }}">

            <div class="form-group row">
                <div class="col-sm-4 mb-3 mb-sm-0">
                    {{ Form::label('name', (Lang::get('memberships.edit_msg').' '.Lang::get('memberships.name')),array('class'=>'control-label')) }}
                </div>
                <div class="col-sm-8">
                    {{ Form::text('name', $value = $user->name ,array('class' => 'form-control')) }}
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-4 mb-3 mb-sm-0">
                    {{ Form::label('username', (Lang::get('memberships.edit_msg').' '.Lang::get('memberships.username')),array('class'=>'control-label')) }}
                </div>
                <div class="col-sm-8">
                    {{ Form::text('username', $value = $user->username ,array('class' => 'form-control')) }}
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-4 mb-3 mb-sm-0">
                    {{ Form::label('password', (Lang::get('memberships.edit_msg').' '.Lang::get('memberships.password')),array('class'=>'control-label')) }}
                </div>
                <div class="col-sm-8">

                    <input type="password" name="password" value="<?php //echo $data->password;?>" class="form-control">

                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-4 mb-3 mb-sm-0">
                    {{ Form::label('password_confirmation', (Lang::get('memberships.edit_msg').' '.Lang::get('memberships.password_confirmation')),array('class'=>'control-label')) }}
                </div>
                <div class="col-sm-8">

                    <input type="password" name="password_confirmation" value="<?php //echo $data->password;?>" class="form-control">

                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-4 mb-3 mb-sm-0">
                    {{ Form::label('email', (Lang::get('memberships.edit_msg').' '.Lang::get('memberships.email')),array('class'=>'control-label')) }}
                </div>
                <div class="col-sm-8">
                    {{ Form::text('email', $value = $user->email ,array('class' => 'form-control')) }}
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-4 mb-3 mb-sm-0">
                    {{ Form::label('photo', (' Photo '),array('class'=>'control-label')) }}
                </div>
                <div class="col-sm-8">

                    {{ Form::file('photo', array('class' => 'form-control')) }}
                    <img src="{{ asset('public/images/member/'.$user->photo) }}" class="img-thumbnail" width="100"/>
                    <input type="hidden" name="hidden_image" value="{{ $user->photo }}"/>

                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-4 mb-3 mb-sm-0">
                    {{ Form::label('active', (Lang::get('memberships.edit_msg').' '.Lang::get('memberships.active')),array('class'=>'control-label')) }}
                </div>
                <div class="col-sm-8">

                    {!! Form::select('active', $status_items, $user->active, ['class' => 'form-control']) !!}
                </div>
            </div>



            <div class="form-group">

                {{ Form::submit(Lang::get('memberships.update_btn_msg'), array('class' => '')) }}
            </div>

            {!! Form::close() !!}

        </div>






    </div>





@endsection





