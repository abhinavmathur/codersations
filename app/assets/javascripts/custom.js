$(document).on('page:load', function(){
    window['rangy'].initialized = false
    var stoptheblink;
    $('.blink').each(function () {
        var elem = $(this);
        stoptheblink = setInterval(function () {
            if (elem.css('visibility') == 'hidden') {
                elem.css('visibility', 'visible');
            } else {
                elem.css('visibility', 'hidden');
            }
        }, 700);
    });
    setTimeout(function () {
        clearInterval(stoptheblink)
    }, 4500);
})