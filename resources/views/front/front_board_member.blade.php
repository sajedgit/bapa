@extends('front/front_inner_layout')

@section('main')





{{--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--}}
{{--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--}}
{{--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--}}
{{--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--}}


        <style>

            .our-team{
                padding: 30px 0 40px;
                background-color: white;
                text-align: center;
                overflow: hidden;
                position: relative;
                border:1px dotted #ccc;
            }
            h1{
                margin-bottom:15px;
            }
            .our-team .pic{
                display:inline-block;
                width: 130px;
                height: 130px;
                margin-bottom: 50px;
                /* background-color: #eb1768; */
                position: relative;
                z-index: 1;
            }
            .our-team .pic::before{
                content: "";
                width: 100%;
                height: 0;
                border-radius: 50%;
                background-color: #1b3065;
                position: absolute;
                bottom: 135%;
                right: 0;
                left: 0;
                transform: scale(3);
                transition: all 0.3s linear 0s;
            }

            .our-team:hover .pic::before{
                height: 100%;
            }
            .our-team .pic::after{
                content: "";
                width: 100%;
                height: 99%;
                border-radius: 50%;
                background: #1b3065;
                position: absolute;
                top: 0;
                left: 0;
                z-index: -1;
            }
            .our-team .pic img{
                width: 100%;
                height: auto;
                border-radius: 50%;
                transform: scale(1);
                transition: all 0.9s ease 0s;
            }
            .our-team:hover .pic img{
                box-shadow: 0 0 0 14px #f7f5ec;
                transform: scale(0.7);
            }
            .our-team .team-content{
                margin-bottom: 30px;
            }
            .our-team .title{
                font-size: 22px;
                font-weight: 700;
                color: #4e5052;
                letter-spacing: 1px;
                text-transform: capitalize;
                margin-bottom: 5px;
            }
            .our-team .post{
                display: block;
                font-size: 15px;
                color: #4e5052;
                text-transform: capitalize;
            }
            .our-team .social{
                width: 100%;
                padding: 0;
                margin:0;
                background: #1b3065;
                position: absolute;
                bottom: -100px;
                left: 0;
                transition: all 0.5s ease 0s;

            }

            .our-team:hover .social{
                bottom: 0;
            }
            .our-team .social li{
                display: inline-block;
            }
            .our-team .social li a{
                display: block;
                padding: 10px;
                font-size: 17px;
                color: white;transition: all 0.5s ease 0s;

            }
            .our-team .social li a:hover{
                color: #1b3065;
                background: #fff;
                text-decoration: none;
                padding: 5px;

            }
            #content ul {
                margin-left: 0px;
            }

        </style>


    <br>

    <div class="container">
        <div class="row">
{{--            <div class="col-md-12 text-center">--}}
{{--                <h1>Animated Our Team Section</h1>--}}
{{--            </div>--}}
        </div>
        <div class="row">
            @foreach($board_members as $row)
             <div class="col-md-4 col-sm-6">
                <div class="our-team">
                    <div class="pic">
                        <img src="{{ URL::to('/public/images')."/".$row->board_members_image_location  }}" >

                    </div>
                    <div class="team-content">
                        <h3>{{ $row->board_members_first_name." ".$row->board_members_last_name  }}</h3>
                        <span class="post">{{ $row->board_member_designation  }}</span>
                    </div>
                    <ul class="social">
                        <li><a href="{{ route('board_member_details', [$row->id]) }}">Details </a></li>

                    </ul>
                </div>
            </div>
            @endforeach


        </div>
    </div>





@endsection





