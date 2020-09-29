<?php

namespace App\Http\Controllers\front;

use App\Models\Message;
use Illuminate\Http\Request;
use App\CustomClass\EventUtils;
use App\Http\Controllers\Controller;
use Validator;
use Illuminate\Support\Facades\DB;
use DateTime;
use DateTimeZone;
use URL;
use Illuminate\Support\Facades\Auth;

class FrontController extends Controller
{
    public $board_members_categories;

    public function __construct()
    {

       // $this->middleware('auth', ['only' => ['buy_tickets']]);
        //$this->middleware('some_other_middleware', ['except' => ['some_method'], 'only' => ['some_other_method', 'yet_another_method']]);
        $this->board_members_categories = DB::select(DB::raw(" SELECT DISTINCT board_members_categories.`board_members_category_name`, 
 board_members_categories.`id` from board_members_categories  inner JOIN board_members  on  
 board_members.ref_board_members_category_id=board_members_categories.id where board_members_categories.board_members_category_active=1  "));

    }


    public function index()
    {
        $msg_president = DB::table('msg_president')
            ->select('*')
            ->where("id",1)
            ->get();
        $msg_president=$msg_president[0];

        $general_secretary = DB::table('msg_gs')
            ->select('*')
            ->where("id",1)
            ->get();
        $general_secretary=$general_secretary[0];

        $vice_president = DB::table('msg_vp')
            ->select('*')
            ->where("id",1)
            ->get();
        $vice_president=$vice_president[0];



        $board_members_categories = $this->board_members_categories;
        return view('front/front_home', compact('board_members_categories','msg_president','general_secretary','vice_president'));

    }

    public function get_board_memmbers($category, $id)
    {

        $board_members_categories = $this->board_members_categories;
        $board_members = DB::select(DB::raw(" SELECT * from board_members where  	ref_board_members_category_id =$id and board_members_active=1  "));

        $welcome_message = " BAPA $category Members";
        return view('front/front_board_member', compact('board_members', 'welcome_message', 'board_members_categories'));

    }

    public function board_member_details($id)
    {

        $board_members_categories = $this->board_members_categories;
        $board_members = DB::select(DB::raw(" SELECT * from board_members where  id =$id and board_members_active=1  "));


        $welcome_message = " BAPA Board Members Details";
        return view('front/front_board_member_details', compact('board_members', 'welcome_message', 'board_members_categories'));

    }


    public function event_by_id($id)
    {
        $board_members_categories = $this->board_members_categories;

        $data = DB::select(DB::raw(" SELECT * from events where  id=$id and event_active=1  "));
        $data=$data[0];
        $welcome_message = " Events ";
        return view('front/events_by_id', compact( 'data','welcome_message', 'board_members_categories'));

    }

    public function buy_tickets(Request $request)
    {
      //  print_r(Auth::user()->user_type_id);die();
        $board_members_categories = $this->board_members_categories;

        $data=array();
        $event_title=$request->event_title;
        $adult_quantity=$request->adult_quantity;
        $adult_price=$request->adult_price;
        $adult_ticket_price= $adult_price*$adult_quantity;
        $children_quantity=$request->children_quantity;
        $children_price=$request->children_price;
        $children_ticket_price=$children_price*$children_quantity;
        $total=$adult_ticket_price+$children_ticket_price;

        //print_r($request->adult_price);
        $welcome_message = "Buy Tickets for ".$event_title;
        return view('front/buy_tickets', compact( 'total','adult_ticket_price','children_ticket_price','adult_quantity','adult_price','children_quantity','children_price','welcome_message', 'board_members_categories'));

    }
    public function event()
    {
        $board_members_categories = $this->board_members_categories;

        $welcome_message = " Events Calender";
        return view('front/events', compact( 'welcome_message', 'board_members_categories'));

    }

    public function get_events_json()
    {
        $events = DB::select(DB::raw(" SELECT * from events where   event_active=1  "));
        $arr_data=array();
        foreach($events as $row):

            $start_time=$row->event_starting_date."T".$row->event_starting_time."+06:00";
            $end_time=$row->event_ending_date."T".$row->event_ending_time ."+06:00";
            $url= URL::to('/event/'.$row->id);
            $arr=array(
                "id"=>$row->id,
                "title"=>$row->event_title,
                "start"=>$start_time,
                "end"=>$end_time,
                "url"=>$url
            );
           // {{ URL::to('/') }}/public/images/{{ $row->board_members_image_location }}
            array_push($arr_data,$arr);


        endforeach;

       return $arr_data;

    }


    public function get_events()
    {
        // Short-circuit if the client did not give us a date range.
        if (!isset($_GET['start']) || !isset($_GET['end'])) {
            die("Please provide a date range.");
        }

        // Parse the start/end parameters.
        // These are assumed to be ISO8601 strings with no time nor timeZone, like "2013-12-29".
        // Since no timeZone will be present, they will parsed as UTC.
        $range_start = $this->parseDateTime($_GET['start']);
        $range_end = $this->parseDateTime($_GET['end']);

        // Parse the timeZone parameter if it is present.
        $time_zone = null;
        if (isset($_GET['timeZone'])) {
            $time_zone = new DateTimeZone($_GET['timeZone']);
        }

        $get_json=$this->get_events_json();
        $json=json_encode($get_json);
        $input_arrays = json_decode($json, true);

        // Accumulate an output array of event data arrays.
        $output_arrays = array();
        foreach ($input_arrays as $array) {

            // Convert the input array into a useful Event object
            $event = new EventUtils($array, $time_zone);

            // If the event is in-bounds, add it to the output
            if ($event->isWithinDayRange($range_start, $range_end)) {
                $output_arrays[] = $event->toArray();
            }
        }

        // Send JSON to the client.
        echo json_encode($output_arrays);die();

    }



    // Date Utilities
//----------------------------------------------------------------------------------------------


// Parses a string into a DateTime object, optionally forced into the given timeZone.
    function parseDateTime($string, $timeZone = null)
    {
        $date = new DateTime(
            $string,
            $timeZone ? $timeZone : new DateTimeZone('UTC')
        // Used only when the string is ambiguous.
        // Ignored if string has a timeZone offset in it.
        );
        if ($timeZone) {
            // If our timeZone was ignored above, force it.
            $date->setTimezone($timeZone);
        }
        return $date;
    }


// Takes the year/month/date values of the given DateTime and converts them to a new DateTime,
// but in UTC.
    function stripTime($datetime)
    {
        return new DateTime($datetime->format('Y-m-d'));
    }


}


