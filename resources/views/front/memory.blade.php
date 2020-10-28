@extends('front/front_inner_layout')

@section('main')

    <style>
        .gallery
        {
            display: inline-block;
            margin-top: 20px;
        }
        a.thumbnail img {
            height: 250px;
            /*width: 100%;*/
            object-fit: cover;
        }
        .galery_block
        {
            background: #fff;
            padding: 9px 7px 20px;
            margin: 10px auto;
        }
        .text-muted
        {

            padding: 13px;
            color: #000;
            border-radius: 4px;
            font-size: 14px;
        }
    </style>

    <div class="container">



        <div class="row">

            <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
            <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
            <script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>

            <div class="container">
                <div class="row">
                    <div class='list-group gallery col-sm-12 col-xs-12 col-md-12 col-lg-12'>

                        @foreach($memories as $memory)
                            <div class='col-sm-4 col-xs-12 col-md-3 col-lg-3 galery_block'>
                                <a class="thumbnail fancybox" rel="ligthbox" href="{{ URL::to('memory_photo/'.$memory->memories_name.'/'.$memory->id) }}">
                                    <img class="img-responsive" alt="" src="{{ asset($memory->memories_thumb) }}" />

                                </a>
                                <div class='text-center'>
                                    <small class='text-muted'><a href="{{ URL::to('memory_photo/'.$memory->memories_name.'/'.$memory->id) }}">Album: {{ $memory->memories_name }}</a></small>
                                </div> <!-- text-right / end -->
                            </div> <!-- col-6 / end -->

                        @endforeach





                    </div> <!-- list-group / end -->
                </div> <!-- row / end -->
            </div> <!-- container / end -->

<script>
    $(document).ready(function(){
        //FANCYBOX
        //https://github.com/fancyapps/fancyBox
        $(".fancybox").fancybox({
            openEffect: "none",
            closeEffect: "none"
        });
    });

</script>

        </div>





    </div>





@endsection





