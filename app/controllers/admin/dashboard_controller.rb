class Admin::DashboardController < ApplicationController
  before_action :authorize_admin!

  def index
  end


  private
  def authorize_admin!
    authenticate_user!
    if !current_user.admin
      redirect_to root_path
      flash[:danger] = 'You must be an admin to do that :)'
    end
  end
end
