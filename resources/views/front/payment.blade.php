@extends('front/front_inner_layout')

@section('main')

<style>
    .buy_tickets
    {
        border: 1px solid #1c294e;
        background-color: #e9e5e1;
        margin: 20px 0px;
    }

</style>

    <br>

    <div class="container">
    <div class="row">

        <div class="row text-center col-md-12">

            @if (session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

        </div>

        <div class="col-sm-12 col-md-12 col-xs-12">

            <div class="thumbnail" style="border:none; background:white;">


                <div class="col-sm-4 col-sm-offset-4 col-md-4  col-md-offset-4 col-xs-12">

                    <div class="buy_tickets text-center">


                        <h3>Complete Payment</h3>

                        <p> <span><b>Registration Fee: </b>${{ $settings->registration_fee }}</span> </p>

                        <form class="form-container" method="post" action="{{ URL::to('/') }}/sq_payment/checkout_register.php">

                        @csrf

                        <input type="hidden"    value=" Registration Fee" name="title">
                        <input type="hidden"    value="{{ $user->id }}" name="user_id">
                        <input type="hidden"    value="1" name="quantity">
                        <input type="hidden"    value="{{ $settings->registration_fee }}.00" name="price">



                        <div class="row">
                            <div class="col-xs-12">
                                <p><button type="submit" class="btn btn-primary">Complete Payment</button></p>

                            </div>
                        </div>

                        </form>

                    </div>

                </div>
            </div>

        </div>


    </div>
    </div>


@endsection





