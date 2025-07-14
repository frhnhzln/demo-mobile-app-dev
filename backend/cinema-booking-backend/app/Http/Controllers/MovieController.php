<?php

namespace App\Http\Controllers;

use App\Models\Movie;
use Illuminate\Http\Request;
use App\Models\Review;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class MovieController extends Controller
{
    public function index()
    {
        return Movie::all();
    }

    public function show($id)
    {
        return Movie::findOrFail($id);
    }

    public function ratings($id)
    {
        $reviews = Review::where('movie_id', $id)->get();

        $totalReviews = $reviews->count();
        $avgRating = $reviews->avg('stars') ?? 0;

        $breakdown = [];
        for ($i = 5; $i >= 1; $i--) {
            $breakdown[] = [
                'stars' => $i,
                'count' => $reviews->where('stars', $i)->count()
            ];
        }

        $formattedReviews = $reviews->map(function ($review) {
            return [
                'user' => $review->user,
                'stars' => $review->stars,
                'comment' => $review->comment,
            ];
        });

        return response()->json([
            'movie_id' => $id,
            'rating' => round($avgRating, 1),
            'totalReviews' => $totalReviews,
            'breakdown' => $breakdown,
            'reviews' => $formattedReviews,
        ]);
    }

    //add review using postman
    public function storeReview(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'user' => 'required|string|max:255',
            'stars' => 'required|integer|min:1|max:5',
            'comment' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $review = Review::create([
            'movie_id' => $id,
            'user' => $request->user,
            'stars' => $request->stars,
            'comment' => $request->comment,
        ]);

        return response()->json(['message' => 'Review added', 'review' => $review], 201);
}


}
