$(document).ready(function () {
    $('#recaptcha-error').hide();
});

$('.contact-form').on('submit', function (e) {
    validateRecaptcha(e);
    return e.isDefaultPrevented()? false : true;
});

var validateRecaptcha = function(e) {
    var response = grecaptcha.getResponse();
    if(response.length == 0) { //failed validation
        e.preventDefault();
        $('#recaptcha-error').show();
    }
    else { //passed validation
        $('#recaptcha-error').hide();
    }
};