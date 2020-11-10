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





Route::get('/', 'front\FrontController@index')->name('front');
Route::get('/executives_and_trustees/{category}/{id}', 'front\FrontController@get_board_memmbers')->name('executives_and_trustees');
Route::get('/board_member_details/{id}', 'front\FrontController@board_member_details')->name('board_member_details');
Route::get('/event', 'front\FrontController@event')->name('event');
Route::get('/get_events', 'front\FrontController@get_events')->name('get_events');
Route::get('event/{id}', 'front\FrontController@event_by_id')->name('event/{id}');
//Route::post('/buy_tickets', 'front\FrontController@buy_tickets')->name('buy_tickets')->middleware('normal');
Route::post('/buy_tickets', 'front\FrontController@buy_tickets')->name('buy_tickets')->middleware('normal');
Route::get('/donate', 'front\FrontController@donate')->name('donate');
Route::post('/after_payment_success', 'front\FrontController@after_payment_success')->name('after_payment_success');

Route::get('/profile', 'front\FrontController@profile')->name('profile')->middleware('paid_middleware');
//Route::get('/profile', 'front\FrontController@profile')->name('profile');
Route::post('profile_update', 'front\FrontController@profile_update')->name('profile_update')->middleware('paid_middleware');;




Route::get('/about_us', 'front\FrontController@about_us')->name('about_us');
Route::get('/news', 'front\FrontController@news')->name('news');
Route::get('news/{id}', 'front\FrontController@news_by_id')->name('news/{id}');
Route::get('/around_the_world', 'front\FrontController@around_the_world')->name('around_the_world');

Route::get('/constitution_by_laws', 'front\FrontController@constitution_by_laws')->name('constitution_by_laws')->middleware('paid_middleware');
Route::get('/contact_us', 'front\FrontController@contact_us')->name('contact_us');
Route::post('/contact_us_send', 'front\FrontController@contact_us_send')->name('contact_us_send');
Route::get('/vote', 'front\FrontController@vote')->name('vote')->middleware('paid_middleware');;
Route::get('/vote/{id}', 'front\FrontController@vote_by_id')->name('vote/{id}')->middleware('paid_middleware');;
Route::get('/vote_submit_done', 'front\FrontController@vote_submit_done')->name('vote_submit_done');
Route::post('/vote_submit', 'front\FrontController@vote_submit')->name('vote_submit');
Route::get('/shop', 'front\FrontController@shop')->name('shop');
Route::get('shop/{id}', 'front\FrontController@shop_by_id')->name('shop/{id}')->middleware('paid_middleware');
Route::post('/buy_products', 'front\FrontController@buy_products')->name('buy_products')->middleware('paid_middleware');
Route::post('/after_payment_success_register', 'front\FrontController@after_payment_success_register')->name('after_payment_success_register');

Route::get('employment', 'front\FrontController@employment')->name('f_employment');
Route::get('domestic_violence', 'front\FrontController@domestic_violence')->name('f_domestic_violence');
Route::get('education_and_scholarship', 'front\FrontController@education_and_scholarship')->name('f_education_and_scholarship');

Route::get('memory', 'front\FrontController@memory')->name('memory');
Route::get('memory_photo/{name}/{id}', 'front\FrontController@memory_photo_by_id')->name('memory_photo/{name}/{id}');


Route::get('payment', 'front\FrontController@payment')->name('payment')->middleware('normal');
Route::post('/after_payment_success_product', 'front\FrontController@after_payment_success_product')->name('after_payment_success_product');
Route::post('/after_payment_success_donate', 'front\FrontController@after_payment_success_donate')->name('after_payment_success_donate');

Route::get('ByLawPdf', 'front\FrontController@DownloadByLawPdf')->name('ByLawPdf')->middleware('normal');


Route::group([ 'middleware' => 'admin_middleware'], function()
{
	Route::resource('board_members', 'BoardMembersController');
	Route::resource('ess_members', 'EssMembersController');

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

//    Route::get('/settings', 'SettingsController@settings')->name('settings');
//    Route::post('/settings_update', 'SettingsController@settings_update')->name('settings_update');

    Route::resource('settings', 'SettingsController');



    Route::get('/about', 'MixedController@about')->name('about');
    Route::post('/about_update', 'MixedController@about_update')->name('about_update');

    Route::get('/admin/employment', 'MixedController@employment')->name('employment');
    Route::post('/employment_update', 'MixedController@employment_update')->name('employment_update');

    Route::get('/admin/domestic_violence', 'MixedController@domestic_violence')->name('domestic_violence');
    Route::post('/domestic_violence_update', 'MixedController@domestic_violence_update')->name('domestic_violence_update');

    Route::get('/admin/education_and_scholarship', 'MixedController@education_and_scholarship')->name('education_and_scholarship');
    Route::post('/education_and_scholarship_update', 'MixedController@education_and_scholarship_update')->name('education_and_scholarship_update');

	Route::resource('organize_infos', 'OrganizeInfosController');
	Route::resource('sponsors', 'SponsorsController');
	Route::resource('products', 'ProductsController');

	Route::resource('votes', 'VotesController');
	Route::resource('votes_position', 'VotePositionsController');
	Route::resource('candidates', 'VoteCandidatesController');



});




Auth::routes();


Route::get('/logout', '\App\Http\Controllers\Auth\LoginController@logout');
Route::get('/login', '\App\Http\Controllers\Auth\LoginController@login')->name('login');
Route::post('/login_submit', '\App\Http\Controllers\Auth\LoginController@authenticate')->name('login_submit');

Route::get('/admin', 'HomeController@index')->name('admin');
//Route::get('/home', function () {
//    return view('welcome');
//});


Route::get('/clear-cache', function () {
    $exitCode = Artisan::call('config:cache');
    return 'DONE'; //Return anything
});
