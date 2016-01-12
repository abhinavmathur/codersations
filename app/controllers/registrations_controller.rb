class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:name, :description, :email, :password, :password_confirmation,
    :github, :display_github, :bitbucket, :display_bitbucket, :personal_website, :display_personal_website)
  end

  def account_update_params
    params.require(:user).permit(:name, :description, :email, :current_password, :password_confirmation,
                                 :github, :display_github, :bitbucket, :display_bitbucket, :personal_website, :display_personal_website)
  end
end