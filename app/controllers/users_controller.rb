class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @templates = Template.where(author_id: @user.id).all

  end
end
