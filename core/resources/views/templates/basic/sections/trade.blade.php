@php $content = getContent('trade.content', true); @endphp
<section class="quick-trade-section pb-120 pt-120">
    <div class="trade__header">
        <div class="section__header">
            <h3 class="title">{{__(@$content->data_values->heading)}}</h3>
            <p>{{__(@$content->data_values->sub_heading)}}</p>
        </div>
        <ul class="nav nav-tabs trade--tabs">
            <li class="nav-item">
                <a href="#beginners" data-bs-toggle="tab" class="nav-link active">
                    {{__(@$content->data_values->trade_tab_1)}}
                </a>
            </li>
            <li class="nav-item">
                <a href="#expert" data-bs-toggle="tab" class="nav-link">
                    {{__(@$content->data_values->trade_tab_2)}}
                </a>
            </li>
        </ul>
    </div>
    <div class="container">
        <div class="tab-content pt-50">
            <div class="tab-pane fade show active" id="beginners">
                <div class="chart-wrapper">
                    <div class="chart">
                        <div class="card custom--card h-100">
                            <div class="card-body">
                                <div class="sfx-widget w-100" id="sfx-market-overview"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="expert">
                <div class="chart-wrapper">
                    <div class="chart">
                        <div class="card custom--card h-100">
                            <div class="card-body">
                                <div class="tradingview-widget-container">
                                    <div id="expert_chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@push('script-lib')
<script src="{{asset($activeTemplateTrue .'js/sfx-widget.js')}}"></script>
<script src="{{asset($activeTemplateTrue .'js/tv.js')}}"></script>
@endpush

@push('script')
<script>
    "use strict";
    sfx('marketOverview', {
        containerId: 'sfx-market-overview',
        language: 'auto',
        width: "290px",
        height: "350px",
        symbols: ["BTCUSD", "NINTENDO.JP", "AAPL.US", "VOLV.SE", "GOOG.US", "LHA.DE", "XAUEUR", "BAY.DE", "TOYOTA.JP", "AUDCAD", "USDSEK"],
        theme: "dark",
        customElements: ["header", "chartGridLines"],
        categoriesOrder: ["Crypto", "Equities JP", "Equities US", "Equities SE", "Equities DE", "Precious Metals", "Forex"],
    });

    new TradingView.widget(
        {
            "width": 980,
            "height": 610,
            "symbol": "BTCUSD",
            "interval": "D",
            "timezone": "Etc/UTC",
            "theme": "dark",
            "style": "1",
            "locale": "en",
            "toolbar_bg": "#f1f3f6",
            "enable_publishing": false,
            "allow_symbol_change": true,
            "container_id": "expert_chart"
        }
    );
</script>
@endpush

@push('style')
    <style>
        @media (max-width: 320px) {
            .trade--tabs .nav-item .nav-link{
                padding:15px 15px;
            }
        }
    </style>
@endpush
