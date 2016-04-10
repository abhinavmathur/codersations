class Creators::DashboardController < ApplicationController

  before_action :authorize_user

  def index
    @new_creators = User.where(creator: true).last(4)
    @categories = Category.all
  end

  def category_information
    if Category.find_by(name: params[:category]).nil?
      flash[:danger] = 'The category you looked for could not be found'
    else
      @category = Category.find_by(name: params[:category])
    end
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
