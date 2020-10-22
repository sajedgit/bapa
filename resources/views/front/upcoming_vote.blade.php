<?php
use App\Http\Controllers\front\FrontController;

$upcoming_vote =  FrontController::upcoming_vote();



?>

<div class="calendarWrapper">
    <h3><img alt="Calendar Icon"
             src="{{ URL::to('/public/images/front/bapa-homepage-calendar-icon.jpg') }}">
        Upcoming Votes</h3>

    @foreach($upcoming_vote as $row)
        <div class="calendarEvent">
            <div class="day">{{ date("M",strtotime($row->voting_date))  }}<span>{{ date("d",strtotime($row->voting_date))  }}</span></div>
            <a href="{{ URL::to('/vote/'.$row->id) }}"> {{ $row->vote_name }} </a>
        </div>
    @endforeach



</div>