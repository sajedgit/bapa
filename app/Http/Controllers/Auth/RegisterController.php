<?php

namespace App\Http\Controllers\Auth;

use App\Membership;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{


    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/payment';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:memberships',
            'email' => 'required|string|email|max:255|unique:memberships',
            'password' => 'required|string|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
		$user_type_id=(isset($data['user_type_id']))?$data['user_type_id']:2;
		//print_r($data['ess_type']);die();
        $members=Membership::create([
            'user_type_id' => $user_type_id,
            'ess_type' => $data['ess_type'],
            'ess_id' => $data['ess_id'],
            'name' => $data['name'],
            'username' => $data['username'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
            'active' => 0,
        ]);

//        Mail::send('emails.welcome', $data, function($message) use ($data)
//        {
//            $message->from('no-reply@site.com', "Site name");
//            $message->subject("Welcome to site name");
//            $message->to($data['email']);
//        });

        return $members;
    }
}
