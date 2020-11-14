@extends('front/front_inner_layout')

@section('main')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-xs-12 col-sm-12 ">
            <div class="card">
                <div class="card-header text-center" style="margin-top: -46px;margin-bottom: 47px;color: #fff;font-size: 21px;">
                    {{ __('Reset Password') }}
                </div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form style="max-width: 500px;" method="POST" action="{{ route('password.email') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="email" class="col-sm-4 col-xs-12 col-form-label">{{ __('E-Mail Address') }}</label>

                            <div class="col-sm-8 col-xs-12">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            <div class="col-sm-4 col-xs-12 ">
                                &nbsp;
                            </div>
                            <div class="col-sm-8 col-xs-12 ">
                                <p>Send Password Reset Link </p>
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Send Link') }}
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
