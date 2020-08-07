<?php

namespace App\Http\Controllers\front;

use App\Models\Message;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Illuminate\Support\Facades\DB;

class FrontController extends Controller
{
    public $board_members_categories;

    public function __construct()
    {
        $this->board_members_categories = DB::select( DB::raw(" SELECT DISTINCT board_members_categories.`board_members_category_name`, 
 board_members_categories.`id` from board_members_categories  inner JOIN board_members  on  
 board_members.ref_board_members_category_id=board_members_categories.id where board_members_categories.board_members_category_active=1  ") );

    }



    public function index()
    {

        $board_members_categories=$this->board_members_categories;
        return view('front/front_home', compact('board_members_categories'));

    }

    public function get_board_memmbers($category,$id)
    {

        $board_members_categories=$this->board_members_categories;
        $board_members = DB::select( DB::raw(" SELECT * from board_members where  	ref_board_members_category_id =$id and board_members_active=1  ") );

        $welcome_message=" BAPA $category Members";
        return view('front/front_board_member', compact('board_members','welcome_message','board_members_categories'));

    }
    public function board_member_details($id)
    {

        $board_members_categories=$this->board_members_categories;
        $board_members = DB::select( DB::raw(" SELECT * from board_members where  id =$id and board_members_active=1  ") );




        $welcome_message=" BAPA Board Members Details";
        return view('front/front_board_member_details', compact('board_members','welcome_message','board_members_categories'));

    }


    public function event()
    {
        $board_members_categories=$this->board_members_categories;
        $events = DB::select( DB::raw(" SELECT * from events where   event_active=1  ") );

        $welcome_message=" Events Calender";
        return view('front/events', compact('events','welcome_message','board_members_categories'));

    }


}


