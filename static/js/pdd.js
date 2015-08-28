$(document).ready(function() {
    SyntaxHighlighter.all()

    MathJax.Hub.Config({tex2jax: {inlineMath: [["$","$"], ["\\(","\\)"]]}});

    $(".scrollspy").scrollSpy();
    $(".button-collapse").sideNav();
    $(".button-collapse").click(function(event) {
        $(".button-collapse").toggleClass("active");
    });

    var oldLeft = $("#sidenav").css("left").replace("px", "");

    $("#sidenav").attrchange({
        trackValues: true,
        callback: function (e) {
            var newLeft = $("#sidenav").css("left").replace("px", "");

            if(e.attributeName==="style"){
                if(oldLeft < newLeft && oldLeft == -250){
                    console.log("aparece");
                    $(".button-collapse").addClass("active");
                }
                else if(oldLeft > newLeft  && oldLeft == 0){
                    console.log("desaparece");
                    $(".button-collapse").removeClass("active");
                }
                oldLeft = newLeft;
            }
        }
    })
});

$(document).scroll(function(event) {
});

$(window).resize(function(event) {
});

$(window).load(function() {
    setTimeout(function(){$(".page-preloader").addClass("loaded");}, 1000);
    setTimeout(function(){$("body").addClass("loaded");}, 1750);
});
