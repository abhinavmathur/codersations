$(document).ready(function() {
    var container, createButton, form;
    container = $('#stripe-standalone');
    if (container.length === 0) {
        return;
    }
    form = container.find('form');
    createButton = form.find('.btn');
    return form.submit(function(e) {
        return createButton.addClass('disabled').val('...');
    });
});