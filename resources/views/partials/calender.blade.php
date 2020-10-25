<?php
use App\Http\Controllers\EventsController;

$upcoming_events =  EventsController::upcoming_events();



?>

<div class="calendarWrapper">
    <h3><img alt="Calendar Icon"
             src="{{ URL::to('/public/images/front/bapa-homepage-calendar-icon.jpg') }}">
       Events Calendar</h3>


    @foreach($upcoming_events as $row)
        <div class="calendarEvent">
            <div class="day">{{ date("M",strtotime($row->event_starting_date))  }}<span>{{ date("d",strtotime($row->event_starting_date))  }}</span></div>
            <a href="{{ URL::to('/event/'.$row->id) }}"> {{ $row->event_title }} </a>
        </div>
    @endforeach



    <a class="blueBtn" href="{{ route('event') }}">Full Calendar <i aria-hidden="true"
                                                                    class="fa fa-chevron-circle-right"></i></a>
</div>