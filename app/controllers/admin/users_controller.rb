class Admin::UsersController < Admin::DashboardController

  before_action :set_users, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "User with name: #{@user.name} has been successfully created."
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = "User was not created."
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end
    if @user.update(user_params)
      flash[:success] = "User has been successfully updated."
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = "User was not updated."
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'User has been deleted.'
    redirect_to admin_dashboards_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :admin, :creator, :manager)
  end

  def set_users
    @user = User.find(params[:id])
  end

end
