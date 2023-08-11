<?php

namespace App\Traits;

use App\Models\User;
use App\Constants\Status;
use App\Models\CryptoCurrency;
use Illuminate\Database\Eloquent\Casts\Attribute;

trait TradeModel
{
    public function is_practice(): bool
    {
        return static::class == \App\Models\PracticeLog::class;
    }

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

    public function futureBadge(): Attribute
    {
        return new Attribute(function () {
            $html = '';
            if($this->status != Status::TRADE_COMPLETED){
                if($this->rig == Status::TRADE_RIG_WIN){
                    $html = '<span class="badge badge--success">' . trans('Win') . '</span>';
                }elseif($this->rig == Status::TRADE_RIG_DRAW){
                    $html = '<span class="badge badge--dark">' . trans('Draw') . '</span>';
                }elseif($this->rig == Status::TRADE_RIG_LOSE){
                    $html = '<span class="badge badge--danger">' . trans('Loss') . '</span>';
                }else{
                    //$html .= '<span class="badge badge--warning">' . trans('None') . '</span>';
                }
            }
            return $html;
        });
    }
    public function changeOutcomeBadges(): Attribute
    {
        return new Attribute(function () {
            $html = '';

            if ($this->is_practice()) {
                $changeOutcomeUrl = route('admin.practice.trade.log.modify');
            } else {
                $changeOutcomeUrl = route('admin.trade.log.modify');
            }

            if ($this->result == Status::TRADE_WIN) {
                $html .= '<span style="cursor: pointer;" onclick="sage_data_mod_result(\'' . $changeOutcomeUrl . '\', \'' . $this->id . '\', \'draw\');" class="badge badge--dark">' . trans('Draw') . '</span>';
                $html .= '<span>&nbsp&nbsp</span>';
                $html .= '<span style="cursor: pointer;" onclick="sage_data_mod_result(\'' . $changeOutcomeUrl . '\', \'' . $this->id . '\', \'loss\');" class="badge badge--danger">' . trans('Loss') . '</span>';
            } elseif ($this->result == Status::TRADE_LOSE) {
                $html .= '<span style="cursor: pointer;" onclick="sage_data_mod_result(\'' . $changeOutcomeUrl . '\', \'' . $this->id . '\', \'win\');" class="badge badge--success">' . trans('Win') . '</span>';
                $html .= '<span>&nbsp&nbsp</span>';
                $html .= '<span style="cursor: pointer;" onclick="sage_data_mod_result(\'' . $changeOutcomeUrl . '\', \'' . $this->id . '\', \'draw\');" class="badge badge--dark">' . trans('Draw') . '</span>';
            } elseif ($this->result == Status::TRADE_DRAW) {
                $html .= '<span style="cursor: pointer;" onclick="sage_data_mod_result(\'' . $changeOutcomeUrl . '\', \'' . $this->id . '\', \'win\');" class="badge badge--success">' . trans('Win') . '</span>';
                $html .= '<span>&nbsp&nbsp</span>';
                $html .= '<span style="cursor: pointer;" onclick="sage_data_mod_result(\'' . $changeOutcomeUrl . '\', \'' . $this->id . '\', \'loss\');" class="badge badge--danger">' . trans('Loss') . '</span>';
            } else {
                $html .= '<span style="cursor: pointer;" onclick="sage_data_mod_result(\'' . $changeOutcomeUrl . '\', \'' . $this->id . '\', \'win\');" class="badge badge--success">' . trans('Win') . '</span>';
                $html .= '<span>&nbsp&nbsp</span>';
                $html .= '<span style="cursor: pointer;" onclick="sage_data_mod_result(\'' . $changeOutcomeUrl . '\', \'' . $this->id . '\', \'draw\');" class="badge badge--dark">' . trans('Draw') . '</span>';
                $html .= '<span>&nbsp&nbsp</span>';
                $html .= '<span style="cursor: pointer;" onclick="sage_data_mod_result(\'' . $changeOutcomeUrl . '\', \'' . $this->id . '\', \'loss\');" class="badge badge--danger">' . trans('Loss') . '</span>';
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

    public function turnOut(): Attribute
    {
        return new Attribute(function () {
            $html = '-';
            $currency = gs()->cur_text;
            if ($this->result == Status::TRADE_WIN) {
                $html = '<span class="fw-bold  text--success"> + '.number_format(doubleval($this->amount) * doubleval(($this->profit ?? 10)/100.0), 2).' '.$currency.' </span>';
            } elseif ($this->result == Status::TRADE_DRAW) {
                $html = '<span class="fw-bold  text--primary"> + 0 '.$currency.' </span>';
            } elseif ($this->result == Status::TRADE_LOSE) {
                $html = '<span class="fw-bold  text--danger"> - '.number_format($this->amount, 2).' '.$currency.' </span>';
            } else {}
            return $html;
        });
    }
}