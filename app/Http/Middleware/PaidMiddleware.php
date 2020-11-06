<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Response;

class PaidMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        if ($request->user() && $request->user()->active != 1) {
            return redirect("payment");
        }

        return $next($request);
    }
}