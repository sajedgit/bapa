@extends('front/front_inner_layout')

@section('main')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-xs-12 col-sm-12 text-center">
            <div class="card">
                <div class="card-header text-center"  style="margin-top: -46px;margin-bottom: 47px;color: #fff;font-size: 21px;">{{ __('Reset Password') }}</div>

                <div class="card-body">
                    <form  style="max-width: 500px;" method="POST" action="{{ route('password.update') }}">
                        @csrf

                        <input type="hidden" name="token" value="{{ $token }}">

                        <div class="form-group row">
                            <label for="email" class="col-xs-12 col-sm-6  col-form-label ">{{ __('E-Mail Address') }}</label>

                            <div class="col-xs-12  col-sm-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $email ?? old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-xs-12 col-sm-6 col-form-label ">{{ __('Password') }}</label>

                            <div class="col-xs-12  col-sm-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-xs-12  col-sm-6 col-form-label ">{{ __('Confirm Password') }}</label>

                            <div class="col-xs-12 col-sm-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <label class="col-xs-12  col-sm-6 col-form-label ">&nbsp;</label>
                            <div class="col-xs-12 col-sm-6">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Reset Password') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
