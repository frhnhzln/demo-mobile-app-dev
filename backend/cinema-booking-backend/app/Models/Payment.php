<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable = [
        'card_number',
        'expiry_date',
        'cvv',
        'amount',
    ];
}
