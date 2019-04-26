$(document).ready(function(){
    $('html, body').animate({scrollTop: 0}, "slow");

    $(".more-home-arrow").click(function(){
        var position = $('#more-home').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });

    $(".more-arrow").click(function(){
        var position = $('.more-content').offset();
        $('html, body').animate({scrollTop: position.top-40}, "slow");
    });

    $(".start").click(function(){
        var position = $('.contactus-bg').offset(); //contact-bg
        $('html, body').animate({scrollTop: position.top-125}, "slow");
    });

    $('.website-packages').on('shown.bs.collapse', function () {
        var position = $('.website').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });

    $('.website-packages').on('hide.bs.collapse', function () {
        var position = $('.website').prev().offset();
        $('html, body').animate({scrollTop: position.top}, "5000");
    });

    $('.seo-packages').on('shown.bs.collapse', function () {
        var position = $('.seo').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });

    $('.seo-packages').on('hide.bs.collapse', function () {
        var position = $('.seo').prev().offset();
        $('html, body').animate({scrollTop: position.top}, "5000");
    });

    $('.search-packages').on('shown.bs.collapse', function () {
        var position = $('.search').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });

    $('.search-packages').on('hide.bs.collapse', function () {
        var position = $('.search').prev().offset();
        $('html, body').animate({scrollTop: position.top}, "5000");
    });

    $('.social-packages').on('shown.bs.collapse', function () {
        var position = $('.social').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });

    $('.social-packages').on('hide.bs.collapse', function () {
        var position = $('.social').prev().offset();
        $('html, body').animate({scrollTop: position.top}, "5000");
    });
});