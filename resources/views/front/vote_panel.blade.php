<?php
use App\Http\Controllers\front\FrontController;

$positions =  FrontController::get_position_by_vote_id($vote_id);


?>

<div class="col-md-10 col-md-offset-1 ">

    {{ Form::open([ 'method'  => 'post', 'route' => [ 'vote_submit' ]  ]) }}

    @csrf

    <?php  $counter=0; ?>
    @foreach($positions as $position)
        <?php  $counter++; ?>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                <span class="glyphicon glyphicon-circle-arrow-right"></span>
                <span>Vote For <b style="color:yellow;font-size: 25px;">{{ $position->position_name  }} </b></span>
                <span style="float: right; margin-top: 5px;color: darkred;">Max {{ $position->noc  }} Vote</span>
            </h3>
        </div>
        <div class="panel-body two-col">



            <div class="row">
             <?php $candidates =  FrontController::get_candidate_by_vote_and_position_id($vote_id,$position->id); ?>

                 @foreach($candidates as $candidate)
                     <?php $users=FrontController::get_name_by_user_id($candidate->user_id) ?>
                     <?php $hidden_val=$vote_id."_".$position->id."_".$candidate->user_id; ?>
                     <?php $class_name="position_".$counter ?>
                     <?php $limit=$position->noc ?>
                    <div class="col-md-6">
                        <div class="well well-sm">
                            <div class="checkbox">
                                <label>
                                    <input  class="{{ $class_name }}" type="checkbox" value="{{ $hidden_val }}" name="{{ $class_name }}[]">
                                     {{ $users[0]->name }}
                                </label>
                            </div>
                        </div>
                    </div>
                  @endforeach
            </div>




        </div>

    </div>

            <script>
                $(document).ready(function(){
                    var class_name= "<?php echo $class_name ?>";
                    var limit= "<?php echo $limit ?>";

                    $('input.'+class_name).on('change', function(evt) {

                        if($("input."+class_name+":checked").length > limit) {
                            this.checked = false;
                            alert("You can not vote more than "+limit+" person for this Position");
                        }

                        // if($("input."+class_name+":checked").length < limit) {
                        //     this.checked = true;
                        //     alert("You have to vote  "+limit+" person for this Position");
                        // }

                    });

                });

            </script>

    @endforeach

        <div class="row form-group text-center">
{{--            {{ Form::submit("Submit Vote", array('class' => 'btn btn-primary')) }}--}}
            <input type="hidden" name="counter" value="{{ $counter }}">
            <input style="color: #fff;background-color: #1b3065;" type="submit" name="SubmitVote" value="Submit Vote" class="btn btn-primary">

        </div>

        {!! Form::close() !!}

</div>