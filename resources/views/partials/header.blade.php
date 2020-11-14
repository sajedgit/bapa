<!DOCTYPE html>

<html lang="en-US">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">


    <meta content="width=device-width, initial-scale=1" name="viewport">

    <title>BANGLADESHI AMERICAN POLICE ASSOCIATION</title>

    <link href="{{ URL::to('/public/css/front/style.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ URL::to('/public/css/front/bapa-styles.css') }}" media="all" rel="stylesheet" type="text/css">
    <link href="{{ URL::to('/public/css/front/css_bootstrap_3.4_dist.min.css') }}" media="all" rel="stylesheet" type="text/css">
    <link crossorigin="anonymous" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" rel="stylesheet">
		  
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">



    <script src="{{ URL::to('/public/js/front/jquery.js') }}" type="text/javascript"></script>
    <script src="{{ URL::to('/public/js/front/bootstrap_3.4_dist_js.min.js') }}" type="text/javascript"></script>
    <script src="{{ URL::to('/public/js/front/jquery-migrate.min.js') }}" type="text/javascript"></script>


    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 .07em !important;
            vertical-align: -0.1em !important;
            background: none !important;
            padding: 0 !important;
        }

        .homepageBgLead h1 .largeText {
            display: block;
            font-size: 1em;
            color: #fff;
            text-shadow: 1px 1px 0 rgba(255, 255, 0, 1);
        }

        .homepageBgLead h1 .bottomText {
            margin-left: 0;
            font-size: 25px;
            color: #fff;
            text-shadow: 1px 1px 0 rgba(255, 255, 0, 1);
        }

        header {
            background-color: #fff;
            color: #000;
        }

        .utilityMenu {
            margin-bottom: 0px;

        }

        header .nav-wrapper ul li:hover > a, header .nav-wrapper ul li:hover > span {
            color: #000 !important;


        }
        .nav > li > a
        {
            /*font-weight: bold!important;*/
            padding: 10px 8px;
        }
        .footerSocial i {
            font-size: 4em;
            margin-right: 10px;

        }
        .inner_banner{
            z-index: 0;

        }



        .navbar-default
        {
            background-color: inherit;
            border-color: transparent;
        }
        .navbar-nav > .active > a{
            background-color: inherit!important;
            color: #000!important;
        }
        .navbar-default .navbar-nav > li > a {
            color: #000!important;
        }
        .navbar
        {
            margin-bottom: -8px!important;
        }
        .navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {

            background-color: transparent!important;
        }
        .dropdown-menu > li > a {

            padding: 7px 34px;

        }
        .navbar-nav {
            background: #fff;
        }
        .navbar-default .navbar-collapse
        {
            border: none;
            margin-top: 8px;
        }

        li.contact_us, li.login_logout
        {
            display: none;
        }
        .welcome_msg
        {
            padding: 30px;font-size: 2rem;
        }

        /*-----  for login profile hover menu--------*/

        .dropbtn2 {
            background: #1b3065;
            border: 0px;
            color: #428bb3;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #428bb3;
            min-width: 110px;
            border-radius: 9px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: #fff;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }


        .dropdown-content a:hover {background-color: #1b3065;}

        .dropdown:hover .dropdown-content {display: block;}

        .dropdown:hover .dropbtn {background-color: #1b3065;}

        /*-----  end of login profile hover menu--------*/

        @media only screen and (max-width: 991px) {
            .utilityMenu {
                display: block;
            }
            .profile_updator
            {
                display: block;
            }
        }

        @media only screen and (max-width: 768px) {
            /* For mobile phones: */
            ul.navbar-nav
            {
                margin-top: 36px;
            }
            li.contact_us, li.login_logout
            {
                display: block;
            }
            #utility-menu {
                display: none;
            }
            .navbar-default {
                border-color: transparent;
            }
            .welcome_msg {
                padding: 30px;
                font-size: 18px;
            }
            .profile_updator
            {
                display: block;
            }
        }

        @media only screen and (min-width: 991px) {

            .profile_updator
            {
                display: none!important;
            }
        }
    </style>

</head>
<body class="home">
<div class="site" id="page">
    <div class="utilityMenu">
        <div class="container">
            <div class="copyLeft pull-left ">Bangladeshi American Police Association — Karam Chowdhury, President
            </div>
            <div class="menu-utility-menu-container">
                <ul class="menu" id="utility-menu" style="">

                    <li class=" menu-item-567" id="menu-item-567"><a href="{{ route("contact_us") }}">Contact Us</a></li>


                    @if($user = Auth::user())
                        <div class="dropdown">
                            <button class="dropbtn2">Logout( {{ $user->name }} )</button>
                            <div class="dropdown-content">
                                <a href="{{ route('profile') }}">Profile</a>
                                <a href="{{ route('logout') }}">Logout</a>

                            </div>
                        </div>
                   @else
                        <li class="memberLogin"><a href="{{ route('login') }}">Member Login <i aria-hidden="true" class="fa fa-sign-in"></i></a></li>
                    @endif


                </ul>

                <div class="collapse" id="collapseExample">
                    <div class="card card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                    </div>
                </div>

            </div>
        </div>
    </div>
    <header class="">
        <div class="container">

            <div class="col-md-1 col-sm-2 col-xs-12">

                <div class="main-logo">
                    <a href="{{ URL::to('/') }}"><img alt="BAPA Logo" src="{{ URL::to('/public/images/front/bapa.png') }}"></a>
                </div>

		    </div>
			
			
            <div class="col-md-11 col-sm-10 col-xs-12 ">
{{--                <div class="main-logo">--}}
{{--                    <a href="{{ URL::to('/') }}"><img alt="BAPA Logo" src="{{ URL::to('/public/images/front/bapa.png') }}"></a>--}}
{{--                </div>--}}

                <!-- Static navbar -->
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>

                        </div>
                        <div id="navbar" class="navbar-collapse collapse">

                            <ul class="nav navbar-nav navbar-right">
                                <li class="active"><a href="{{ route('about_us') }}">About BAPA <span class="sr-only">(current)</span></a></li>

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Executives & Trustees <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <?php
                                        $board_members_categories = DB::select(DB::raw(" SELECT DISTINCT board_members_categories.`board_members_category_name`,
 board_members_categories.`id` from board_members_categories  inner JOIN board_members  on
 board_members.ref_board_members_category_id=board_members_categories.id where board_members_categories.board_members_category_active=1  "));

                                        ?>
                                        @foreach($board_members_categories as $categories)
                                            <li><a href="{{ route('executives_and_trustees', [$categories->board_members_category_name, $categories->id]) }}"> {{ $categories->board_members_category_name }} <i aria-hidden="true" class="fa fa-lock"></i></a></li>
                                        @endforeach

                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Resources <span class="caret"></span></a>
                                    <ul class="dropdown-menu">

                                        <li><a href="{{ route("f_employment") }}"> Employment </a></li>
                                        <li><a href="{{ route("f_education_and_scholarship") }}"> Education & Scholarship </a></li>
                                        <li><a href="{{ route("f_domestic_violence") }}"> Domestic Violence </a></li>

                                    </ul>
                                </li>
                                <li><a href="{{ route('news') }}">BAPA News</a></li>
                                <li><a href="{{ route("constitution_by_laws") }}">Constitution-Bylaws</a></li>
                                <li><a href="{{ route('around_the_world') }} ">Around the World</a></li>
                                <li class=" "><a href="{{ route('event') }}">Events</a></li>
                                <li><a href="{{ route('memory') }}">Gallery</a></li>
                                <li><a href="{{ route('vote') }}">Vote</a></li>
                                <li><a href="{{ route('shop') }}">Shop</a></li>

                                <li class="contact_us"><a href="{{ route('contact_us') }}">Contact Us</a></li>

                                @if($user = Auth::user())
{{--                                    <li  class="login_logout" ><a href="{{ route('logout') }}">Logout(   {{ $user->name }}) </a></li>--}}
                                    <li class="dropdown profile_updator">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Logout(   {{ $user->name }}) <span class="caret"></span></a>
                                        <ul class="dropdown-menu">

                                            <li><a href="{{ route("profile") }}"> Profile  </a></li>
                                            <li><a href="{{ route("logout") }}"> Logout </a></li>

                                        </ul>
                                    </li>
                                @else
                                    <li class="login_logout" ><a href="{{ route('login') }}">Member Login </a></li>
                                @endif



                            </ul>
                        </div><!--/.nav-collapse -->
                    </div><!--/.container-fluid -->
                </nav>

            </div>
        </div>
    </header>