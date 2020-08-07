@extends('front/front_inner_layout')

@section('main')


    <link href='{{ URL::to('/public/lib/main.css') }}' rel='stylesheet' />
    <script src='{{ URL::to('/public/lib/main.js') }}'></script>
    <script>

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prev,next, today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                   // right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialDate: new Date().toJSON().slice(0,10),
                editable: false,
                navLinks: true, // can click day/week names to navigate views
                dayMaxEvents: true, // allow "more" link when too many events
                nowIndicator: true,
              //  eventContent:{ html: '<i>some html</i>' },

                events: {
                    url: 'get_events',
                    failure: function() {
                        document.getElementById('script-warning').style.display = 'block'
                    }
                },
                loading: function(bool) {
                    document.getElementById('loading').style.display =
                        bool ? 'block' : 'none';
                }
            });

            calendar.render();
        });

    </script>
    <style>



        #script-warning {
            display: none;
            background: #eee;
            border-bottom: 1px solid #ddd;
            padding: 0 10px;
            line-height: 40px;
            text-align: center;
            font-weight: bold;
            font-size: 12px;
            color: red;
        }

        #loading {
            display: none;
            position: absolute;
            top: 10px;
            right: 10px;
        }

        #calendar {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 10px;
        }

    </style>
    <br>


    <div class="container">
    <div class="row">


        <div id='script-warning'>
            <code>php/get-events.php</code> must be running.
        </div>

        <div id='loading'>loading...</div>

        <div id='calendar'></div>


    </div>
    </div>


@endsection





