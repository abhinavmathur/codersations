# == Schema Information
#
# Table name: infopages
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  template_id :integer
#  category_id :integer
#  slug        :string
#  tutorial_id :integer
#

class InfopagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_category
  before_action :set_template
  before_action :set_infopage, only: [:show, :edit, :update, :destroy]

  def new
    @infopage = @template.infopages.build
    authorize @infopage, :create?
  end

  def create
    @infopage = @template.infopages.create(infopage_params)
    authorize @infopage, :create?
    if @infopage.save
      flash[:success] = 'Page was successfully created'
      redirect_to category_template_infopage_path(@category, @template, @infopage)
    else
      flash.now[:danger] = 'Page was not created'
      render :new
    end
  end

  def show
    authorize @infopage, :show?
  end

  def edit
    authorize @infopage, :update?
  end

  def update
    authorize @infopage, :update?
    if @infopage.update(infopage_params)
      flash[:success] = 'Page was successfully updated'
      redirect_to category_template_infopage_path(@category, @template, @infopage)
    else
      flash.now[:danger] = 'Page was not updated'
      render :edit
    end
  end

  def destroy
    authorize @infopage, :destroy?
    @infopage.destroy
    flash[:success] = 'Page was successfully deleted'
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_template
    @template = @category.templates.friendly.find(params[:template_id])
  end

  def set_infopage
    begin
      @infopage = @template.infopages.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:danger] = 'The page you searched for could not be found'
      redirect_to root_path
    end
  end

  def infopage_params
    params.require(:infopage).permit(:title, :content)
  end

end
