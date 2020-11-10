@extends('front/front_inner_layout')

@section('main')

    <style>

        .site-heading h3{
            font-size : 40px;
            margin-bottom: 15px;
            text-transform: uppercase;
            font-weight: 600;
        }
        .border {
            background: #d1360e;
            height: 2px;
            width: 165px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 25px;
        }
        /* Blog-CSS */
        .blog-box {
            padding: 0 0px;
            transition: .5s;
            border: 1px solid #e2e2e2;
            margin-bottom: 30px;
            min-height: 160px;
        }
        .blog-box-content h4 a {
            font-size: 20px;
            padding: 0px 0 0px;
            text-transform: uppercase;
            color:#2b2b2b;
            text-decoration:none;

        }
        .blog-box-content h4:hover {
            color:#000;
            text-decoration:none;

        }

        .blog-box-content {
            padding: 0 20px 20px;
        }
        .blog-box-text h4 a {
            color: #333;
        }


    </style>

    <div class="container">

        <div class="row">
            &nbsp;
        </div>

        <div class="row">


            <div class="blog-section paddingTB60 ">
                <div class="container">
                    <div class="row">
                        <div class="site-heading text-center">
                            <h3>BAPA News</h3>

{{--                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt <br> ut labore et dolore magna aliqua. Ut enim ad minim </p>--}}
{{--                            --}}
                            <div class="border"></div>
                        </div>
                    </div>
                    <div class="row text-center">


                        <div class="col-xs-12">
                            <div class="blog-box">

                                <div class="blog-box-content">
{{--                                    <h4><a href="#">quis porta tellus dictum</a></h4>--}}
                                    <h4></h4>
                                    <p> <?php echo  $data->message_details ?></p>

                                </div>
                            </div>
                        </div> <!-- End Col -->


                    </div>
                </div>
            </div>

        </div>





    </div>





@endsection





