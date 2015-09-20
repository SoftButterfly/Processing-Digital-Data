$(document).ready(function() {
    SyntaxHighlighter.defaults['gutter'] = false;
    SyntaxHighlighter.defaults['toolbar'] = false;
    SyntaxHighlighter.all()

    MathJax.Hub.Config({tex2jax: {inlineMath: [["$","$"], ["\\(","\\)"]]}});

    $(".scrollspy").scrollSpy();
    $(".button-collapse").sideNav();
});

$(document).scroll(function(event) {
});

$(window).resize(function(event) {
});

$(window).load(function() {
    setTimeout(function(){$(".page-preloader").addClass("loaded");}, 1000);
    setTimeout(function(){$("body").addClass("loaded");}, 1750);
    setTimeout(function(){$(".page-preloader").css("z-index: -1");}, 1750);
});
