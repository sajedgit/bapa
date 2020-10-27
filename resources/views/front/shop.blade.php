

@extends('front/front_inner_layout')

@section('main')

    <style>

        .block {
            margin: 20px;
            border-radius: 4px;
            width: 280px;
            min-height: 430px;
            background: #fff;
            padding: 23px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            box-shadow: 0 2px 55px rgba(0,0,0,0.1);
        }
        .top {
            border-bottom: 1px solid #e5e5e5;
            padding-bottom: 10px;
        }
        .top ul {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
        }
        .top a {
            color: #9e9e9e;
        }
        .top a:hover {
            color: #c7ccdb;
        }
        .converse {
            padding: 2px 10px;
            border-radius: 20px;
            text-transform: uppercase;
            font-size: 14px;
        }
        .middle {
            margin-bottom: 40px;
        }
        .middle img {
            width: 100%;
        }
        .bottom {
            text-align: center;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
            -webkit-box-flex: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;
        }
        .heading {
            font-size: 17px;
            text-transform: uppercase;
            margin-bottom: 5px;
            letter-spacing: 0;
        }
        .info {
            font-size: 14px;
            color: #969696;
            margin-bottom: 10px;
        }
        .style {
            font-size: 16px;
            margin-bottom: 20px;
        }
        .old-price {
            color: #f00;
            text-decoration: line-through;
        }

    </style>

    <br>


    <div class="container">
        <div class="row">

            <div class="row text-center col-md-12">

                @if (session('success'))
                    <div class="alert alert-success">
                        {{ session('success') }}
                    </div>
                @endif

            </div>

            @foreach($products as $product)
                <div class="col-sm-4 col-md-3 col-xs-12">

                    <div class="block">

                        <div class="middle">
                            <img src="{{ URL::to('/') }}/public/images/product/{{ $product->photo }}" alt="pic"   />
                        </div>

                        <div class="bottom">
                            <div class="heading">{{ $product->product_name }}</div>
                            <div class="info">{{ $product->product_description }}</div>
                            <div class="style">Stock: {{ $product->stock }}</div>
                            <div class="price">${{ $product->price }} </div>
                            <div class="row text-center">
                                <p><a href="{{ URL::to('shop/'.$product->id) }}" class="btn btn-primary">Buy Now</a></p>

                            </div>

                        </div>


                    </div>


                </div>
            @endforeach


        </div>
    </div>


@endsection





