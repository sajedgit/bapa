@extends('front/front_inner_layout')

@section('main')

    <style>
        .buy_tickets
        {
            border: 1px solid #1c294e;
            background-color: #e9e5e1;
            margin: 20px;
        }
        .buy_tickets div.row
        {
            padding: 10px;
        }
    </style>

    <br>
{{--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--}}

    <div class="container">
        <div class="row">


            <div class="col-xs-8 col-xs-offset-2 col-xs-12">

                <div class="buy_tickets text-center">


                    <form class="form-container" method="post" action="{{ URL::to('/') }}/sq_payment/checkout.php">
                        @if($adult_quantity>0)
                        <div class="row item-line">
                            <div class="col-xs-6 item-label">Adult Ticket x {{$adult_quantity}}</div>
                            <div class="col-xs-6 item-amount">${{$adult_ticket_price}}.00</div>
                            <input type="hidden"  value="{{ $adult_price}}.00" name="adult_price">
                            <input type="hidden"  value="Adult Ticket" name="adult_label">
                            <input type="hidden"  value="{{$adult_quantity}}" name="adult_quantity">

                        </div>
                        @endif

                        @if($children_quantity>0)
                        <div class="row item-line">
                            <div class="col-xs-6 item-label">Children Ticket x {{$children_quantity}}</div>
                            <div class="col-xs-6 item-amount">${{$children_ticket_price}}.00</div>
                            <input type="hidden"  value="{{ $children_price}}.00" name="children_price">
                            <input type="hidden"  value="Children Ticket" name="children_label">
                            <input type="hidden"  value="{{$adult_quantity}}" name="children_quantity">
                        </div>
                        @endif

                        <div class="row item-line total-line">
                            <div class="col-xs-6 item-label">Total</div>
                            <div class="col-xs-6 item-amount">${{$total}}.00</div>
                        </div>
                            <input type="hidden"  value="{{ $event_id }}" name="event_id">
                        <button type="submit" class="btn btn-primary">Pay now!</button>
                    </form>


                </div>


        </div>
    </div>


@endsection





