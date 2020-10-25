@extends('front/front_inner_layout')

@section('main')

<style>
    .buy_tickets
    {
        border: 1px solid #1c294e;
        background-color: #e9e5e1;
    }
    .buy_tickets div.row
    {

    }
</style>

    <br>
{{--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--}}

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

                <div class="col-sm-4 col-md-4 col-xs-12 image-container">
                    <img src="{{ URL::to('/') }}/public/images/{{ $data->event_flyer_location }}" style="margin: 10px;" />
                </div>

                <div class="col-sm-5 col-md-5 col-xs-12">

                    <h3>{{ $data->event_title }}</h3>
                    <p> <span><b>Venue: </b>{{ $data->event_venue }}</span> </p>
                    <p> <span><b>Details: </b>{{ $data->event_details }}</span> </p>
                    <p> <span><b>Date: </b>{{ $data->event_starting_date }}</span> </p>
                    <p> <span><b>Start Time: </b>{{ $data->event_starting_time }}</span> </p>
                    <p> <span><b>End  Time: </b>{{ $data->event_ending_time }}</span> </p>
                    <p> <span><b>Ticket Price: </b>{{ $data->event_ticket_price }}</span> </p>
                    <p> <span><b>Children Ticket Price: </b>{{ $data->event_ticket_price_children }}</span> </p>
                    <p> <span><b>Total Seat: </b>{{ $data->event_total_seat }}</span> </p>



                </div>
                <div class="col-sm-3 col-md-3 col-xs-12">

                    <div class="buy_tickets text-center">

                        <h3>Buy Tickets</h3>

            {{ Form::open([ 'method'  => 'post','class'  => '', 'route' => [ 'buy_tickets' ]  ]) }}

                        @csrf

                        <input type="hidden"    value=" {{ $data->event_title }}" name="event_title">
                        <input type="hidden"    value=" {{ $data->id }}" name="event_id">
                        <div class="row">
                            <div class="col-xs-6">
                                <span>Adult:</span>
                            </div>
                            <div class="col-xs-4">
                                <input type="number" min="0"   value="1" name="adult_quantity">
                                <input type="hidden" min="0"   value="{{ $data->event_ticket_price }}" name="adult_price">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6">
                                <span>Children:</span>
                            </div>
                            <div class="col-xs-4">
                                <input type="number" min="0"   value="0" name="children_quantity">
                                <input type="hidden" min="0"   value="{{ $data->event_ticket_price_children }}" name="children_price">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <p><button type="submit" class="btn btn-primary">Buy Tickets</button></p>

                            </div>
                        </div>

                        {!! Form::close() !!}

                    </div>

                </div>
            </div>

        </div>


    </div>
    </div>


@endsection





