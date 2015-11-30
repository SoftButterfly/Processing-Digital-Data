(function(){
    function signal(t, container, dot) {
        var p = document.querySelector("." + container);
        var h = p.offsetHeight;
        var w = p.offsetWidth;

        var d = "";

        for(var x = 0; x < w; x++){
            var y = 0.5*h + 15*(Math.random()*Math.sin(0.019*Math.PI*x -  2*Math.PI*t) +
                                Math.random()*Math.sin(0.023*Math.PI*x -  3*Math.PI*t) +
                                Math.random()*Math.sin(0.029*Math.PI*x -  5*Math.PI*t) +
                                Math.random()*Math.sin(0.031*Math.PI*x -  7*Math.PI*t) +
                                Math.random()*Math.sin(0.037*Math.PI*x - 11*Math.PI*t) +
                                Math.random()*Math.sin(0.041*Math.PI*x - 13*Math.PI*t) +
                                Math.random()*Math.sin(0.043*Math.PI*x - 17*Math.PI*t));

            if(p.querySelectorAll("." + dot)[x] === undefined){
                var d = document.createElement("div");
                d.classList.add(dot);
                d.style.bottom = y + "px";
                d.style.left = x + "px";
                p.appendChild(d);
            }
            else{
                p.querySelectorAll('.' + dot)[x].style.bottom = y + "px";
            }

        }
    }

    function disperse(t, container, dot) {
        var p = document.querySelector("." + container);
        var h = p.offsetHeight;
        var w = p.offsetWidth;

        var d = "";

        for(var x = 0; x < w; x++){
            var dx = 4*w*(Math.random()*Math.cos(0.019*Math.PI*x -  2*Math.PI*t) +
                          Math.random()*Math.cos(0.023*Math.PI*x -  3*Math.PI*t) +
                          Math.random()*Math.cos(0.029*Math.PI*x -  5*Math.PI*t) +
                          Math.random()*Math.cos(0.031*Math.PI*x -  7*Math.PI*t) +
                          Math.random()*Math.cos(0.037*Math.PI*x - 11*Math.PI*t) +
                          Math.random()*Math.cos(0.041*Math.PI*x - 13*Math.PI*t) +
                          Math.random()*Math.cos(0.043*Math.PI*x - 17*Math.PI*t));

            var dy = 4*h*(Math.random()*Math.sin(0.019*Math.PI*x -  2*Math.PI*t) +
                          Math.random()*Math.sin(0.023*Math.PI*x -  3*Math.PI*t) +
                          Math.random()*Math.sin(0.029*Math.PI*x -  5*Math.PI*t) +
                          Math.random()*Math.sin(0.031*Math.PI*x -  7*Math.PI*t) +
                          Math.random()*Math.sin(0.037*Math.PI*x - 11*Math.PI*t) +
                          Math.random()*Math.sin(0.041*Math.PI*x - 13*Math.PI*t) +
                          Math.random()*Math.sin(0.043*Math.PI*x - 17*Math.PI*t));

            if(p.querySelectorAll("." + dot)[x] === undefined){
                var d = document.createElement("div");
                d.classList.add(dot);
                d.style.bottom = dy + "px";
                d.style.left = dx + "px";
                p.appendChild(d);
            }
            else{
                p.querySelectorAll('.' + dot)[x].style.bottom = dy + "px";
                p.querySelectorAll('.' + dot)[x].style.left = dx + "px";
            }

        }
    }

    var t;
    var l;

    $(document).ready(function(){
        t = 0;
        l = setInterval(function(){
            t+=0.0150;
            signal(t, 'pdd-preloader--plot', 'pdd-preloader--plot-dot');
        }, 150);
    });

    $(window).load(function() {
        setTimeout(function(){
            t+=0.0150;
            document.querySelector("body").classList.add("pdd-loaded");
            disperse(t, 'pdd-preloader--plot', 'pdd-preloader--plot-dot');
            clearInterval(l);}, 1000);
    });
})();

/*
$(document).ready(function() {
    SyntaxHighlighter.defaults['gutter'] = false;
    SyntaxHighlighter.defaults['toolbar'] = false;
    SyntaxHighlighter.all()

    MathJax.Hub.Config({tex2jax: {inlineMath: [["$","$"], ["\\(","\\)"]]}});

    $(".scrollspy").scrollSpy();
    $(".button-collapse").sideNav();
});
    console.log
$(document).scroll(function(event) {
});

$(window).resize(function(event) {
});

$(window).load(function() {
    setTimeout(function(){$(".page-preloader").addClassignal("loaded");}, 1000);
    setTimeout(function(){$("body").addClassignal("loaded");}, 1750);
    setTimeout(function(){$(".page-preloader").cssignal("z-index: -1");}, 1750);
});
*/
