<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MixedController extends Controller
{
	
	public function __construct()
    {
        $this->middleware('auth');
    }
	
   

    public function about()
    {

        $data = DB::table('about_us')
            ->select('*')
            ->where("id",1)
            ->get();
        $data=$data[0];

        return view('Mixed/about', compact('data'));

    }

    public function about_update(Request $request)
    {

        $id=$request->about_id;
        $about_content=$request->about_content;
        $form_data = array(
            'about_content'  => addslashes($about_content)
        );

        $affected = DB::table("about_us")
            ->where('id', $id)
            ->update($form_data);

        return redirect()->route("about")->with('success', 'Data is successfully updated');
    }



    public function employment()
    {

        $data = DB::table('employment')
            ->select('*')
            ->where("id",1)
            ->get();
        $data=$data[0];

        return view('Mixed/employment', compact('data'));

    }

    public function employment_update(Request $request)
    {

        $id=$request->about_id;
        $about_content=$request->about_content;
        $form_data = array(
            'about_content'  => addslashes($about_content)
        );

        $affected = DB::table("employment")
            ->where('id', $id)
            ->update($form_data);

        return redirect()->route("employment")->with('success', 'Data is successfully updated');
    }



    public function education_and_scholarship()
    {

        $data = DB::table('education_and_scholarship')
            ->select('*')
            ->where("id",1)
            ->get();
        $data=$data[0];

        return view('Mixed/education_and_scholarship', compact('data'));

    }

    public function education_and_scholarship_update(Request $request)
    {

        $id=$request->about_id;
        $about_content=$request->about_content;
        $form_data = array(
            'about_content'  => addslashes($about_content)
        );

        $affected = DB::table("education_and_scholarship")
            ->where('id', $id)
            ->update($form_data);

        return redirect()->route("education_and_scholarship")->with('success', 'Data is successfully updated');
    }



    public function domestic_violence()
    {

        $data = DB::table('domestic_violence')
            ->select('*')
            ->where("id",1)
            ->get();
        $data=$data[0];

        return view('Mixed/domestic_violence', compact('data'));

    }

    public function domestic_violence_update(Request $request)
    {

        $id=$request->about_id;
        $about_content=$request->about_content;
        $form_data = array(
            'about_content'  => addslashes($about_content)
        );

        $affected = DB::table("domestic_violence")
            ->where('id', $id)
            ->update($form_data);

        return redirect()->route("domestic_violence")->with('success', 'Data is successfully updated');
    }


}


	