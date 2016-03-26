# == Schema Information
#
# Table name: infos
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  tutorial_id :integer
#  category_id :integer
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class InfosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_category
  before_action :set_tutorial
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def new
    @info = @tutorial.infos.new
    authorize @info, :create?
  end

  def create
    @info = @tutorial.infos.create(info_params)
    authorize @info, :create?
    if @info.save
      flash[:success] = 'Page was successfully created'
      redirect_to category_tutorial_info_path(@category, @tutorial, @info)
    else
      flash.now[:danger] = 'Page was not created'
      render :new
    end
  end

  def show
    if @tutorial.price > 0
      authenticate_user!
      if !current_user.purchases.exists?(tutorial_id: @tutorial.id)
        flash[:warning] = 'You need to purchase the tutorial to view the pages'
        redirect_to [@category, @tutorial] and return
      end
    end
    authorize @info, :show?
    @notes = @info.notes.where(user: current_user)
  end

  def edit
    authorize @info, :update?
  end

  def update
    authorize @info, :update?
    if @info.update(info_params)
      flash[:success] = 'Page was successfully updated'
      redirect_to category_tutorial_info_path(@category, @tutorial, @info)
    else
      flash.now[:danger] = 'Page was not updated'
      render :edit
    end
  end

  def destroy
    authorize @info, :destroy?
    @info.destroy
    flash[:success] = 'Page was successfully deleted'
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_tutorial
    @tutorial = @category.tutorials.friendly.find(params[:tutorial_id])
  end

  def set_info
    begin
      @info = @tutorial.infos.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = 'The page you searched for could not be found'
      redirect_to root_path
    end
  end

  def info_params
    params.require(:info).permit(:title, :content)
  end
end
