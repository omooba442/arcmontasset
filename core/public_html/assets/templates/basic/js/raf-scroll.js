var animateHTML = function() {
    var elems,
        windowHeight
    var init = function() {
      elems = document.getElementsByClassName("anime-trigger");
      windowHeight = window.innerHeight;
      _addEventHandlers();
    }
    var _addEventHandlers = function() {
        window.addEventListener("load", _checkPosition);
        window.addEventListener("mousemove", _checkPosition);
        window.addEventListener("scroll", _checkPosition);
        window.addEventListener("resize", init);
    }
    var _checkPosition = function() {
        for ( var i = 0; i < elems.length; i++ ) {
            var posFromTop = elems[i].getBoundingClientRect().top;
        if ( posFromTop - windowHeight <= 0) { 
          var rafAnimate = elems[i].dataset.anime;
          elems[i].className = elems[i].className.replace( "anime-trigger", rafAnimate );
        }
      }    
    }
    return {
      init: init
    }
}
animateHTML().init();