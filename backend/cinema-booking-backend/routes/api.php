<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MovieController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\PaymentController;

Route::get('/movies', [MovieController::class, 'index']);
Route::post('/bookings', [BookingController::class, 'store']);
Route::get('/movies/{id}', [MovieController::class, 'show']);
Route::get('/movies/{id}/ratings', [MovieController::class, 'ratings']);

//add review using postman
Route::post('/movies/{id}/reviews', [MovieController::class, 'storeReview']);

//payment
Route::post('/submit-payment', [PaymentController::class, 'store']);

//seat availability
Route::get('/booked-seats', [BookingController::class, 'getBookedSeats']);
