@extends('front/front_inner_layout')

@section('main')



    <br>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <div class="container">
    <div class="row">


        <div class="col-sm-12 col-md-12 col-xs-12">

            <div class="thumbnail" style="border:none; background:white;">

                <div class="col-sm-4 col-md-4 col-xs-12 image-container">
                    <img src="{{ URL::to('/') }}/public/images/{{ $data->event_flyer_location }}" style="margin: 10px;" />
                </div>

                <div class="col-sm-8 col-md-8 col-xs-12">

                    <h3>{{ $data->event_title }}</h3>
                    <p> <span><b>Venue: </b>{{ $data->event_venue }}</span> </p>
                    <p> <span><b>Details: </b>{{ $data->event_details }}</span> </p>
                    <p> <span><b>Date: </b>{{ $data->event_starting_date }}</span> </p>
                    <p> <span><b>Start Time: </b>{{ $data->event_starting_time }}</span> </p>
                    <p> <span><b>End  Time: </b>{{ $data->event_ending_time }}</span> </p>
                    <p> <span><b>Ticket Price: </b>{{ $data->event_ticket_price }}</span> </p>
                    <p> <span><b>Total Seat: </b>{{ $data->event_total_seat }}</span> </p>
                    <p><button type="button" class="btn btn-primary">Buy Tickets</button></p>




                </div>
            </div>

        </div>


    </div>
    </div>


@endsection





