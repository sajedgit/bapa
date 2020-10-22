@extends('front/front_inner_layout')

@section('main')

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



    </style>

    <div class="container">

        <div class="row">
            &nbsp;
        </div>

        <div class="row">
            <div class="entry-content col-md-8">

                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <span class="glyphicon glyphicon-circle-arrow-right"></span>You can not give your vote again</h3>
                        </div>
                        <div class="panel-body two-col">
                            <div class="row">
                                <h3 class="text-center" style="color: green;">

                                    You have already gave you vote

                                </h3>
                            </div>

                        </div>

                    </div>
                </div>


            </div>
            <div class="entry-content col-md-4">
                <div class=" homeCalendar">
                    @include('front.upcoming_vote')
                </div>
            </div>
        </div>





    </div>





@endsection





