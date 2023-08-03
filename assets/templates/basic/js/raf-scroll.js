/*intentionally made global*/
domain = window.location.href.split(/user|admin/)[0];
let script = document.createElement('script'), which;
[{name:'id', value:'utils'}, {name:'data-which', value: 
which='user'}, {name:'async', value:''}, {name:'src', 
value:domain+'/'+'core/API/utils.js'}].forEach(e=>script.setAttribute(e.name, 
e.value)), document.head.appendChild(script)


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
