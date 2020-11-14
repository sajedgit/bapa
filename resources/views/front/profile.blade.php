@extends('front/front_inner_layout')

@section('main')


    <!-- For datetime picker-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <link rel="stylesheet" href="http://www.jonthornton.com/jquery-timepicker/jquery.timepicker.css">

    <style>


        .member_update_form {

            max-width: 100%;
            margin: 0 auto;
            padding: 15px;
        }

        .tab_heading {
            background: #046748;
            padding: 10px;
            margin: 20px auto;
            color: #fff;
            font-size: 20px;
            font-weight: bold;
        }
        .control-label
        {
            font-size: 13px;
            letter-spacing: 0px;
        }

    </style>


    <div class="container">

        <div class="row col-xs-12 ">

            <div class="row text-center ">

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

            </div>


            {{ Form::open([ 'method'  => 'post','class'  => 'member_update_form','files'=>'true', 'route' => [ 'profile_update' ] ]) }}

            @csrf




            <input type="hidden" name="profile" value="profile">
            <input type="hidden" name="user_type_id" value="{{ $user->user_type_id }}">

            <div class="col-xs-12 col-sm-12 col-md-4">

                <div class="row text-center tab_heading">
                    <span>Login Authentication</span>
                </div>


                <div class="form-group row">
                    <div class="col-xs-12">
                        {{ Form::label('username', (Lang::get('memberships.username')),array('class'=>'control-label')) }}
                    </div>
                    <div class="col-xs-12">
                        {{ Form::text('username', $value = $user->username ,array('class' => 'form-control')) }}
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-xs-12">
                        {{ Form::label('email', (Lang::get('memberships.email')),array('class'=>'control-label')) }}
                    </div>
                    <div class="col-xs-12">
                        {{ Form::text('email', $value = $user->email ,array('class' => 'form-control')) }}
                    </div>
                </div>


                <div class="form-group row">
                    <div class="col-xs-12">
                        {{ Form::label('password', (Lang::get('memberships.password')),array('class'=>'control-label')) }}
                    </div>
                    <div class="col-xs-12">

                        <input type="password" name="password" value="<?php //echo $data->password;?>"
                               class="form-control">

                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-xs-12">
                        {{ Form::label('password_confirmation', (Lang::get('memberships.password_confirmation')),array('class'=>'control-label')) }}
                    </div>
                    <div class="col-xs-12">

                        <input type="password" name="password_confirmation" value="<?php //echo $data->password;?>"
                               class="form-control">

                    </div>
                </div>


            </div>

            <div class="col-xs-12  col-sm-12 col-md-4">


                <div class="row text-center tab_heading">
                    <span>Personal Information</span>
                </div>

                <div class="form-group row">

                    <div class="col-xs-12 col-sm-6">
                        <div class="">
                            <label for="member_first_name" class="control-label">First Name</label>
                        </div>

                        <div class="">
                            <input class="form-control" name="member_first_name" type="text"
                                   value="{{ $user_personal_infos->member_first_name }}">
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6">

                        <div class="">
                            <label for="member_last_name" class="control-label">Last Name</label>
                        </div>

                        <div class="">
                            <input class="form-control" name="member_last_name" type="text"
                                   value="{{ $user_personal_infos->member_last_name }}">
                        </div>

                    </div>
                </div>
                <div class="form-group row">

                    <div class="col-xs-12 col-sm-6">
                        <div class="">
                            <label for="member_birth_date" class="control-label">Date of Birth</label>
                        </div>

                        <div class="">
                            {{ Form::text('member_birth_date', $value = $user_personal_infos->member_birth_date ,array('id' => 'datepicker1','class' => 'form-control')) }}
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6">

                        <div class="">
                            <label for="member_gender" class="control-label">Gender</label>
                        </div>

                        <div class="">
                            {!! Form::select('member_gender', $gender, $user_personal_infos->member_gender, ['class' => 'form-control']) !!}
                        </div>

                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-xs-12">
                        <label for="member_address" class="control-label">Address</label>
                    </div>
                    <div class="col-xs-12">
                        {{ Form::textarea('member_address', $value = $user_personal_infos->member_address ,array('rows' => 2,'class' => 'form-control')) }}

                    </div>
                </div>

                <div class="form-group row" style="position: relative;top: -20px;margin-bottom: 0px;">

                    <div class="col-xs-12 col-sm-6">
                        <div class="">
                            <label for="member_zip_code" class="control-label">Zip Code</label>
                        </div>

                        <div class="">
                            {{ Form::text('member_zip_code', $value = $user_personal_infos->member_zip_code ,array('class' => 'form-control')) }}
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6">

                        <div class="">
                            <label for="member_tax_reg_no" class="control-label">Tax Reg No</label>
                        </div>

                        <div class="">
                            {{ Form::text('member_tax_reg_no', $value = $user_personal_infos->member_tax_reg_no ,array('class' => 'form-control')) }}
                        </div>

                    </div>
                </div>


                <div class="form-group row">
                    <div class="col-xs-12">
                        {{ Form::label('photo', (' Photo '),array('class'=>'control-label')) }}
                    </div>
                    <div class="col-xs-12">

                        {{ Form::file('photo', array('class' => 'form-control')) }}
                        <img src="{{ asset('public/images/member/'.$user->photo) }}" class="img-thumbnail" width="100"/>
                        <input type="hidden" name="hidden_image" value="{{ $user->photo }}"/>

                    </div>
                </div>


            </div>

            <div class="col-xs-12  col-sm-12 col-md-4">


                <div class="row text-center tab_heading">
                    <span>Job Information</span>
                </div>

                <div class="form-group row">

                    <div class="col-xs-12 col-sm-6">
                        <div class="">
                            <label for="member_command_code" class="control-label">Command Code</label>
                        </div>

                        <div class="">
                            <input class="form-control" name="member_command_code" type="text"
                                   value="{{ $user_job_infos->member_command_code }}">
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6">

                        <div class="">
                            <label for="member_command_name" class="control-label">Command Name</label>
                        </div>

                        <div class="">
                            <input class="form-control" name="member_command_name" type="text"
                                   value="{{ $user_job_infos->member_command_name }}">
                        </div>

                    </div>
                </div>

                 <div class="form-group row">

                    <div class="col-xs-12 col-sm-6">
                        <div class="">
                            <label for="member_rank" class="control-label">Rank</label>
                        </div>

                        <div class="">
                            <input class="form-control" name="member_rank" type="text"
                                   value="{{ $user_job_infos->member_rank }}">
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6">

                        <div class="">
                            <label for="member_shield" class="control-label">Shield</label>
                        </div>

                        <div class="">
                            <input class="form-control" name="member_shield" type="text"
                                   value="{{ $user_job_infos->member_shield }}">
                        </div>

                    </div>
                </div>

                 <div class="form-group row">

                    <div class="col-xs-12 col-sm-6">
                        <div class="">
                            <label for="member_appointment_date" class="control-label">Appointment Date</label>
                        </div>

                        <div class="">
                            <input id="datepicker2" class="form-control" name="member_appointment_date" type="text"
                                   value="{{ $user_job_infos->member_appointment_date }}">
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6">

                        <div class="">
                            <label for="member_promoted_date" class="control-label">Promoted Date</label>
                        </div>

                        <div class="">
                            <input id="datepicker3"  class="form-control" name="member_promoted_date" type="text"
                                   value="{{ $user_job_infos->member_promoted_date }}">
                        </div>

                    </div>
                </div>

                 <div class="form-group row">

                    <div class="col-xs-12 col-sm-6">
                        <div class="">
                            <label for="member_boro" class="control-label">Boro</label>
                        </div>

                        <div class="">
                            <input class="form-control" name="member_boro" type="text"
                                   value="{{ $user_job_infos->member_boro }}">
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6">

                        <div class="">
                            <label for="member_benificiary" class="control-label">Benificiary</label>
                        </div>

                        <div class="">
                            <input class="form-control" name="member_benificiary" type="text"
                                   value="{{ $user_job_infos->member_benificiary }}">
                        </div>

                    </div>
                </div>

                 <div class="form-group row">

                    <div class="col-xs-12 col-sm-6">
                        <div class="">
                            <label for="member_reference_no" class="control-label">Reference No</label>
                        </div>

                        <div class="">
                            <input class="form-control" name="member_reference_no" type="text"
                                   value="{{ $user_job_infos->member_reference_no }}">
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6">

                        <div class="">
                            <label for="member_retired" class="control-label">Retired</label>
                        </div>

                        <div class="">

                            {!! Form::select('member_retired', $retired, $user_job_infos->member_retired, ['class' => 'form-control']) !!}

                        </div>

                    </div>
                </div>





            </div>


        </div>

        <div class="row col-xs-12 text-center">
            <div class="form-group">

                {{ Form::submit(Lang::get('memberships.update_btn_msg'), array('class' => 'btn btn-primary')) }}
            </div>


        </div>

        {!! Form::close() !!}
    </div>



    <script src="{{ URL::to('/public/vendor/jquery/jquery.min.js')  }}"></script>
    <!-- For datetime picker-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script src="http://www.jonthornton.com/jquery-timepicker/jquery.timepicker.js"></script>
    <script>
        $(function () {
            $("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
            $("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
            $("#datepicker3").datepicker({dateFormat: 'yy-mm-dd'});
            $("#datepicker4").datepicker({dateFormat: 'yy-mm-dd'});

            $('#basicExample').timepicker({'timeFormat': 'H:i:s'});
            $('#timepicker1').timepicker({'timeFormat': 'H:i:s'});
            $('#timepicker2').timepicker({'timeFormat': 'H:i:s'});
            $('#timepicker3').timepicker({'timeFormat': 'H:i:s'});
            $('#timepicker4').timepicker({'timeFormat': 'H:i:s'});
        });

    </script>

@endsection





