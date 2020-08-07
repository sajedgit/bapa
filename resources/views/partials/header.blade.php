<!DOCTYPE html>

<html lang="en-US">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">


    <meta content="width=device-width, initial-scale=1" name="viewport">

    <title>BANGLADESHI AMERICAN POLICE ASSOCIATION</title>

    <link href="{{ URL::to('/public/css/front/style.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ URL::to('/public/css/front/bapa-styles.css') }}" media="all" rel="stylesheet" type="text/css">
    <link crossorigin="anonymous" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" rel="stylesheet">


    <script src="{{ URL::to('/public/js/front/jquery.js') }}" type="text/javascript"></script>
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

        .footerSocial i {
            font-size: 7em;
            margin-right: 10px;

        }
        .inner_banner{
            z-index: 0;
            height: 80px;
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
                <ul class="menu" id="utility-menu" style="display: block;">

                    <li class=" menu-item-567" id="menu-item-567"><a href="#/contact-us/">Contact Us</a></li>
                    <li class="memberLogin"><a href="{{ route('home') }}">Member Login <i aria-hidden="true"
                                                                                    class="fa fa-sign-in"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
    <header class="">
        <div class="container">
            <div class="row">
                <div class="main-logo">
                    <a href="{{ URL::to('/') }}"><img alt="BAPA Logo" src="{{ URL::to('/public/images/front/bapa.png') }}"></a>
                </div>

                <nav class="nav-wrapper">
                    <div class="menu-main-menu-container">
                        <ul class="menu" id="primary-menu">
                            <li class="mobile-search">
                                <form action="#/" id="searchform" method="get" role="search"><input class="search-field"
                                                                                                    id="s"
                                                                                                    name="s"
                                                                                                    placeholder="Type your search"
                                                                                                    title="Search for:"
                                                                                                    type="search"
                                                                                                    value="">
                                </form>
                                <span><i aria-hidden="true" class="fa fa-search"></i></span></li>
                            <li class="mobileAccount"><a href="#/my-account/">Member Login </a></li>


                            <li class="no-click has-dropdown menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-561"
                                id="menu-item-561">
                                <a>About BAPA</a>

                                <span><i aria-hidden="true" class="fa fa-angle-down"></i></span></li>
                            <li class="no-click has-dropdown menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-563"
                                id="menu-item-563">
                                <a>Executives & Trustees </a>
                                <ul class="sub-menu">
                                    @foreach($board_members_categories as $categories)
                                        <li class="" id="">
                                            <a href="{{ route('executives_and_trustees', [$categories->board_members_category_name, $categories->id]) }}">BAPA {{ $categories->board_members_category_name }} <i aria-hidden="true" class="fa fa-lock"></i></a>
                                        </li>
                                    @endforeach

                                </ul>
                                <span><i aria-hidden="true" class="fa fa-angle-down"></i></span></li>
                            <li class="no-click has-dropdown menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-564"
                                id="menu-item-564">
                                <a>Resources</a>
                                <ul class="sub-menu">


                                    <li><a href="#"> Employment </a></li>
                                    <li><a href="#"> Education & Scholarship </a></li>


                                </ul>
                                <span><i aria-hidden="true" class="fa fa-angle-down"></i></span></li>
                            <li class="no-click has-dropdown menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-565"
                                id="menu-item-565">
                                <a>Bapa News</a>

                                <span><i aria-hidden="true" class="fa fa-angle-down"></i></span></li>


                            <li class=" "><a href="#/political-endorsements/">Constitution-Bylaws</a></li>
                            <li class=" "><a href="#/political-endorsements/">Around the World</a></li>
                            <li class=" "><a href="{{ route('event') }}">Events</a></li>
                            <li class=" "><a href="#/political-endorsements/"> Shop</a></li>

                        </ul>
                    </div>
                    <div class="visible-xs visible-sm text-center" id="mobile-social">
                        <a href="https://www.facebook.com/bapanyc/" target="_blank">
                            <i class="fa fa-facebook-square" aria-hidden="true"></i>
                        </a>
                        <a href="https://www.twitter.com/NYCPDBAPA" target="_blank">
                            <i aria-hidden="true" class="fa fa-twitter"></i>
                        </a>
                        <a href="https://www.instagram.com/greatestdetectives/" target="_blank">
                            <i aria-hidden="true" class="fa fa-instagram"></i>
                        </a>
                    </div>
                </nav>
                <a class="mobile-menu" href="#/#">Menu<span class=""></span></a>
            </div>
        </div>
    </header>