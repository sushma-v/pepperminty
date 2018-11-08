$(document).ready(function(){
    $('html, body').animate({scrollTop: 0}, "slow");

    $(".more-home-arrow").click(function(){
        var position = $('#more-home').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });

    $(".more-arrow").click(function(){
        var position = $('.more-content').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });

    $(".start").click(function(){
        var position = $('.contact-bg').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });

    $(".seo").click(function(){
        var position = $('.seo').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });
});