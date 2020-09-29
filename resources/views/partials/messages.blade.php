<section class="sectionPad  ">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-8 homeNews">

                <div class="msg">
                    <h3 style="background-image: url(#/wp-content/themes/DEA/images/bapa-union-news-bg.jpg);">
                        <img
                                alt="Latest News Icon"
                                src="{{ URL::to('/public/images/front/bapa-homepage-latest-news-icon.jpg') }}">
                        Message from BAPA President
                    </h3>
                    <div class="newsEvent">
                        <span class="date">
                            <?php
                            $date=date_create($msg_president->msg_date);
                            echo date_format($date,"F j, Y");
                            ?>
                        </span>
                        <h5><?php echo $msg_president->title; ?></h5>
                        <div class="eventCopy" style="width: 100%;text-align: justify;">

                            <p>

                                {{ substr($msg_president->description, 0,  200) }}
                                @if (strlen($msg_president->description) > 200)
                                    <span id="p_dots">[...]</span>
                                    <span id="p_more" style="display: none;">{{ substr($msg_president->description, 200) }}</span>
                                @endif
                            </p>

                        </div>

                    </div>


                    <a id="p_myBtn"  onclick="p_myFunction()" class="blueBtn"> Read more
                        <i aria-hidden="true" class="fa fa-chevron-circle-right"></i>
                    </a>

                </div>

                <div class="msg">
                    <h3 style="background-image: url(#/wp-content/themes/DEA/images/bapa-union-news-bg.jpg);">
                        <img
                                alt="Latest News Icon"
                                src="{{ URL::to('/public/images/front/bapa-homepage-latest-news-icon.jpg') }}">
                        Message from BAPA Vice President
                    </h3>
                    <div class="newsEvent">
                        <span class="date">
                            <?php
                            $date=date_create($vice_president->msg_date);
                            echo date_format($date,"F j, Y");
                            ?>
                        </span>
                        <h5><?php echo $msg_president->title; ?></h5>
                        <div class="eventCopy" style="width: 100%;text-align: justify;">

                            <p>

                                {{ substr($vice_president->description, 0,  200) }}
                                @if (strlen($vice_president->description) > 200)
                                    <span id="vp_dots">[...]</span>
                                    <span id="vp_more" style="display: none;">{{ substr($vice_president->description, 200) }}</span>
                                @endif
                            </p>

                        </div>

                    </div>


                    <a id="vp_myBtn"  onclick="vp_myFunction()" class="blueBtn"> Read more
                        <i aria-hidden="true" class="fa fa-chevron-circle-right"></i>
                    </a>
                </div>

                <div class="msg">
                    <h3 style="background-image: url(#/wp-content/themes/DEA/images/bapa-union-news-bg.jpg);">
                        <img
                                alt="Latest News Icon"
                                src="{{ URL::to('/public/images/front/bapa-homepage-latest-news-icon.jpg') }}">
                        Message from BAPA General Secretary
                    </h3>
                    <div class="newsEvent">
                        <span class="date">
                            <?php
                            $date=date_create($general_secretary->msg_date);
                            echo date_format($date,"F j, Y");
                            ?>
                        </span>
                        <h5><?php echo $general_secretary->title; ?></h5>
                        <div class="eventCopy"  style="width: 100%;text-align: justify;">

                            <p>

                                {{ substr($general_secretary->description, 0,  200) }}
                                @if (strlen($general_secretary->description) > 200)
                                    <span id="gs_dots">[...]</span>
                                    <span id="gs_more" style="display: none;">{{ substr($general_secretary->description, 200) }}</span>
                                @endif
                            </p>

                        </div>

                    </div>


                    <a id="gs_myBtn"  onclick="gs_myFunction()" class="blueBtn"> Read more
                        <i aria-hidden="true" class="fa fa-chevron-circle-right"></i>
                    </a>

                </div>

            </div>

            <div class="col-xs-12 col-sm-5 col-md-4 homeCalendar">
                <div class="calendarWrapper">
                    <h3><img alt="Calendar Icon"
                             src="{{ URL::to('/public/images/front/bapa-homepage-calendar-icon.jpg') }}">
                        Calendar</h3>
                    <div class="calendarEvent">
                        <div class="day">Sep<span>02</span></div>
                        <a href="#/events/40th-anniversary-of-the-nypd-class-of-1980-company-5/">40th
                            Anniversary of the NYPD Class of 1980, Company 5</a>
                    </div>
                    <div class="calendarEvent">
                        <div class="day">Oct<span>04</span></div>
                        <a href="#/events/new-york-state-shields-memorial-breakfast/">New York State Shields
                            Memorial Breakfast</a>
                    </div>
                    <a class="blueBtn" href="{{ route('event') }}">Full Calendar <i aria-hidden="true"
                                                                         class="fa fa-chevron-circle-right"></i></a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-5 col-md-4 homeBadge pull-right">
                <img alt="" src="{{ URL::to('/public/images/front/bapa.png') }}">
            </div>
        </div>
    </div>
</section>


<script>
    function p_myFunction() {
        var dots = document.getElementById("p_dots");
        var moreText = document.getElementById("p_more");
        var btnText = document.getElementById("p_myBtn");

        if (dots.style.display === "none") {
            dots.style.display = "inline";
            btnText.innerHTML = "Read more";
            moreText.style.display = "none";
        } else {
            dots.style.display = "none";
            btnText.innerHTML = "Read less";
            moreText.style.display = "inline";
        }
    }


    function vp_myFunction() {
        var dots = document.getElementById("vp_dots");
        var moreText = document.getElementById("vp_more");
        var btnText = document.getElementById("vp_myBtn");

        if (dots.style.display === "none") {
            dots.style.display = "inline";
            btnText.innerHTML = "Read more";
            moreText.style.display = "none";
        } else {
            dots.style.display = "none";
            btnText.innerHTML = "Read less";
            moreText.style.display = "inline";
        }
    }

    function gs_myFunction() {
        var dots = document.getElementById("gs_dots");
        var moreText = document.getElementById("gs_more");
        var btnText = document.getElementById("gs_myBtn");

        if (dots.style.display === "none") {
            dots.style.display = "inline";
            btnText.innerHTML = "Read more";
            moreText.style.display = "none";
        } else {
            dots.style.display = "none";
            btnText.innerHTML = "Read less";
            moreText.style.display = "inline";
        }
    }



</script>