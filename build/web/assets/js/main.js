/*
 Striped by HTML5 UP
 html5up.net | @ajlkn
 Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
 */

(function ($) {

    var $window = $(window),
            $body = $('body'),
            $document = $(document);

    // Breakpoints.
    breakpoints({
        desktop: ['737px', null],
        wide: ['1201px', null],
        narrow: ['737px', '1200px'],
        narrower: ['737px', '1000px'],
        mobile: [null, '736px']
    });

    // Play initial animations on page load.
    $window.on('load', function () {
        window.setTimeout(function () {
            $body.removeClass('is-preload');
        }, 100);
    });

    // Nav.

    // Height hack.
    /*
     var $sc = $('#sidebar, #content'), tid;
     
     $window
     .on('resize', function() {
     window.clearTimeout(tid);
     tid = window.setTimeout(function() {
     $sc.css('min-height', $document.height());
     }, 100);
     })
     .on('load', function() {
     $window.trigger('resize');
     })
     .trigger('resize');
     */

    // Title Bar.
    $(
            '<div id="titleBar">' +
            '<a href="#sidebar" class="toggle"></a>' +
            '<span class="title">' + $('#logo').html() + '</span>' +
            '</div>'
            )
            .appendTo($body);

    // Sidebar
    $('#sidebar')
            .panel({
                delay: 500,
                hideOnClick: true,
                hideOnSwipe: true,
                resetScroll: true,
                resetForms: true,
                side: 'left',
                target: $body,
                visibleClass: 'sidebar-visible'
            });

})(jQuery);


var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
    showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("demo");
    var captionText = document.getElementById("caption");
    if (n > slides.length) {
        slideIndex = 1
    }
    if (n < 1) {
        slideIndex = slides.length
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
    captionText.innerHTML = dots[slideIndex - 1].alt;
}