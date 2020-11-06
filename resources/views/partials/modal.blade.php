<pre style="display:none;"></pre>
<!-- MODAL OVERLAY -->
<div class="modalOverlay d-none"></div>
<div class="modalN d-none" role="dialog" tabindex="-1">
    <section class="modalContainer p-3 pt-5 p-md-5 text-center">
        <button aria-label="Close" class="closeModal" type="button"><i class="fa fa-times"
                                                                       aria-hidden="true"></i></button>
        <img alt="BAPA Logo" id="modalLogo" src="{{ URL::to('/public/images/front/bapa.png') }}" width="200">
        <h2>Help the Families of Fallen COVID-19 Heroes</h2>
        <p>If you are interested to make a donation for the community people who are effected by COVID-19 please
            contact one of our Executives or one of our trustees.</p>
        <a class="blueBtn" href="{{ route("donate") }}">Donate Now <i aria-hidden="true"
                                                                     class="fa fa-chevron-circle-right"></i></a>
    </section>
</div>





<!-- MODAL OVERLAY -->
<script type="text/javascript">
    jQuery(window).on('load', function () {
        setTimeout(function () {
            jQuery('body').css('overflow', 'hidden');
            jQuery('.modalOverlay').removeClass('d-none');
            jQuery('.modalN').removeClass('d-none').addClass('open');
            jQuery('.modalN').focus();
        }, 2000);
    });

    jQuery(document).ready(function () {
        jQuery('.closeModal').on('click', function (e) {
            e.preventDefault();
            jQuery('body').css('overflow', 'auto');
            jQuery('.modalOverlay').addClass('d-none');
            jQuery('.modalN').addClass('d-none').removeClass('open');
        });
    });
    jQuery(document).keydown(function (e) {
        if (e.keyCode == 27) {
            console.log('escaped!');
            e.preventDefault();
            jQuery('body').css('overflow', 'auto');
            jQuery('.modalOverlay').addClass('d-none');
            jQuery('.modalN').addClass('d-none').removeClass('open');
        }
    });
</script>