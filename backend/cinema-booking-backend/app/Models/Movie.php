<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    protected $fillable = [
        'title', 'genres', 'release_date', 'age_rating', 'duration', 'rating',
        'synopsis', 'cast', 'director', 'writer', 'totalReviews'
    ];

    protected $casts = [
        'genres' => 'array',
        'cast' => 'array',
    ];

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

}
