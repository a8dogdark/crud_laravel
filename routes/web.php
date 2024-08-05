<?php

use Illuminate\Support\Facades\Route;

Route::get('/admin', function () {
    return view('admin.aprincipal');
});

Route::get('/', function () {
    return view('front.home');
});
/*
Route::get('/', function () {
    return view('welcome');
});
*/