<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});


//Route::get('/', function () {
//    return view('front/front_home');
//});

Route::get('/', 'front\FrontController@index')->name('front');
Route::get('/executives_and_trustees/{category}/{id}', 'front\FrontController@get_board_memmbers')->name('executives_and_trustees');
Route::get('/board_member_details/{id}', 'front\FrontController@board_member_details')->name('board_member_details');
Route::get('/event', 'front\FrontController@event')->name('event');
Route::get('/get_events', 'front\FrontController@get_events')->name('get_events');
Route::get('/event/{id}', 'front\FrontController@event_by_id')->name('event/{id}');
Route::post('/buy_tickets', 'front\FrontController@buy_tickets')->name('buy_tickets')->middleware('normal');

Route::get('/about_us', 'front\FrontController@about_us')->name('about_us');
Route::get('/news', 'front\FrontController@news')->name('news');
Route::get('/around_the_world', 'front\FrontController@around_the_world')->name('around_the_world');

Route::get('/constitution_by_laws', 'front\FrontController@constitution_by_laws')->name('constitution_by_laws');
Route::get('/contact_us', 'front\FrontController@contact_us')->name('contact_us');
Route::get('/vote', 'front\FrontController@vote')->name('vote');
Route::get('/vote/{id}', 'front\FrontController@vote_by_id')->name('vote/{id}');
Route::get('/vote_submit_done', 'front\FrontController@vote_submit_done')->name('vote_submit_done');
Route::post('/vote_submit', 'front\FrontController@vote_submit')->name('vote_submit');
Route::get('/shop', 'front\FrontController@shop')->name('shop');


Route::group([ 'middleware' => 'admin_middleware'], function()
{
	Route::resource('board_members', 'BoardMembersController');

	Route::resource('board_members_categories', 'BoardMembersCategoriesController');
	//Route::resource('contact_us', 'ContactUsController');
	Route::resource('event_ticket_buyers', 'EventTicketBuyersController');
	Route::resource('event_ticket_payments', 'EventTicketPaymentsController');
	Route::resource('events', 'EventsController');
	Route::resource('member_devices', 'MemberDevicesController');
	Route::resource('member_job_infos', 'MemberJobInfosController');
	Route::resource('member_personal_infos', 'MemberPersonalInfosController');
	Route::resource('membership_payments', 'MembershipPaymentsController');
	Route::resource('memberships', 'MembershipsController');
	Route::resource('memories', 'MemorisController');
	Route::get('memories_photos_add', 'MemoriesPhotosController@add');
	Route::resource('memories_photos', 'MemoriesPhotosController');
	Route::resource('messages', 'MessagesController');

    Route::get('/messages_president', 'MessagesController@president')->name('president');
    Route::get('/messages_vice_president', 'MessagesController@vice_president')->name('vice_president');
    Route::get('/messages_general_secretary', 'MessagesController@general_secretary')->name('general_secretary');
    Route::post('/messages_update', 'MessagesController@messages_update')->name('messages_update');

	Route::resource('organize_infos', 'OrganizeInfosController');
	Route::resource('sponsors', 'SponsorsController');
	Route::resource('products', 'ProductsController');

	Route::resource('votes', 'VotesController');
	Route::resource('votes_position', 'VotePositionsController');
	Route::resource('candidates', 'VoteCandidatesController');



});




Auth::routes();


Route::get('/logout', '\App\Http\Controllers\Auth\LoginController@logout');

Route::get('/admin', 'HomeController@index')->name('home');
//Route::get('/home', function () {
//    return view('welcome');
//});


Route::get('/clear-cache', function () {
    $exitCode = Artisan::call('config:cache');
    return 'DONE'; //Return anything
});
