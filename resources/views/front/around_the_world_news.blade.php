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
            min-height: 390px;
        }
        .blog-box-content h4 a {
            font-size: 15px;
            padding: 0px 0 0px;
            text-transform: inherit;
            color: #2b2b2b;
            text-decoration: none;
            font-weight: bold;

        }
        .blog-box-content h4:hover {
            color:#000;
            text-decoration:none;

        }

        .blog-box-content {
            padding: 0 23px 0px;
        }
        .blog-box-text h4 a {
            color: #333;
        }
        .wtn-main-wrapper
        {
            /*margin: 0px;*/
            /*padding: 0px;*/
        }
    </style>

    <br/>
    <div class="container">
       @if ($status=="ok" && $totalResults > 0)
        <div class="row col-md-12 col-xs-12 wtn-main-wrapper ">
            @foreach($articles as $row)
{{--                <div class="col-xs-12 col-sm-6  col-md-4   wtn-item w3-quarter">--}}
{{--                    <img class="img-responsive  center-block d-block mx-auto" src="  {{ $row->urlToImage }}">--}}
{{--                    <a href="{{ $row->url }}" target="_blank">   {{ $row->title }}  </a>--}}
{{--                    <p class="wtn-item-description">--}}
{{--                        <?php echo substr($row->description,0,80); ?>...        </p>--}}
{{--                    <span>--}}
{{--                        <?php echo $row->source->name ;?> |   <?php echo date("j F, Y", strtotime($row->publishedAt)) ; ?>--}}
{{--                    </span>--}}
{{--                </div>--}}

                <div class="col-xs-12 col-sm-6 col-md-4">
                    <div class="blog-box">

                        <div class="blog-box-content">
                            <img class="img-responsive  center-block d-block mx-auto" src="  {{ $row->urlToImage }}">
                            <h4><a href="{{ $row->url }}" target="_blank">   {{ $row->title }}  </a></h4>


                            <p>    <?php echo substr($row->description,0,150); ?>...  </p>
                            <span>
                                <?php echo $row->source->name ;?> |   <?php echo date("j F, Y", strtotime($row->publishedAt)) ; ?>
                           </span>
                        </div>
                    </div>
                </div>
            @endforeach



        </div>
     @else
        <div class="row text-center" style="padding: 50px;">
            <h3>No News found to show</h3>
        </div>
     @endif





    </div>





@endsection





