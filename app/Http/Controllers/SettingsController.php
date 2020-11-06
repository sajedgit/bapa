<?php

namespace App\Http\Controllers;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SettingsController extends Controller
{
	
	public function __construct()
    {
        $this->middleware('auth');
    }
	
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $data = Setting::findOrFail(1);
      return view('Setting/edit', compact('data'));
    }
 
  
    public function update(Request $request, $id)
    {

        $request->validate([
            'donate_amount'    =>  'required',
            'registration_fee'    =>  'required',
        ]);


        $form_data = array(
            'donate_amount'       =>   $request->donate_amount,
            'registration_fee'       =>   $request->registration_fee
        );
  
        Setting::whereId($id)->update($form_data);

        return redirect('settings')->with('success', 'Data is successfully updated');
    }

   
}


	