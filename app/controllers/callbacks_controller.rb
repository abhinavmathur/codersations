class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "GitHub") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      flash[:warning] = "You manually registered an account with Codersations. Please enter the email and password to login. #{@user.uid}"
      redirect_to new_user_session_path
    end
  end

  def failure
    flash[:danger] = 'Your GitHub account was not created.'
    redirect_to root_path
  end
end