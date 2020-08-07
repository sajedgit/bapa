@extends('front/front_inner_layout')

@section('main')




    <br>


    <div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-3">
            <img class="img-responsive" src="{{ URL::to('/public/images/')."/".$board_members[0]->board_members_image_location }}">
        </div>
        <div class="col-xs-12 col-sm-9">
            <div class="row">
                <div class="col-sm-6">
                    <h2>{{  $board_members[0]->board_members_first_name." ".$board_members[0]->board_members_last_name }} </h2>

                </div>

            </div>
        </div>
        <p>   {{ $board_members[0]->bio }}</p>
        <div class="col-xs-12">
            <hr />
        </div>
    </div>
    </div>


@endsection





