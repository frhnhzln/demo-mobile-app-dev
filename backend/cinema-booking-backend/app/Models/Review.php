<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $fillable = [
        'movie_id',
        'user',
        'stars',
        'comment',
    ];

    public function movie()
    {
        return $this->belongsTo(Movie::class);
    }
}

