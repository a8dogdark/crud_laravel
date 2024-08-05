<?php

use Illuminate\Support\Facades\Route;

Route::get('/admin/roles', function () {
    return view('admin.aroles');
})->name('aroles');

Route::get('/admin/usuarios', function () {
    return view('admin.ausuarios');
})->name('ausuarios');

Route::get('/admin/comentarios', function () {
    return view('admin.acomentarios');
})->name('acomentarios');

Route::get('/admin/categorias', function () {
    return view('admin.acategorias');
})->name('acategorias');

Route::get('/admin/articulos', function () {
    return view('admin.aarticulos');
})->name('aarticulos');

Route::get('/admin', function () {
    return view('admin.aprincipal');
})->name('aprincipal');

Route::get('/', function () {
    return view('front.home');
})->name('home');
/*
Route::get('/', function () {
    return view('welcome');
});
*/