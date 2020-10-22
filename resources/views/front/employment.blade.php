@extends('front/front_inner_layout')

@section('main')



    <div class="container">

        <div class="row">
             &nbsp;
        </div>

        <div class="row">
            <div class="entry-content col-md-8">


                <?php echo $data->about_content; ?>

            </div>
            <div class="entry-content col-md-4">
                <div class=" homeCalendar">
                    @include('partials.calender')
                </div>
           </div>
        </div>





    </div>





@endsection





