@extends('front/front_inner_layout')

@section('main')



    <style>


        .wtn-main-wrapper .wtn-item {
            border: 1px solid #DDD;
            padding: 5px;
            height: 334px;
            margin-right: 10px;
            margin-bottom: 10px;
            width: 31.6%;
            text-align: left;
        }
        .wtn-main-wrapper .wtn-item {
            border: 1px solid #DDD;
            padding: 5px;
            min-height: 280px;
            margin-right: 5px;
            margin-bottom: 5px;
            width: 32.60%;
            text-align: left;
        }
        .wtn-main-wrapper .wtn-item img {
            border: 0px solid #FF0000;
            height: 150px;
            width: auto;
            margin-bottom: 5px;
        }


        .wtn-main-wrapper .wtn-item a {
            font-size: 16px;
            display: inline-block;
            border: 0px solid #000;
            width: 100%;
            outline: none;
            color: #111;
            font-weight: 600;
            line-height: 24px;
        }

        .wtn-main-wrapper .wtn-item p {
            border: 0px solid #000;
            margin: 0 !important;
            padding: 0 !important;
            color: #242424;
            line-height: 20px;
            min-height: 70px;
        }

        .wtn-main-wrapper .wtn-item span {
            font-size: 11px;
            display: inline-block;
            border: 0px solid #000;
            width: 100%;
            margin: 0px !important;
            padding: 0px !important;
            line-height: 20px;
        }
    </style>

    <br/>
    <div class="container">
       @if ($status=="ok" && $totalResults > 0)
        <div class="row col-md-12 col-xs-12 wtn-main-wrapper w3-row-padding w3-padding-16 w3-center">
            &nbsp;
            @foreach($articles as $row)
                <div class="col-md-4 col-sm-6 col-xs-12  wtn-item w3-quarter">
                    <img style="width:-moz-available;" src="  {{ $row->urlToImage }}">
                    <a href="{{ $row->url }}" target="_blank">   {{ $row->title }}  </a>
                    <p class="wtn-item-description">
                        <?php echo substr($row->description,0,80); ?>...        </p>
                    <span>
                 <?php echo $row->source->name ;?> |   <?php echo date("j F, Y", strtotime($row->publishedAt)) ; ?>     </span>
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





