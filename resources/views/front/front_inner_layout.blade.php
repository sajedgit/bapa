
@include('partials.header')



<div class="site-content" id="content">

    <div class="utilityMenu inner_banner">
        <div class="container text-center">
            <div style=" padding: 20px;font-size: 25px;">
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

