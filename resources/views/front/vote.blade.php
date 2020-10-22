@extends('front/front_inner_layout')

@section('main')

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>

        .panel-body:not(.two-col) {
            padding: 0px
        }

        .glyphicon {
            margin-right: 5px;
        }

        .glyphicon-new-window {
            margin-left: 5px;
        }

        .panel-body .radio, .panel-body .checkbox {
            margin-top: 0px;
            margin-bottom: 0px;
        }

        .panel-body .list-group {
            margin-bottom: 0;
        }

        .margin-bottom-none {
            margin-bottom: 0;
        }

        .panel-body .radio label, .panel-body .checkbox label {
            display: block;
        }


        .wrapper {
            text-align: center;
        }
        .time {
            color: #000;
            font-size: 6em;
        }
        .label {
            font-size: 2em;
            display: block;
            color: #aaa;
        }
        form {
            max-width: inherit;
        }

    </style>

    <div class="container">

        <div class="row">
            &nbsp;
        </div>

        <div class="row">
            <div class="entry-content col-md-8">

                {{--     'vote_today','vote_msg_today','upcoming_vote','upcoming_vote_msg'));   --}}


                <?php  //print_r($vote_done); ?>



                    @if(isset($vote_today) && count($vote_today) > 0)

                        @foreach($vote_today as $vote)

                            <div class="col-md-12 col-xs-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <span class="glyphicon glyphicon-circle-arrow-right"></span>{{ $vote->vote_name }}
                                        </h3>
                                    </div>
                                    <div class="panel-body two-col">

                                        <div class="row">

                                            <div class="col-md-12 col-xs-12">
                                                <div class="margin-bottom-none">

                                                    <div class="row">
                                                        <div class="col-md-9 col-xs-12">
                                                            <span>Vote: </span> <span> <b>{{ $vote->vote_name }} </b></span>
                                                        </div>
                                                        <div class="col-md-3 col-xs-12">
                                                            <span>Date: </span>
                                                            <span> {{ date("d M, Y", strtotime($vote->voting_date))  }} </span>
                                                        </div>
                                                    </div>

                                                    <br/>

                                                    <div class="row">
                                                        <div class="col-md-9 col-xs-12">
                                                            <span>Start Time: </span> <span> {{ $vote->start_time }} </span>
                                                        </div>
                                                        <div class="col-md-3 col-xs-12">
                                                            <span>End Time : </span> <span> {{ $vote->end_time }} </span>
                                                        </div>
                                                    </div>
                                                    <br/>

                                                    <div class="row">
                                                        <div class="col-md-12 col-xs-12">
                                                            <div id="countdown" class="row h-100 justify-content-center align-items-center">

                                                            </div>
                                                        </div>

                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
    {{--                                    <?php--}}
    {{--                                    $now_time=time();--}}
    {{--                                    $start_time=strtotime($vote->voting_date." ".$vote->start_time);--}}
    {{--                                    $end_time=strtotime($vote->voting_date." ".$vote->end_time);--}}

    {{--                                  //  echo "$start_time----$now_time---$end_time";--}}
    {{--                                    ?>--}}
    {{--                                    @if ( $now_time >= $start_time && $now_time <= $end_time )--}}
    {{--                                        <button type="button" class="btn btn-success btn-sm vote_btn">--}}
    {{--                                            <span class="glyphicon glyphicon-ok"></span> Start Vote--}}
    {{--                                        </button>--}}
    {{--                                    @elseif ( $now_time < $end_time )--}}
    {{--                                        <button disabled="disabled" type="button" class="btn btn-success btn-sm vote_btn">--}}
    {{--                                            <span class="glyphicon glyphicon-ok"></span> Start Vote 123 {{ date("d-m-yy H:i:s") }}--}}
    {{--                                        </button>--}}
    {{--                                    @else--}}
    {{--                                        <button type="button" class="btn btn-success btn-sm vote_btn">--}}
    {{--                                            <span class="glyphicon glyphicon-ok"></span> Start Vote456--}}
    {{--                                        </button>--}}

    {{--                                    @endif--}}

                                        <button type="button" class="btn btn-success btn-sm vote_btn">
                                            <span class="glyphicon glyphicon-ok"></span> Start Vote
                                        </button>

                                    </div>
                                </div>
                            </div>

                        @endforeach
                        <div id="vote_panel" style="display: none;">

                            @include('front.vote_panel',array("vote_id"=>$vote->id ))

                        </div>

                    @else
                        <div class="col-md-10">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title text-center">
                                        <span class="glyphicon glyphicon-circle-arrow-right"></span>There are no vote today
                                    </h3>
                                </div>
                                <div class="panel-body two-col">

                                    <div class="row">

                                        <div class="col-md-12">
                                            <div class=" text-center  margin-bottom-none">

                                                <label>There are no vote today</label>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    @endif






            </div>
            <div class="entry-content col-md-4">
                <div class=" homeCalendar">
                    @include('front.upcoming_vote')
                </div>
            </div>
        </div>


    </div>


    @if(isset($vote_today) && count($vote_today) > 0)
    <script>
        // Set the date we're counting down to
        var voting_start_time="<?php echo $vote->voting_date." ".$vote->start_time; ?>";
        var voting_end_time="<?php echo $vote->voting_date." ".$vote->end_time; ?>";

        var countDownDate_start = new Date(voting_start_time).getTime();
        var countDownDate_end = new Date(voting_end_time).getTime();

        var now_time="<?php echo date("Y-m-d H:i:s"); ?>";

        //2020-10-22 01:00:00

        // Update the count down every 1 second
        var x = setInterval(function() {

            // Get today's date and time

           // var now = new Date(now_time).getTime();
            var now = new Date().getTime();



            // Find the distance between now and the count down date
            var distance_start = countDownDate_start - now;
            var distance_end = countDownDate_end - now;



            // start Time calculations for days, hours, minutes and seconds
            var days = Math.floor(distance_start / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance_start % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance_start % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance_start % (1000 * 60)) / 1000);



            var days_html="<div class='col-xs-6 col-sm-3 animated rotateIn' id='days'>\n" +
                "    <div class='wrapper'><span class='time'>"+days+"</span><span class='label'>days</span></div>\n" +
                "</div>";

            var hours_html="<div class='col-xs-6 col-sm-3 animated rotateIn' id='hours'>\n" +
                "    <div class='wrapper'><span class='time'>"+hours+"</span><span class='label'>hours</span></div>\n" +
                "</div>";


            var minutes_html="<div class='col-xs-6 col-sm-3 animated rotateIn' id='minutes'>\n" +
                "    <div class='wrapper'><span class='time'>"+minutes+"</span><span class='label'>minutes</span></div>\n" +
                "</div>";



            var seconds_html="<div class='col-xs-6 col-sm-3 animated rotateIn' id='seconds'>\n" +
                "    <div class='wrapper'><span class='time'>"+seconds+"</span><span class='label'>seconds</span></div>\n" +
                "</div>";

            // End Time calculations for days, hours, minutes and seconds
            var days_end = Math.floor(distance_end / (1000 * 60 * 60 * 24));
            var hours_end = Math.floor((distance_end % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes_end = Math.floor((distance_end % (1000 * 60 * 60)) / (1000 * 60));
            var seconds_end = Math.floor((distance_end % (1000 * 60)) / 1000);



            var days_html_end="<div class='col-xs-6 col-sm-3 animated rotateIn' id='days'>\n" +
                "    <div class='wrapper'><span class='time'>"+days_end+"</span><span class='label'>days</span></div>\n" +
                "</div>";

            var hours_html_end="<div class='col-xs-6 col-sm-3 animated rotateIn' id='hours'>\n" +
                "    <div class='wrapper'><span class='time'>"+hours_end+"</span><span class='label'>hours</span></div>\n" +
                "</div>";


            var minutes_html_end="<div class='col-xs-6 col-sm-3 animated rotateIn' id='minutes'>\n" +
                "    <div class='wrapper'><span class='time'>"+minutes_end+"</span><span class='label'>minutes</span></div>\n" +
                "</div>";



            var seconds_html_end="<div class='col-xs-6 col-sm-3 animated rotateIn' id='seconds'>\n" +
                "    <div class='wrapper'><span class='time'>"+seconds_end+"</span><span class='label'>seconds</span></div>\n" +
                "</div>";




            // Output the result in an element with id="demo"
            //document.getElementById("demo").innerHTML = days + " Day " + hours + " Hour " + minutes + " minutes " + seconds + " Seconds ";
            document.getElementById("countdown").innerHTML = "<div class='row col-md-12 text-center'><b>Voting will start in</b></div>"+days_html + hours_html + minutes_html + seconds_html ;


           // If the count down is over, write some text
            if (countDownDate_start <= now && countDownDate_end >= now) {
                //clearInterval(x);
                document.getElementById("countdown").innerHTML = "<div class='row col-md-12 text-center'><b>Remaining Time for Vote</b></div>"+days_html_end + hours_html_end + minutes_html_end + seconds_html_end ;
            }
            if(countDownDate_end < now)
            {
                //clearInterval(x);
                document.getElementById("countdown").innerHTML = "<div class='row col-md-12 text-center'><b>Voting time expired</b></div> ";
                document.getElementsByClassName("vote_btn")[0].style.display="none";
                //document.getElementById("countdown").innerHTML = "distance_start="+countDownDate_start/50000000+"***"+"now="+now/50000000+"***"+"distance_end="+countDownDate_end/50000000;
            }



        }, 1000);
    </script>

    <script>
        $(document).ready(function(){
            $(".vote_btn").click(function(){
               $("#vote_panel").show();
            });
        });

    </script>


    @endif


@endsection






