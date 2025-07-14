<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'movie_id' => 'required|exists:movies,id',
            'location' => 'required|string',
            'hall' => 'required|string',
            'date' => 'required|date',
            'time' => 'required|string',
            'seats' => 'required|array',
        ]);

        $booking = Booking::create([
            ...$validated,
            'seats' => json_encode($validated['seats'])
        ]);

        return response()->json([
            'message' => 'Booking successful',
            'data' => $booking
        ], 201);
    }

    //check available seat
    public function getBookedSeats(Request $request)
    {
        $validated = $request->validate([
            'movieId' => 'required|integer',
            'location' => 'required|string',
            'hall' => 'required|string',
            'date' => 'required|date',
            'time' => 'required|string',
        ]);

        $bookings = Booking::where('movie_id', $validated['movieId'])
            ->where('location', $validated['location'])
            ->where('hall', $validated['hall'])
            ->where('date', $validated['date'])
            ->where('time', $validated['time'])
            ->pluck('seats'); // JSON stored in DB

        $allSeats = [];

        foreach ($bookings as $seatSet) {
            $decoded = is_string($seatSet) ? json_decode($seatSet, true) : $seatSet;
            if (is_array($decoded)) {
                $allSeats = array_merge($allSeats, $decoded);
            }
        }

        return response()->json(array_values(array_unique($allSeats)));
    }

}
