<?php



namespace App\Http\Controllers;



use App\Mail\SendAllMemberMail;
use Illuminate\Http\Request;

use App\Exports\UsersExport;

use App\Imports\UsersImport;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Facades\Excel;



class ImportExportController extends Controller

{

    public  $mail_to = array();
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

        $import=Excel::import(new UsersImport,request()->file('file'));
        $return_data = $import->toCollection($import, request()->file('file'));
        $return_data_array = $return_data->toArray();
        foreach ($return_data_array as $data_array)
        {
            foreach ($data_array as $data)
            {
                array_push($this->mail_to,$data[1]);
            }

        }

        array_shift($this->mail_to);
        $this->send_mail($this->mail_to);
        return back()->with('success', 'Data Imported successfully.');

    }


    public function send_mail($emails)
    {
        $password="#BaP@$2&o%2l#";
        $login_url=url('login');
        $profile_url=url('profile');


        $mail_to = implode(",",$emails);

        $to = $mail_to;
        $subject="Membership Confirmation";
        $txt = <<<EOD
    <p>Dear Member,<br/> Your membership have been created successfully. You are now registered member.
        You can now <a href="$login_url">login </a> from BAPA website with below credentials.
        Just make sure your membership subscription is updated or not</p>

    <p>Login From: <a href="$login_url"> {{ url('login') }} </a></p>
    <p>User: YOUR_EMAIL_ADDRESS</p>
    <p>Password: <b>$password</b> </p>


    <p><B>PLEASE MUST CHANGE THE PASSWORD</B> from <a href="$profile_url">Update Profile</a> panel after login  </p>


    <p>If you have facing any problem to login please contact with <b>nypdbapa@gmail.com</b>  </p>

EOD;

        $headers = "From: sajed.dev.bd@gmail.com" . "\r\n" .
            "CC: sajedaiub@gmail.com";

        mail($to,$subject,$txt,$headers);





    }

}
