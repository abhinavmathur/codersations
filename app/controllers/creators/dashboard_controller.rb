class Creators::DashboardController < ApplicationController

  before_action :authorize_user

  def index
    @new_creators = User.where(creator: true).last(4)
  end

  private
  def authorize_user
    authenticate_user!
    unless current_user.try(:admin) || current_user.try(:manager) || current_user.try(:creator)
      flash[:danger] = 'You are not authorized to access this page'
      redirect_to root_path
    end
  end
end
