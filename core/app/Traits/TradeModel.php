<?php

namespace App\Traits;

use App\Models\User;
use App\Constants\Status;
use App\Models\CryptoCurrency;
use Illuminate\Database\Eloquent\Casts\Attribute;

trait TradeModel
{
    public function crypto()
    {
        return $this->belongsTo(CryptoCurrency::class, 'crypto_currency_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function scopeWin($query)
    {
        return $query->where('result', Status::TRADE_WIN)->where('status', Status::TRADE_COMPLETED);
    }

    public function scopeLoss($query)
    {
        return $query->where('result', Status::TRADE_LOSE)->where('status', Status::TRADE_COMPLETED);
    }

    public function scopeDraw($query)
    {
        return $query->where('result', Status::TRADE_DRAW)->where('status', Status::TRADE_COMPLETED);
    }

    public function resultStatus(): Attribute
    {
        return new Attribute(function () {
            $html = '';
            if ($this->result == Status::TRADE_WIN) {
                $html = '<span class="badge badge--success">' . trans('Win') . '</span>';
            } elseif ($this->result == Status::TRADE_LOSE) {
                $html = '<span class="badge badge--danger">' . trans('Loss') . '</span>';
            } elseif ($this->result == Status::TRADE_DRAW) {
                $html = '<span class="badge badge--dark">' . trans('Draw') . '</span>';
            } else {
                $html = '<span class="badge badge--warning">' . trans('Pending') . '</span>';
            }
            return $html;
        });
    }

    public function statusBadge(): Attribute
    {
        return new Attribute(function () {
            $html = '';
            if ($this->status == Status::TRADE_COMPLETED) {
                $html = '<span class="badge badge--success">' . trans('Completed') . '</span>';
            } else {
                $html = '<span class="badge badge--warning">' . trans('Running') . '</span>';
            }
            return $html;
        });
    }

    public function highLowBadge(): Attribute
    {
        return new Attribute(function () {
            $html = '';
            if ($this->high_low == Status::TRADE_HIGH) {
                $html = '<span class="badge badge--success">' . trans('High') . '</span>';
            } else {
                $html = '<span class="badge badge--danger">' . trans('Low') . '</span>';
            }
            return $html;
        });
    }
}
