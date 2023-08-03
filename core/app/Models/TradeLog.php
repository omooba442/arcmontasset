<?php

namespace App\Models;

use App\Traits\Searchable;
use App\Traits\TradeModel;
use Illuminate\Database\Eloquent\Model;

class TradeLog extends Model
{
    use Searchable,TradeModel;
}
