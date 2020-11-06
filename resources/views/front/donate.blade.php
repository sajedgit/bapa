@extends('front/front_inner_layout')

@section('main')

    <style>
        .buy_tickets
        {
            border: 1px solid #1c294e;
            background-color: #e9e5e1;
            margin: 20px 0px;
        }


        .left-inner-addon {
            position: relative;
        }
        .left-inner-addon input {
            padding-left: 22px;
        }
        .left-inner-addon span {
            position: absolute;
            padding: 7px 12px;
            pointer-events: none;
            margin-left: -42px;
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


                            <h3>Donate Please</h3>


                            <form class="form-container" method="post" action="{{ URL::to('/') }}/sq_payment/checkout_donate.php">

                                @csrf



                                <div class="row">
                                    <div class="col-xs-4 col-xs-offset-4 text-center">


                                        <div class="left-inner-addon">
                                            <span>$</span>
                                            <input type="text"  class="form-control"  value="{{ $settings->donate_amount }}" name="donation">

                                        </div>



                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <p><button type="submit" class="btn btn-primary">Donate Now</button></p>

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





