
@include('partials.header')



<div class="site-content" id="content">

    <div class="utilityMenu inner_banner">
        <div class="container text-center">
            <div class="welcome_msg">
                <?php
                if(isset($welcome_message))
                    echo $welcome_message;
                ?>
            </div>

        </div>
    </div>


    <div class="container-fluid">

        @yield('main')

    </div>



</div><!-- #content -->


@include('partials.footer')

