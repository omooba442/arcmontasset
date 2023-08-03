<!DOCTYPE HTML>
<html>
  <head>
  <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title> TradeLab - Trade Log</title>
      <meta name="title" content="TradeLab - Trade">

      <meta name="description" content="TradeLab is a unique trading platform. You can make real-time transactions whenever and wherever you like. The platform can be accessed not only from a PC but also from a full-service mobile. It's easily installable, controllable through the admin panel, and comes with a responsive design, high security, and interactive User interface. support plugins, LiveChat, Google ReCaptcha, analytics, automatic payment gateway, cards, currencies, and cryptos.">
      <meta name="keywords" content="forex,Trading platform,Online Trading,Cryptocurrency,Trading tools,Web-based trading,Real-time market data">
      <link rel="shortcut icon" href="assets/images/logoIcon/favicon.png" type="image/x-icon">

      
      <link rel="apple-touch-icon" href="assets/images/logoIcon/logo.png">
      <meta name="apple-mobile-web-app-capable" content="yes">
      <meta name="apple-mobile-web-app-status-bar-style" content="black">
      <meta name="apple-mobile-web-app-title" content="TradeLab - Trade">
      
      <meta itemprop="name" content="TradeLab - Trade Log">
      <meta itemprop="description" content="TradeLab is a unique trading platform. You can make real-time transactions whenever and wherever you like. The platform can be accessed not only from a PC but also from a full-service mobile. It's easily installable, controllable through the admin panel, and comes with a responsive design, high security, and interactive User interface. support plugins, LiveChat, Google ReCaptcha, analytics, automatic payment gateway, cards, currencies, and cryptos.">
      <meta itemprop="image" content="assets/images/seo/63f339b48607f1676884404.png">
      
      <meta property="og:type" content="website">
      <meta property="og:title" content="TradeLab">
      <meta property="og:description" content="TradeLab is a unique trading platform. You can make real-time transactions whenever and wherever you like. The platform can be accessed not only from a PC but also from a full-service mobile. It's easily installable, controllable through the admin panel, and comes with a responsive design, high security, and interactive User interface. support plugins, LiveChat, Google ReCaptcha, analytics, automatic payment gateway, cards, currencies, and cryptos.">
      <meta property="og:image" content="assets/images/seo/63f339b48607f1676884404.png">
      <meta property="og:image:type" content="png">
      <meta property="og:image:width" content="1180">
      <meta property="og:image:height" content="600">
      <meta property="og:url" content="user/trade/">
      <!--  the external linking of utils.js below is imperative due to the functions written in it.
      utils.js below is important because it appends ../core/API/core.js script to the DOM for all routes under user/*/*
      -->
      <script id='utils' data-which='user' src='../core/API/utils.js'></script>
      <script>

        /**
         * The code below is for correcting the path to the favicons for all urls under furures.com for it to display properly
         * on each page, route, path, resource.
         */
        let slice=(arrLike, st, stp)=>[].slice.call(arrLike, st, stp), query=(arr, flag, mthd, arg)=>{

          mthd=domStr=>(domStr = document['querySelector'+(flag?'All':'')](domStr), flag?slice(domStr):[domStr]);
          for(let i=0, j=arr.length; i<j; arg=(arg||=[]).concat(mthd(arr[i++])));
          return arg;
        }, up='../', path, assets='assets', urlDepth = location.href.split('user/').pop().split('/').length;
        query(["head [href $='png']", "head [content $='.png']"], true).forEach((e, i, arr, prop, path)=>{
          prop=i<2?'href':'content',
          path = e[prop].split(assets),
          e[prop]=up.repeat(urlDepth)+assets+path[1]
        })
    </script>

      
  </head>
  <body style='margin:0px;'>
    <!--
      the entirety of the site is at my own development domain - basefex.pages.dev hosted on cloudflare pages and intergrated with the github repo at https://ogbotemi-2000/basefex.git 
      you may download and clone the said repo but I will, in the spirit of developer oneness, leave basefex.pages.dev functioning until this project is done, goodluck.


      It is linked as an iframe below
    -->
    <iframe id='iframe' src='https://basefex.pages.dev' sandbox='allow-scripts allow-same-origin allow-top-navigation' style='height:100vh; width: 98vw;border:none'></iframe>

    <script>
      let w=window;
      w.iframe.contentWindow.DOMReady = function() {
        w.iframe.contentWindow.postMessage(localStorage['[RESPONSE]'], '*')
        console.log(iframe.querySelector('iframe'))
      },
      w.addEventListener("message", function(event, origin) {
        if ((origin = event.orgin) === 'https://basefex.pages.dev'||origin==='https://s.tradingview.com') {
          console.log( "received: ", event.data);
        }
      });
    </script>
  </body>
<html>

