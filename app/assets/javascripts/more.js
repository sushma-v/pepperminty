$(document).ready(function(){
    $('html, body').animate({scrollTop: 0}, "slow");

    $(".more-home-arrow").click(function(){ console.log("test");
        var position = $('#more-home').offset();
        $('html, body').animate({scrollTop: position.top}, "slow");
    });
});