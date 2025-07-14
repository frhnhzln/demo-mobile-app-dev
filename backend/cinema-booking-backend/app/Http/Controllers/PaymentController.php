<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Payment;
use App\Models\Booking;

class PaymentController extends Controller
{
    public function store(Request $request)
    {
        // dd($request->all());
        $validated = $request->validate([
            'card_number' => 'required|string|max:19',
            'expiry_date' => 'required|string|max:5',
            'cvv' => 'required|string|max:4',
            'amount' => 'required|numeric',
            'movie_id' => 'required|integer',
            'location' => 'required|string',
            'hall' => 'required|string',
            'date' => 'required|date',
            'time' => 'required|string',
            'seats' => 'required|array',
        ]);

        // Save to payments
        $payment = Payment::create([
            'card_number' => $validated['card_number'],
            'expiry_date' => $validated['expiry_date'],
            'cvv' => $validated['cvv'],
            'amount' => $validated['amount'],
        ]);

        // Save to bookings
        $booking = Booking::create([
            'movie_id' => $validated['movie_id'],
            'location' => $validated['location'],
            'hall' => $validated['hall'],
            'date' => $validated['date'],
            'time' => $validated['time'],
            'seats' => json_encode($validated['seats']),
        ]);

        return response()->json([
            'message' => 'Payment and booking saved successfully!',
            'payment_id' => $payment->id,
            'booking_id' => $booking->id,
        ]);
    }
}
