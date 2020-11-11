<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;

use Auth;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::ADMIN;
    public $board_members_categories;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
	
	
	public function logout(Request $request)
	{
		$this->guard()->logout();

		$request->session()->invalidate();

		return $this->loggedOut($request) ?: redirect('/login');
	}


    public function login()
    {

        $welcome_message = " Login ";

        return view('auth.login',compact('welcome_message'));
    }

    public function authenticate(Request $request)
    {
       // $this->check_is_active($request->email, $request->password);

        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        $credentials = $request->only('email', 'password');


        if (Auth::attempt($credentials)) {
            if(Auth::user()->active==1)
            {
                return redirect()->intended('/');
            }
            else
            {
                $this->guard()->logout();
                $request->session()->invalidate();
                return redirect('login')->with('error', 'You are not active user. Please renew your subscription or contact with <b>nypdbapa@gmail.com</b>');
            }


        }

        return redirect('login')->with('error', 'Oppes! You have entered invalid credentials');
    }

    public function check_is_active( $email, $password )
    {
//        $password=    \Hash::make($password);
//        echo " SELECT * from memberships where email='$email' and password='$password' and active=1  <br/> ";
//       // $active_user = DB::select(DB::raw(" SELECT count(*) as active_user from memberships where email='$email' and password='$password' and active=1   "));
//        $active_user = DB::select(DB::raw(" SELECT * from memberships where email='$email' and password='$password' and active=1   "));
//        print_r($active_user);die();

    }




}
