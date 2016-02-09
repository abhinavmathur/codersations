class InfosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_category
  before_action :set_tutorial
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def new
    @info = Info.new
  end

  def create
    @info = @tutorial.infos.create(info_params)
    if @info.save
      flash[:success] = 'Page was successfully created'
      redirect_to category_tutorial_info_path(@category, @tutorial, @info)
    else
      flash.now[:danger] = 'Page was not created'
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @info.update(info_params)
      flash[:success] = 'Page was successfully updated'
      redirect_to category_tutorial_info_path(@category, @tutorial, @info)
    else
      flash.now[:danger] = 'Page was not updated'
      render :edit
    end
  end

  def destroy
    @info.destroy
    flash[:success] = 'Page was successfully deleted'
    redirect_to category_tutorial_path(@tutorial)
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_tutorial
    @tutorial = @category.tutorials.friendly.find(params[:tutorial_id])
  end

  def set_info
    @info = @tutorial.infos.friendly.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:title, :content)
  end
end
