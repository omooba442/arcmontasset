<?php

use App\Lib\CurlRequest;
use App\Models\User;
use Illuminate\Support\Facades\Route;

Route::get('/clear', function () {
    \Illuminate\Support\Facades\Artisan::call('optimize:clear');
});


Route::middleware('throttle:2,1')->prefix('cron')->name('cron.')->controller("CronController")->group(function () {
    Route::get('/', 'index')->name('index');
    Route::get('practice', 'practiceCron')->name('practice');
    Route::get('crypto/price', 'cryptoPrice')->name('crypto.price');
});


// User Support Ticket
Route::controller('TicketController')->prefix('ticket')->name('ticket.')->group(function () {
    Route::get('/', 'supportTicket')->name('index');
    Route::get('new', 'openSupportTicket')->name('open');
    Route::post('create', 'storeSupportTicket')->name('store');
    Route::get('view/{ticket}', 'viewTicket')->name('view');
    Route::post('reply/{ticket}', 'replyTicket')->name('reply');
    Route::post('close/{ticket}', 'closeTicket')->name('close');
    Route::get('download/{ticket}', 'ticketDownload')->name('download');
});

Route::controller('SiteController')->group(function () {
    // Route::get('blog', 'blog')->name('blog');
    Route::get('blog', function () {
        return abort(404);
    })->name('blog');
    Route::get('/services', 'services')->name('services');
    Route::get('/contact', 'contact')->name('contact');
    Route::post('/contact', 'contactSubmit');
    Route::get('/change/{lang?}', 'changeLanguage')->name('lang');
    Route::get('cookie-policy', 'cookiePolicy')->name('cookie.policy');
    Route::get('/cookie/accept', 'cookieAccept')->name('cookie.accept');
    Route::post('/subscribe', 'subscribe')->name('subscribe');
    // Route::get('blog/{slug}/{id}', 'blogDetails')->name('blog.details');
    Route::get('policy/{slug}/{id}', 'policyPages')->name('policy.pages');
    Route::get('placeholder-image/{size}', 'placeholderImage')->name('placeholder.image');
    Route::get('/{slug}', 'pages')->name('pages');
    Route::get('/', 'index')->name('home');
});


