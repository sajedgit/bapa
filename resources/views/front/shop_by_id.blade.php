@extends('front/front_inner_layout')

@section('main')

<style>
    .buy_tickets
    {
        border: 1px solid #1c294e;
        background-color: #e9e5e1;
    }
    .buy_tickets div.row
    {

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

        <div class="col-sm-12 col-md-12 col-xs-12">

            <div class="thumbnail" style="border:none; background:white;">

                <div class="col-sm-4 col-md-4 col-xs-12 image-container">
                    <img src="{{ URL::to('/') }}/public/images/product/{{ $data->photo }}" style="margin: 10px;" />
                </div>

                <div class="col-sm-5 col-md-5 col-xs-12">

                    <h3>{{ $data->product_name }}</h3>
                    <p> <span><b>Details: </b>{{ $data->product_description }}</span> </p>
                    <p> <span><b>Price: </b>${{ $data->price }}</span> </p>
                    <p> <span><b>Stock </b>{{ $data->stock }}</span> </p>



                </div>
                <div class="col-sm-3 col-md-3 col-xs-12">

                    <div class="buy_tickets text-center">

                        <h3>Buy Product</h3>

                        <form class="form-container" method="post" action="{{ URL::to('/') }}/sq_payment/checkout_product.php">

                        @csrf

                        <input type="hidden"    value=" {{ $data->product_name }}" name="product_title">
                        <input type="hidden"    value=" {{ $data->id }}" name="product_id">
                        <div class="row">
                            <div class="col-xs-6">
                                <span>Quantity:</span>
                            </div>
                            <div class="col-xs-4">
                                <input type="number" min="0"   value="1" name="product_quantity">
                                <input type="hidden" min="0"   value="{{ $data->price }}.00" name="product_price">
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-xs-12">
                                <span>Comments/Feedback:</span>
                            </div>
                            <div class="col-xs-12">
                                <textarea name="product_feedback" placeholder="Comments/Feedback" ></textarea>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <p><button type="submit" class="btn btn-primary">Buy Product</button></p>

                            </div>
                        </div>

                        </form>

                    </div>

                </div>
            </div>

        </div>


    </div>
    </div>


@endsection





