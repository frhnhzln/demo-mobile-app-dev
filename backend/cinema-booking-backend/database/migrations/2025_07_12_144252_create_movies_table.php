<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('movies', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->json('genres')->nullable();
            $table->string('release_date')->nullable();
            $table->string('age_rating')->nullable();
            $table->string('duration')->nullable();
            $table->float('rating')->nullable();
            $table->text('synopsis')->nullable();
            $table->json('cast')->nullable();
            $table->string('director')->nullable();
            $table->string('writer')->nullable();
            $table->integer('totalReviews')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('movies');
    }
};
