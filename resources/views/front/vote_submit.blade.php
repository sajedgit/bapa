@extends('front/front_inner_layout')

@section('main')



    <div class="container">

        <div class="row">
            &nbsp;
        </div>

        <div class="row">
            <div class="entry-content col-md-8">

                <h3 class="text-center" style="color: green;">

                    Your vote done Successfully

                </h3>
            </div>
            <div class="entry-content col-md-4">
                <div class=" homeCalendar">
                    @include('front.upcoming_vote')
                </div>
            </div>
        </div>





    </div>





@endsection





