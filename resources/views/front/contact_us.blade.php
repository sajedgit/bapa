@extends('front/front_inner_layout')

@section('main')

    <style>

        .contact{
            padding:0 4%;
            height: 400px;
            color: #fff;
        }
        .contact form {
            max-width: inherit;
            margin: 0 auto;
            padding: 15px;
        }
        .contact .form-group {

            padding-bottom: 43px;
        }
        .contact .col-md-3{
            background: #1b3065;
            padding: 4%;
            border-top-left-radius: 0.5rem;
            border-bottom-left-radius: 0.5rem;
            margin-top: 34px;
        }
        .contact .contact-info{
            margin-top:0;
        }
        .contact .contact-info img{
            margin-bottom: 15%;
        }
        .contact-info h2{
            margin-bottom: 10%;
        }
        .contact .col-md-9{
            background: #fff;
            padding: 3%;
            border-top-right-radius: 0.5rem;
            border-bottom-right-radius: 0.5rem;
        }
        .contact  .contact-form label{
            font-weight:600;
        }
        .contact .contact-form button{
            background: #25274d;
            color: #fff;
            font-weight: 600;
            width: 25%;
        }
        .contact  .contact-form button:focus{
            box-shadow:none;
        }
        .contact-info h2,  .contact-info h4
        {
            color: #fff;
        }
    </style>

    <div class="container">

        <div class="row">
            &nbsp;
        </div>

        <div class="row" style="padding: 10px;">



            <div class="container contact">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="contact-info text-center">
                            <i class="fa fa-envelope" style="font-size:50px"></i>
                            <h2>Contact Us</h2>
                            <p>E-mail : NYPDBAPA@GMAIL.COM</p>

                            <h3>Mailing Address</h3>

                            <p>  Bangladeshi American Police Association (BAPA)
                                P.O. Box 720321
                                Jackson Heights, NY 11372
                            </p>

                        </div>
                    </div>
                    <div class="col-md-9  col-sm-6 col-xs-12">
{{--                        <form action="" method="post">--}}
                        <div class="contact-form">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="fname">First Name:</label>
                                <div class="col-sm-10">
                                    <input type="text" required class="form-control" id="fname" placeholder="Enter First Name" name="fname">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="lname">Last Name:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="lname" placeholder="Enter Last Name" name="lname">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Email:</label>
                                <div class="col-sm-10">
                                    <input type="email"  required  class="form-control" id="email" placeholder="Enter email" name="email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="comment">Comment:</label>
                                <div class="col-sm-10">
                                    <textarea  required class="form-control" rows="5" id="comment"></textarea>
                                </div>
                            </div>
                            <div class="form-group" >
                                <div class="col-sm-offset-2 col-sm-10"> <br/>
                                    <button type="submit" class="btn btn-default">Submit</button>
                                </div>
                            </div>
                        </div>
{{--                        </form>--}}
                    </div>
                </div>
            </div>


        </div>





    </div>





@endsection





