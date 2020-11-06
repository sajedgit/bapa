<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;

class Membership extends Authenticatable
{
    use HasApiTokens,Notifiable;

    protected $table = 'memberships';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_type_id',  'ess_type',  'ess_id', 'name','username','password','email','active','remember_token','created_at','updated_at'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];


    public function getAuthPassword()
    {
      return $this->password;
    }
}
