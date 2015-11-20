(function(){
    var ael = (function() {
        var p = "addEventListener",
            q = "attachEvent",
            d = document;
        if(d[p]) return function(el, ev, h) { el[p](ev, h, false); };
        else el[q] && return function(el, ev, h) { el.attachEvent('on' + ev, h); };
    }());

    var r = (function(){
        var iw = "innerWidth",
            ih = "innerHeight",
            w = window;
        if(w[iw] > 992) console.log('large');
        else if(992 >= w[iw] && w[iw] > 600) console.log('large');
        else console.log('large');
    })();

    ael(window, )
})();
