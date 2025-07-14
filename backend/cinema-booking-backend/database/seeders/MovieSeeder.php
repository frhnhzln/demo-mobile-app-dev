<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Movie;

class MovieSeeder extends Seeder
{
    public function run()
    {
        $movies = [
            [
                "id" => 1,
                "title" => "Venom: Let There Be Carnage",
                "genres" => json_encode(["Action", "Adventure", "Sci-Fi"]),
                "release_date" => "October 2021",
                "age_rating" => "15+",
                "duration" => "2h 28m",
                "rating" => 4.8,
                "synopsis" => "Eddie Brock, a journalist who is adjusting to his new symbiotic relationship with Venom...",
                "cast" => json_encode(["Tom Hardy", "Woody Harrelson", "Michelle Williams", "Naomie Harris", "Reid Scott", "Stephen Graham"]),
                "director" => "Andy Serkis",
                "writer" => "Marcel",
                "totalReviews" => 20
            ],
            [
                "id" => 2,
                "title" => "Interstellar"
            ],
            [
                "id" => 3,
                "title" => "The Matrix"
            ],
            [
                "id" => 4,
                "title" => "Avengers: Endgame"
            ],
            [
                "id" => 5,
                "title" => "Tenet"
            ]
        ];

        foreach ($movies as $movie) {
            Movie::create($movie);
        }
    }
}
