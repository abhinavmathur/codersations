class ConnectController < ApplicationController


  def oauth
    connector = StripeOauth.new( current_user )
    url, error = connector.oauth_url( redirect_uri: stripe_confirm_url )

    if url.nil?
      flash[:danger] = error
      redirect_to user_path( current_user )
    else
      redirect_to url
    end
  end

  def confirm
    connector = StripeOauth.new( current_user )
    if params[:code]
      connector.verify!(params[:code])
      ahoy.track 'Connected to Stripe', track: current_user.name
      flash[:success] = 'You have successfully connected your Stripe Account with Codersations !'
    elsif params[:error]
      flash[:error] = 'There was an error while authorizing the account with Stripe'
    end
    redirect_to root_path
  end
end