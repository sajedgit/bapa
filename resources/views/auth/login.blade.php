@extends('front/front_inner_layout')

@section('main')

    <link href="{{ URL::to('/public/css/front/login_register.css') }}" rel="stylesheet" type="text/css">


<div class="container">
    <div class="row justify-content-center">
        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
            <div class="card">
                <div class="card-header text-center">
                    <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>&nbsp;&nbsp;
                    | &nbsp;&nbsp;  <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                </div>
                @if(session()->has('error'))
                    <div class="alert alert-danger">
                        {{ session()->get('error') }}
                    </div>
                @endif

                <div class="card-body">
                    <form method="POST" action="{{ route('login_submit') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="email" class="col-xs-12 col-form-label ">{{ __('E-Mail Address') }}</label>

                            <div class="col-xs-12">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-xs-12 col-form-label ">{{ __('Password') }}</label>

                            <div class="col-xs-12">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-xs-12 ">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ __('Remember Me') }}
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-xs-12 ">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Login') }}
                                </button>

                                @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                @endif
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
