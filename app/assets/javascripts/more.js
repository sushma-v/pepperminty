$(document).ready(function(){
    $('html, body').animate({scrollTop: 0}, "slow");

    $(".more-home-arrow").click(function(){ console.log("hehe");
        var position = $('#more-home').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });
});