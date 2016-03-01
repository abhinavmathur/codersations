class StripeOauth < Struct.new :user

  def oauth_url(params)
    url = client.authorize_url({
                                   scope: 'read_write',
                                   stripe_user: {
                                       email: user.email
                                   }
                               }.merge( params ) )

    begin
      response = RestClient.get url

    rescue => e
      json = JSON.parse(e.response.body) rescue nil
      if json && json['error']
        case json['error']
          when 'invalid_redirect_uri'
            return nil, <<-EOF
            Redirect URI is not setup correctly.
            Please see the <a href='#{Rails.configuration.github_url}/blob/master/README.markdown' target='_blank'>README</a>.
            EOF
          # Something else horrible happened? Network is down,
          # Stripe API is broken?...
          else
            return [ nil, params[:error_description] ]
        end
      end
      # If there was some problem parsing the body
      # or there's no 'error' parameter, then something
      # _really_ went wrong. So just blow up here.
      return [ nil, "Unable to connect to Stripe. #{e.message}" ]
    end
    [ url, nil ]
  end

  def verify!( code )
    data = client.get_token( code, {
        headers: {
            'Authorization' => "Bearer #{ENV["STRIPE_SECRET_KEY"]}"
        }
    } )

    user.stripe_account_id = data.params['stripe_user_id']
    user.publishable_key = data.params['stripe_publishable_key']
    user.secret_key = data.token
    user.currency = default_currency
    user.save!
  end


  private

  def default_currency
    Stripe::Account.retrieve( user.stripe_account_id, user.secret_key ).default_currency
  end

  def client
    @client ||= OAuth2::Client.new(
        ENV["STRIPE_CLIENT_ID"],
        ENV["STRIPE_SECRET_KEY"],
        {
            site: 'https://connect.stripe.com',
            authorize_url: '/oauth/authorize',
            token_url: '/oauth/token'
        }
    ).auth_code
  end

end