<?php

namespace App\Http\Controllers;
use App\Models\Resource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ResourcesController extends Controller
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
//        $data = Resource::select("*")
//            ->orderBy('sort_order', 'desc')
//            ->get();

        $data = DB::table('resources')
            //->where("type","Others")
            ->select('*')
            ->orderBy('sort_order', 'desc')
            ->get();



        return view('Resource/index', compact('data'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Resource/create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'resource_name'    =>  'required',
            'about_content'     =>  'required',
            'sort_order'     =>  'required|numeric'

        ]);

        $form_data = array(
            'resource_name'       =>   $request->resource_name,
            'slug'        => $this->slugify($request->resource_name),
            'about_content'        =>   $request->about_content,
            'sort_order'        =>   $request->sort_order
        );

        Resource::create($form_data);

        return redirect('resource')->with('success', 'Data Added successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = Resource::findOrFail($id);
        return view('Resource/view', compact('data'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $data = Resource::findOrFail($id);
        return view('Resource/edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $request->validate([
            'resource_name'    =>  'required',
            'about_content'     =>  'required',
            'sort_order'     =>  'required|numeric'
        ]);

        $form_data = array(
            'resource_name'       =>   $request->resource_name,
            'slug'        =>    $this->slugify($request->resource_name),
            'about_content'        =>   $request->about_content,
            'sort_order'        =>   $request->sort_order
        );

        Resource::whereId($id)->update($form_data);

        return redirect('resource')->with('success', 'Data is successfully updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Resource::findOrFail($id);
        $data->delete();

        return redirect('resource')->with('success', 'Data is successfully deleted');
    }

    public  function slugify($text)
    {
        // replace non letter or digits by -
        $text = preg_replace('~[^\pL\d]+~u', '-', $text);

        // transliterate
        $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

        // remove unwanted characters
        $text = preg_replace('~[^-\w]+~', '', $text);

        // trim
        $text = trim($text, '-');

        // remove duplicate -
        $text = preg_replace('~-+~', '-', $text);

        // lowercase
        $text = strtolower($text);

        if (empty($text)) {
            return 'n-a';
        }

        return $text;
    }

}


