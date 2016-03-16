jQuery(function($) {
    $('#payment-form').submit(function(event) {
        var $form = $(this);

        // Disable the submit button to prevent repeated clicks
        $form.find('button').prop('disabled', true);
        $form.find('button').text('Processing Payment ').append('<i class="fa fa-cog fa-spin"></i>');
        Stripe.card.createToken($form, stripeResponseHandler);

        // Prevent the form from submitting with the default action
        return false;
    });
});
function stripeResponseHandler(status, response) {
    var $form = $('#payment-form');

    if (response.error) {
        // Show the errors on the form
        $form.find('.payment-errors').text(response.error.message);
        $form.find('button').prop('disabled', false);
    } else {
        // response contains id and card, which contains additional card details
        var token = response.id;
        // Insert the token into the form so it gets submitted to the server
        $form.append($('<input type="hidden" name="stripeToken" />').val(token));
        $form.append($('<input type="hidden" name="card_last4" />').val(response.card.last4));
        $form.append($('<input type="hidden" name="card_exp_month" />').val(response.card.exp_month));
        $form.append($('<input type="hidden" name="card_exp_year" />').val(response.card.exp_year));
        $form.append($('<input type="hidden" name="card_type" />').val(response.card.brand));
        // and submit
        $form.get(0).submit();
    }
};