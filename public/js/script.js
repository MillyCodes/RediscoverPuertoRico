// this function loads a random image from the hero gallery to show on each reload

$(document).ready(function() {
        var images = ['hero1.jpg', 'hero2.jpg', 'hero3.jpg', 'hero4.jpg', 'hero5.jpg'];

        $('.hero').css({'background-image': 'url(/img/hero/' + images[Math.floor(Math.random() * images.length)] + ')'});
    });