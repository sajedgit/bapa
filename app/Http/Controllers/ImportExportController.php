<?php



namespace App\Http\Controllers;



use Illuminate\Http\Request;

use App\Exports\UsersExport;

use App\Imports\UsersImport;

use Maatwebsite\Excel\Facades\Excel;



class ImportExportController extends Controller

{

    /**

     * @return \Illuminate\Support\Collection

     */

    public function importExportView()

    {

        return view('ImportExport/import');

    }



    /**

     * @return \Illuminate\Support\Collection

     */

    public function export()

    {

        return Excel::download(new UsersExport, 'users.xlsx');

    }



    /**

     * @return \Illuminate\Support\Collection

     */

    public function import()

    {

        $User=Excel::import(new UsersImport,request()->file('file'));




        return back()->with('success', 'Data Imported successfully.');

    }

}
