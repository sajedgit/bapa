<?php

namespace App\Http\Controllers\front;

use App\Models\Membership;
use App\Models\Product;
use App\Models\Setting;
use Illuminate\Http\Request;
use App\CustomClass\EventUtils;
use App\Http\Controllers\Controller;
use Validator;
use Illuminate\Support\Facades\DB;
use DateTime;
use DateTimeZone;
use URL;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\Auth\Guard;

use Illuminate\Support\Facades\Mail;
use App\Mail\SendMailable;
use App\Mail\SendEventMail;
use App\Mail\SendRegisterMail;
use App\Mail\SendEventDonate;


class FrontController extends Controller
{
    public $board_members_categories;

    public function __construct()
    {

        //  print_r(Auth::user());die();

        // $this->middleware('auth', ['only' => ['buy_tickets']]);
        //$this->middleware('some_other_middleware', ['except' => ['some_method'], 'only' => ['some_other_method', 'yet_another_method']]);
        $this->board_members_categories = DB::select(DB::raw(" SELECT DISTINCT board_members_categories.`board_members_category_name`, 
 board_members_categories.`id` from board_members_categories  inner JOIN board_members  on  
 board_members.ref_board_members_category_id=board_members_categories.id where board_members_categories.board_members_category_active=1  "));

    }


    public function payment()
    {
        //  print_r(Auth::user()->active);
        //Auth::logout();

        $board_members_categories = $this->board_members_categories;
        $settings = Setting::findOrFail(1);

        $user = Auth::user();
        $welcome_message = " Please Complete your payment ";
        return view('front/payment', compact('settings', 'user', 'welcome_message', 'board_members_categories'));
    }


    public function index()
    {

        if (isset($_REQUEST['checkoutId']) && isset($_REQUEST['transactionId'])) {
            return redirect()->route("after_payment", $_REQUEST);
        }

        $msg_president = DB::table('msg_president')
            ->select('*')
            ->where("id", 1)
            ->get();
        $msg_president = $msg_president[0];

        $general_secretary = DB::table('msg_gs')
            ->select('*')
            ->where("id", 1)
            ->get();
        $general_secretary = $general_secretary[0];

        $vice_president = DB::table('msg_vp')
            ->select('*')
            ->where("id", 1)
            ->get();
        $vice_president = $vice_president[0];


        $board_members_categories = $this->board_members_categories;
        return view('front/front_home', compact('board_members_categories', 'msg_president', 'general_secretary', 'vice_president'));

    }


    public function profile()
    {
        if ($user = Auth::user()) {
            $user_id = Auth::user()->id;
            $board_members_categories = $this->board_members_categories;
            $user = DB::select(DB::raw(" SELECT * from memberships where  id=$user_id  "));
            $user = $user[0];
            $status_items = array('1' => 'Active', '0' => 'Inactive');

            $welcome_message = "Profile Update";
            return view('front/profile', compact('welcome_message', 'status_items', 'user', 'board_members_categories'));
        } else {
            return redirect()->guest('login');
        }
    }


    public function profile_update(Request $request)
    {
        $id = Auth::user()->id;
        $profile = $request->profile;
        $user_type_id = $request->user_type_id;

        $image_name = $request->hidden_image;
        $image = $request->file('photo');

        if ($image != '') {
            $image_name = rand() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images/member'), $image_name);
        }


        $request->validate([
            'name' => 'required',
            'username' => 'required',
            'password' => 'min:6|required',
            'password_confirmation' => 'min:6|same:password',
            'email' => 'required',
            'active' => 'required'
        ]);

        $messages = [
            'password_confirmation.same' => 'Password Confirmation should match the Password',
        ];


        $form_data = array(
            'name' => $request->name,
            'username' => $request->username,
            'password' => bcrypt($request->password),
            'email' => $request->email,
            'photo' => $image_name,
            'user_type_id' => $user_type_id,
            'active' => $request->active,
            'updated_at' => date("Y-m-d")
        );


        Membership::whereId($id)->update($form_data);
        return redirect('profile')->with('success', 'Profile updated successfully ');


    }


    public function after_payment_success()
    {

        // print_r(unserialize($_REQUEST["order_data"][0]));
        $order_data = unserialize($_REQUEST["order_data"][0]);

        $order_id = $order_data["order_id"];
        $ref_membership_id = Auth::user()->id;
        // $ref_membership_id=35;
        $source = $order_data["source"];
        $net_amounts = $order_data["net_amounts"];
        $event_id = $order_data["event_id"];
        $items = $order_data["items"];

        $total_tickets = 0;
        $payment_type = "Online Payment";

        $details = "";
        foreach ($items as $data) {
            $details .= "\n".$data["item_name"] . ": " . $data["item_unit_price"] . " x " . $data["item_quantity"] . " = " . $data["item_total_money"] . " " . $data["item_currency"] . "\n";

            $total_tickets += $data["item_quantity"];
        }

        $payment_insert = DB::table('event_ticket_buyers')->insert(
            array(
                'ref_event_id' => $event_id,
                'ref_membership_id' => $ref_membership_id,
                'order_id' => $order_id,
                'source' => $source,
                'payment_type' => $payment_type,
                'details' => $details,
                'total_tickets' => $total_tickets,
                'total_price' => $net_amounts,
                'event_ticket_buyer_stored_datetime' => NOW()
            )
        );

        if ($payment_insert) {
            $this->send_mail($event_id, $ref_membership_id, $order_id, $source, $payment_type, $details, $total_tickets, $net_amounts);
            return redirect()->route("event/{id}", [$event_id])->with('success', 'Buy Tickets Successfully');
        } else
            echo "Payment not done Properly";


    }


    public function after_payment_success_free()
    {

        $adult_label = $_REQUEST["adult_label"];
        $adult_price = $_REQUEST["adult_price"];
        $adult_quantity = $_REQUEST["adult_quantity"];
        $adult_price_total = $adult_price*$adult_quantity;
        $currency="USD";
        $children_label = $_REQUEST["children_label"];
        $children_price = $_REQUEST["children_price"];
        $children_quantity = $_REQUEST["children_quantity"];
        $children_price_total = $children_price*$children_quantity;


        $event_id = $_REQUEST["event_id"];
        $ref_membership_id = Auth::user()->id;
        $order_id=0;
        $source = "Free";
        $payment_type = "Free";
        $details = "";
        $details .= "\n".$adult_label . ": " . $adult_price . " x " . $adult_quantity . " = " . $adult_price_total . " " .$currency . "\n";
        $details .= "\n".$children_label . ": " . $children_price . " x " . $children_quantity . " = " . $children_price_total . " " .$currency . "\n ";
        $total_tickets = $adult_quantity + $children_quantity;
        $net_amounts = $_REQUEST["total"];






        $payment_insert = DB::table('event_ticket_buyers')->insert(
            array(
                'ref_event_id' => $event_id,
                'ref_membership_id' => $ref_membership_id,
                'order_id' => $order_id,
                'source' => $source,
                'payment_type' => $payment_type,
                'details' => $details,
                'total_tickets' => $total_tickets,
                'total_price' => $net_amounts,
                'event_ticket_buyer_stored_datetime' => NOW()
            )
        );

        if ($payment_insert) {
            $this->send_mail($event_id, $ref_membership_id, $order_id, $source, $payment_type, $details, $total_tickets, $net_amounts);
            return redirect()->route("event/{id}", [$event_id])->with('success', 'Buy Tickets Successfully');
        } else
            echo "Payment not done Properly";


    }


    public function after_payment_success_register()
    {
        $order_data = unserialize($_REQUEST["order_data"][0]);

        // print_r($order_data);die();
        $order_id = $order_data["order_id"];
        $source = $order_data["source"];
        $net_amounts = $order_data["net_amounts"];
        $note = $order_data["note"];
        $note = explode("--**--", $note);
        $title = $note[0];
        $ref_membership_id = trim($note[1]);
        $items = $order_data["items"];
        $payment_type = "Online Payment";
        $renewal_date = date('Y-m-d', strtotime('+1 years'));
        $details = "";
        $details .= "\n  " . $title . "\n";
        foreach ($items as $data) {
            $details .= "\n".$data["item_name"] . ": " . $data["item_unit_price"] . " x " . $data["item_quantity"] . " = " . $data["item_total_money"] . " " . $data["item_currency"] . "\n";

        }


        $payment_insert = DB::table('membership_payments')->insert(
            array(
                'ref_membership_id' => $ref_membership_id,
                'membership_payment_ess' => 1,
                'membership_payment_details' => $details,
                'membership_payment_datetime' => NOW(),
                'membership_payment_amount' => $net_amounts,
                'membership_next_renewal_date' => $renewal_date,
                'membership_payment_creating_datetime' => NOW()
            )
        );


        if ($payment_insert) {
            $form_data = array(
                'ess_type' => $payment_type,
                'active' => 1,
            );
            $update_member = Membership::whereId($ref_membership_id)->update($form_data);

            if ($update_member) {
                $this->send_mail_register($ref_membership_id, $order_id, $source, $payment_type, $details, $net_amounts);
                return redirect()->route("profile")->with('success', 'Payment done Successfully');
            }

        } else
            echo "Payment not done Properly";


    }


    public function send_mail_register($ref_membership_id, $order_id, $source, $payment_type, $details, $net_amounts)
    {


        $user = DB::select(DB::raw(" SELECT * from memberships where  id=$ref_membership_id  "));
        $user = $user[0];
        $user_name = $user->name;
        $user_email = $user->email;
        $subject = "Payment Confirmation";
        $mail_to = $user_email;
        $cc = "nypdbapa@gmail.com";
        $bcc = "sajedaiub@gmail.com";


        Mail::to($mail_to)
            ->cc($cc)
            ->bcc($bcc)
            ->send(new SendRegisterMail($subject, $user_name, $order_id, $source, $payment_type, $details, $net_amounts));

    }


    public function after_payment_success_donate()
    {
        $order_data = unserialize($_REQUEST["order_data"][0]);

        $order_id = $order_data["order_id"];
        $source = $order_data["source"];
        $net_amounts = $order_data["net_amounts"];
        $note = $order_data["note"];
        $items = $order_data["items"];
        $payment_type = "Online Payment";
        $customer_email_address = $order_data["customer_email_address"];
        $customer_name = $order_data["given_name"];

        $details = "";
        $details .= "\n $note: \n";
        foreach ($items as $data) {
            $details .="\n". $data["item_name"] . ": " . $data["item_unit_price"] . " x " . $data["item_quantity"] . " = " . $data["item_total_money"] . " " . $data["item_currency"] . "\n";

        }


        $this->send_mail_donate($customer_email_address, $customer_name, $order_id, $source, $payment_type, $details, $net_amounts);
        return redirect()->route("donate")->with('success', 'Donate Done Successfully');


    }


    public function after_payment_success_product()
    {

        // print_r(unserialize($_REQUEST["order_data"][0]));
        // print_r(Auth::user());die();
        $order_data = unserialize($_REQUEST["order_data"][0]);

        $order_id = $order_data["order_id"];
        $ref_membership_id = Auth::user()->id;
        // $ref_membership_id=35;
        $source = $order_data["source"];
        $net_amounts = $order_data["net_amounts"];
        $note = $order_data["note"];
        $note = explode("--**--", $note);
        $feedback = $note[0];
        $event_id = trim($note[1]);
        $items = $order_data["items"];

        $total_tickets = 0;
        $payment_type = "Online Payment";

        $details = "";
        foreach ($items as $data) {
            $details .="\n". $data["item_name"] . ": " . $data["item_unit_price"] . " x " . $data["item_quantity"] . " = " . $data["item_total_money"] . " " . $data["item_currency"] . "\n";

            $total_tickets += $data["item_quantity"];
        }

        $details .= "\n Feedback: " . $feedback."\n";

        $payment_insert = DB::table('product_buyers')->insert(
            array(
                'ref_product_id' => $event_id,
                'ref_membership_id' => $ref_membership_id,
                'order_id' => $order_id,
                'source' => $source,
                'payment_type' => $payment_type,
                'details' => $details,
                'total_tickets' => $total_tickets,
                'total_price' => $net_amounts,
                'product_buyer_stored_datetime' => NOW()
            )
        );


        if ($payment_insert) {
            $this->update_product_data($event_id,$total_tickets);
            $this->send_mail_product($event_id, $ref_membership_id, $order_id, $source, $payment_type, $details, $total_tickets, $net_amounts);
            return redirect()->route("shop/{id}", [$event_id])->with('success', 'Buy Product Successfully');
        } else
            echo "Payment not done Properly";


    }

    public function update_product_data($event_id,$total_tickets)
    {
        $product_data = Product::findOrFail($event_id);
        $stock=$product_data->stock;
        $stock_update=$stock - $total_tickets;
        $form_data = array(
            'stock' => $stock_update,
        );


        Product::whereId($event_id)->update($form_data);
    }

    public function send_mail($event_id, $ref_membership_id, $order_id, $source, $payment_type, $details, $total_tickets, $net_amounts)
    {
        $event = DB::select(DB::raw(" SELECT * from events where  id=$event_id  "));
        $event = $event[0];
        $event_name = $event->event_title;


        $user = DB::select(DB::raw(" SELECT * from memberships where  id=$ref_membership_id  "));
        $user = $user[0];
        $user_name = $user->name;
        $user_email = $user->email;

        $subject = "Buying Ticket Confirmation";
        $mail_to = $user_email;
        $cc = "nypdbapa@gmail.com";
        $bcc = "hasnat288@gmail.com";


        Mail::to($mail_to)
            ->cc($cc)
            ->bcc($bcc)
            ->send(new SendEventMail($event_name, $subject, $user_name, $order_id, $source, $payment_type, $details, $total_tickets, $net_amounts));
    }


    public function send_mail_product($event_id, $ref_membership_id, $order_id, $source, $payment_type, $details, $total_tickets, $net_amounts)
    {
        $event = DB::select(DB::raw(" SELECT * from products where  id=$event_id  "));
        $event = $event[0];
        $event_name = $event->product_name;


        $user = DB::select(DB::raw(" SELECT * from memberships where  id=$ref_membership_id  "));
        $user = $user[0];
        $user_name = $user->name;
        $user_email = $user->email;
        $subject = "Buying Product Confirmation";
        $mail_to = $user_email;
        $cc = "nypdbapa@gmail.com";
        $bcc = "sajedaiub@gmail.com";


        Mail::to($mail_to)
            ->cc($cc)
            ->bcc($bcc)
            ->send(new SendEventMail($event_name, $subject, $user_name, $order_id, $source, $payment_type, $details, $total_tickets, $net_amounts));

    }


    public function send_mail_donate($customer_email_address, $customer_name, $order_id, $source, $payment_type, $details, $net_amounts)
    {

        $user_name = $customer_name;
        $user_email = $customer_email_address;
        $subject = "Donation Confirmation";
        $mail_to = $user_email;
        $cc = "nypdbapa@gmail.com";
        $bcc = "sajedaiub@gmail.com";


        Mail::to($mail_to)
            ->cc($cc)
            ->bcc($bcc)
            ->send(new SendEventDonate($subject, $user_name, $user_email, $order_id, $source, $payment_type, $details, $net_amounts));

    }


    public function get_board_memmbers($category, $id)
    {

        $board_members_categories = $this->board_members_categories;
        $board_members = DB::select(DB::raw(" SELECT * from board_members where  	ref_board_members_category_id =$id and board_members_active=1  "));

        $welcome_message = " BAPA $category ";
        return view('front/front_board_member', compact('board_members', 'welcome_message', 'board_members_categories'));

    }

    public function board_member_details($id)
    {

        $board_members_categories = $this->board_members_categories;
        $board_members = DB::select(DB::raw(" SELECT * from board_members where  id =$id and board_members_active=1  "));


        $welcome_message = " BAPA Board Members Details";
        return view('front/front_board_member_details', compact('board_members', 'welcome_message', 'board_members_categories'));

    }


    public function donate()
    {
        $board_members_categories = $this->board_members_categories;
        $settings = Setting::findOrFail(1);
        $welcome_message = "Donate Now";
        return view('front/donate', compact('board_members_categories', 'settings', 'welcome_message'));


    }


    public function event_by_id($id)
    {
        $board_members_categories = $this->board_members_categories;

        $data = DB::select(DB::raw(" SELECT * from events where  id=$id and event_active=1  "));
        $data = $data[0];
        $welcome_message = " Events ";
        return view('front/events_by_id', compact('data', 'welcome_message', 'board_members_categories'));

    }

    public function buy_tickets(Request $request)
    {
        //  print_r(Auth::user()->user_type_id);die();
        $board_members_categories = $this->board_members_categories;

        $data = array();
        $event_title = $request->event_title;
        $event_id = $request->event_id;
        $adult_quantity = $request->adult_quantity;
        $adult_price = $request->adult_price;
        $adult_ticket_price = $adult_price * $adult_quantity;
        $children_quantity = $request->children_quantity;
        $children_price = $request->children_price;
        $children_ticket_price = $children_price * $children_quantity;
        $total = $adult_ticket_price + $children_ticket_price;

        //print_r($request->adult_price);
        $welcome_message = "Buy Tickets for " . $event_title;
        return view('front/buy_tickets', compact('total', 'event_id', 'adult_ticket_price', 'children_ticket_price', 'adult_quantity', 'adult_price', 'children_quantity', 'children_price', 'welcome_message', 'board_members_categories'));

    }

    public function event()
    {
        $board_members_categories = $this->board_members_categories;

        $welcome_message = " Events Calender";
        return view('front/events', compact('welcome_message', 'board_members_categories'));

    }

    public function get_events_json()
    {
        $events = DB::select(DB::raw(" SELECT * from events where   event_active=1  "));
        $arr_data = array();
        foreach ($events as $row):

            $start_time = $row->event_starting_date . "T" . $row->event_starting_time . "+06:00";
            $end_time = $row->event_ending_date . "T" . $row->event_ending_time . "+06:00";
            $url = URL::to('/event/' . $row->id);
            $arr = array(
                "id" => $row->id,
                "title" => $row->event_title,
                "start" => $start_time,
                "end" => $end_time,
                "url" => $url
            );
            // {{ URL::to('/') }}/public/images/{{ $row->board_members_image_location }}
            array_push($arr_data, $arr);


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

        $get_json = $this->get_events_json();
        $json = json_encode($get_json);
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
        echo json_encode($output_arrays);
        die();

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


    public function about_us()
    {
        $board_members_categories = $this->board_members_categories;

        $data = DB::table('about_us')
            ->select('*')
            ->where("id", 1)
            ->get();
        $data = $data[0];

        $welcome_message = " About BAPA ";
        return view('front/about_us', compact('data', 'welcome_message', 'board_members_categories'));

    }


    public function employment()
    {
        $board_members_categories = $this->board_members_categories;

        $data = DB::table('employment')
            ->select('*')
            ->where("id", 1)
            ->get();
        $data = $data[0];

        $welcome_message = " Employment ";
        return view('front/employment', compact('data', 'welcome_message', 'board_members_categories'));

    }


    public function education_and_scholarship()
    {
        $board_members_categories = $this->board_members_categories;

        $data = DB::table('education_and_scholarship')
            ->select('*')
            ->where("id", 1)
            ->get();
        $data = $data[0];

        $welcome_message = " Education and Scholarship ";
        return view('front/employment', compact('data', 'welcome_message', 'board_members_categories'));

    }


    public function domestic_violence()
    {
        $board_members_categories = $this->board_members_categories;

        $data = DB::table('domestic_violence')
            ->select('*')
            ->where("id", 1)
            ->get();
        $data = $data[0];

        $welcome_message = " Domestic Violence ";
        return view('front/employment', compact('data', 'welcome_message', 'board_members_categories'));

    }


    public function news()
    {
        $board_members_categories = $this->board_members_categories;

        $data = DB::table('messages')
            ->select('*')
            ->where("message_active", 1)
            ->orderByDesc("id")
            ->get();


        $welcome_message = "";
        return view('front/news', compact('data', 'welcome_message', 'board_members_categories'));

    }

    public function news_by_id($id)
    {
        $board_members_categories = $this->board_members_categories;

        $data = DB::table('messages')
            ->select('*')
            ->where("id", $id)
            ->get();

        $data = $data[0];

        $welcome_message = "";
        return view('front/news_by_id', compact('data', 'welcome_message', 'board_members_categories'));

    }


    public function around_the_world()
    {
        $board_members_categories = $this->board_members_categories;

        $api_url = 'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a5ad82f335844a10826c136720cb84d6';
        $json_data = file_get_contents($api_url);
        $data = json_decode($json_data);
        // print_r($data->articles);
        $status = $data->status;
        $totalResults = $data->totalResults;
        $articles = $data->articles;
        $welcome_message = "Around The World";
        return view('front/around_the_world_news', compact('status', 'totalResults', 'articles', 'welcome_message', 'board_members_categories'));

    }


    public function contact_us()
    {
        $board_members_categories = $this->board_members_categories;

        $welcome_message = "Contact Us";
        return view('front/contact_us', compact('welcome_message', 'board_members_categories'));

    }


    public function contact_us_send(Request $request)
    {


        $this->validate(
            $request,
            [
                'fname' => 'required',
                'lname' => 'required',
                'email' => 'required|email',
                'g-recaptcha-response' => 'required',
            ],
            [
                'fname.required' => 'Please Provide First Name',
                'lname.required' => 'Please Provide Last Name',
                'email.required' => 'Please Provide Email Address',
                'email.email' => 'Not A Valid Email Address',
                'g-recaptcha-response.required' => 'Please check the the captcha form',
            ]
        );

//        if(isset($_POST['g-recaptcha-response'])){
//            $captcha=$_POST['g-recaptcha-response'];
//        }
//        if(!$captcha){
//            echo '<h2>Please check the the captcha form.</h2>';
//
//        }

        $fname = $request->fname;
        $lname = $request->lname;
        $email = $request->email;
        $comment = $request->comment;

        $mail_to = "nypdbapa@gmail.com";
        $cc = "hasnat288@gmail.com";
        $bcc = "sajedaiub@gmail.com";

//        $mail_to = "sajedaiub@gmail.com";
//        $cc = "sajedaiub@gmail.com";
//        $bcc = "sajedaiub@gmail.com";


        Mail::to($mail_to)
            ->cc($cc)
            ->bcc($bcc)
            ->send(new SendMailable($fname, $lname, $email, $comment));

        return redirect()->route("contact_us")->with('success', 'Email has just sent');
        //return 'Email has just sent';
    }


    public function constitution_by_laws()
    {
        if ($user = Auth::user()) {

            $board_members_categories = $this->board_members_categories;

            $welcome_message = "Constitution Bylaws";
            return view('front/constitution_by_laws', compact('welcome_message', 'board_members_categories'));
        } else {
            return redirect()->guest('login');
        }


    }

    public function DownloadByLawPdf()
    {
        if ($user = Auth::user()) {
            //PDF file is stored under project/public/download/info.pdf
            $file = public_path() . "/download/bylaw.pdf";

            $headers = array(
                'Content-Type: application/pdf',
            );

            return response()->download($file, 'bylaw.pdf', $headers);
        } else {
            return redirect()->guest('login');
        }

    }


    public function vote_by_id($id)
    {

        if ($user = Auth::user()) {
            $board_members_categories = $this->board_members_categories;
            $vote_today = DB::select(DB::raw(" SELECT * from vote_details where id = $id   "));

            //$upcoming_vote = DB::select(DB::raw(" SELECT * from vote_details where voting_date > CURDATE() and status=1  "));

            $vote_id = $vote_today[0]->id;
            $voter_id = $user->id;
            $is_vote_submit = DB::select(DB::raw(" SELECT * from vote_count where vote_id= $vote_id and voter_id=$voter_id  "));

            $welcome_message = "Vote";

            if (count($is_vote_submit) > 0) {
                return view('front/vote_done_check', compact('welcome_message', 'board_members_categories', 'vote_today'));
            } else {
                return view('front/Vote', compact('welcome_message', 'board_members_categories', 'vote_today'));
            }


        } else {
            return redirect()->guest('login');
        }

    }


    public function vote()
    {

        if ($user = Auth::user()) {
            $board_members_categories = $this->board_members_categories;
            $vote_today = DB::select(DB::raw(" SELECT * from vote_details where voting_date = CURDATE() and status=1 order by start_time asc limit 1  "));

            if (count($vote_today) > 0) {
                $vote_id = $vote_today[0]->id;
                $voter_id = $user->id;
                $is_vote_submit = DB::select(DB::raw(" SELECT * from vote_count where vote_id= $vote_id and voter_id=$voter_id  "));

                $welcome_message = "Vote";

                if (count($is_vote_submit) > 0) {
                    return view('front/vote_done_check', compact('welcome_message', 'board_members_categories', 'vote_today'));
                } else {
                    return view('front/vote', compact('welcome_message', 'board_members_categories', 'vote_today'));
                }
            } else {
                $welcome_message = "Vote";
                $msg = "There are no vote active today";
                return view('front/vote_no_vote', compact('welcome_message', 'board_members_categories', 'msg'));
            }


        } else {
            return redirect()->guest('login');
        }

    }


    public function vote_submit()
    {
        //print_r($_REQUEST);die();
        $counter = $_REQUEST["counter"];
        for ($i = 1; $i <= $counter; $i++) {
            $arr = $_REQUEST["position_" . $i];

            foreach ($arr as $data) {
                //$is_vote_done=$this->is_vote_done($data) ;
                $this->insert_vote($data);
            }

        }

        return redirect('vote_submit_done');


    }

    public function vote_submit_done()
    {
        $board_members_categories = $this->board_members_categories;

        $welcome_message = "Vote Submit";
        return view('front/vote_submit', compact('welcome_message', 'board_members_categories'));
    }


    public function insert_vote($data)
    {
        $arr = explode("_", $data);
        $vote_id = $arr[0];
        $position_id = $arr[1];
        $candidate_id = $arr[2];

        $user = Auth::user();
        $voter_id = $user->id;

        $vote_insert = DB::select(DB::raw("INSERT INTO vote_count (vote_id, vote_position_id, vote_candidate_id,voter_id ) VALUES ($vote_id, $position_id, $candidate_id, $voter_id)"));
    }

    public function shop()
    {
        $board_members_categories = $this->board_members_categories;

        $products = DB::select(DB::raw(" SELECT * from products where  status=1  "));
        $welcome_message = "Shop";
        return view('front/shop', compact('welcome_message', 'board_members_categories', 'products'));

    }

    public function shop_by_id($id)
    {
        $board_members_categories = $this->board_members_categories;

        $data = DB::select(DB::raw(" SELECT * from products where  id=$id and status=1  "));
        $data = $data[0];
        $welcome_message = " Shop ";
        return view('front/shop_by_id', compact('data', 'welcome_message', 'board_members_categories'));

    }


    public function memory()
    {
        $board_members_categories = $this->board_members_categories;

        $memories = DB::select(DB::raw(" SELECT * from memories where memories_active=1 order by id desc   "));
        $welcome_message = "Gallery";
        return view('front/memory', compact('welcome_message', 'board_members_categories', 'memories'));

    }


    public function memory_photo_by_id($memory_name, $id)
    {
        $board_members_categories = $this->board_members_categories;

        $memory_photo = DB::select(DB::raw(" SELECT * from memories_photos where ref_memories_id=$id order by id desc  "));
        $welcome_message = "Gallery Photo of " . $memory_name;
        return view('front/memory_photo_by_id', compact('welcome_message', 'board_members_categories', 'memory_name', 'memory_photo'));

    }


//    public function buy_products(Request $request)
//    {
//        //  print_r(Auth::user()->user_type_id);die();
//        $board_members_categories = $this->board_members_categories;
//
//        $data = array();
//        $event_title = $request->event_title;
//        $event_id = $request->event_id;
//        $adult_quantity = $request->adult_quantity;
//        $adult_price = $request->adult_price;
//        $adult_ticket_price = $adult_price * $adult_quantity;
//        $children_quantity = $request->children_quantity;
//        $children_price = $request->children_price;
//        $children_ticket_price = $children_price * $children_quantity;
//        $total = $adult_ticket_price + $children_ticket_price;
//
//        //print_r($request->adult_price);
//        $welcome_message = "Buy Tickets for " . $event_title;
//        return view('front/buy_products', compact('total','event_id', 'adult_ticket_price', 'children_ticket_price', 'adult_quantity', 'adult_price', 'children_quantity', 'children_price', 'welcome_message', 'board_members_categories'));
//
//    }


    public static function get_position_by_vote_id($id)
    {
        $positions = DB::select(DB::raw(" SELECT * from vote_position where vote_id =$id and status=1  "));
        return $positions;
    }


    public static function get_candidate_by_vote_and_position_id($vote_id, $position_id)
    {
        $candidates = DB::select(DB::raw(" SELECT * from vote_candidate where vote_id =$vote_id and vote_position_id =$position_id and status=1  "));
        return $candidates;
    }


    public static function get_name_by_user_id($user_id)
    {
        $users = DB::select(DB::raw(" SELECT * from memberships where id =$user_id   "));
        return $users;
    }


    public static function upcoming_vote()
    {

        $upcoming_vote = DB::select(DB::raw(" SELECT * from vote_details where voting_date > CURDATE() and status=1 order by start_time asc   "));
        return $upcoming_vote;
    }


}


