<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        //
		'http://localhost/bapa/after_payment',
		'http://localhost/bapa/after_payment_success',
		'https://nypdbapa.org/after_payment',
		'https://nypdbapa.org/after_payment_success',

		'http://localhost/bapa/after_payment_product',
		'http://localhost/bapa/after_payment_success_product',
        'https://nypdbapa.org/after_payment_product',
		'https://nypdbapa.org/after_payment_success_product',


        'http://localhost/bapa/after_payment_register',
		'http://localhost/bapa/after_payment_success_register',
        'https://nypdbapa.org/after_payment_register',
		'https://nypdbapa.org/after_payment_success_register',
    ];
}
