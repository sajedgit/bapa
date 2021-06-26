<?php

namespace App\Imports;

use App\Mail\SendMemberMail;
use App\Models\EssMember;
use App\Models\Membership;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Row;
use Maatwebsite\Excel\Concerns\OnEachRow;

class UsersImport implements OnEachRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
//    public function model(array $row)
//    {
//        return new EssMember([
//            'type'     => "Paid",
//            'name'     => $row[0],
//            'email'    => $row[1],
//            'created_at' => date('Y-m-d H:i:s'),
//            'active'        => 1,
//        ]);
//    }

    public function onRow(Row $row)
    {
        $rowIndex = $row->getIndex();
        $row      = $row->toArray();
        if($rowIndex > 1)
        {

            $form_data = array(
                'type'     => "Paid",
                'name'     => $row[0],
                'email'    => $row[1],
                'created_at' => date('Y-m-d H:i:s'),
                'active'        => 1,
            );

            $create_ess_member = EssMember::updateOrCreate( ['email' => $row[1]] , $form_data);

            //$create_ess_member=EssMember::create($form_data);


            if($create_ess_member->id)
            {
                $this->insert_member($form_data,$create_ess_member->id);

            }
        }


    }



    public function insert_member($form_data,$ess_id)
    {
        $email=$form_data["email"];
        $password=$this->password_generate(8);
        $data = array(
            'user_type_id'       => 2,
            'ess_type'        =>   $form_data["type"],
            'ess_id'        =>   $ess_id,
            'name'        =>   $form_data["name"],
            'username'        =>   $form_data["name"],
            'password'        =>    Hash::make($password),
            'email'        =>   $form_data["email"],
            'photo'        =>   "no_image.jpg",
            'active'        =>  $form_data["active"],
            'created_at' => $form_data["created_at"],

        );

        $create_membership = Membership::updateOrCreate( ['email' => $email ] , $data);
        //$create_membership=Membership::create($data);

        $data["password"]=$password;

        if($create_membership->id)
        {
            $this->send_mail($data);
        }
    }

    public function send_mail($data)
    {

        $subject="Membership Confirmation";
        $mail_to = $data["email"];
        //$mail_to = "sajedaiub@gmail.com";
        // $cc = "nypdbapa@gmail.com";
        $cc = "nypdbapa@gmail.com";
        $bcc = "hasnat288@gmail.com";


        Mail::to($mail_to)
            ->cc($cc)
            ->bcc($bcc)
            ->send(new SendMemberMail($data,$subject));

    }

    function password_generate($chars)
    {
        $data = '@#$%&*()1234567890@#$%&*()ABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&*()abcefghijklmnopqrstuvwxyz@#$%&*()';
        return substr(str_shuffle($data), 0, $chars);
    }

}

