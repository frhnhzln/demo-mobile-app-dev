<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $fillable = [
        'movie_id', 'location', 'hall', 'date', 'time', 'seats',
    ];

    protected $casts = [
        'seats' => 'array',
    ];
}
