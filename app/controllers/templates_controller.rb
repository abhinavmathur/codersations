# == Schema Information
#
# Table name: templates
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  name           :string
#  description    :text
#  points_covered :text
#  repo_link      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :integer
#  slug           :string
#  publish        :boolean          default(FALSE)
#

class TemplatesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_category
  before_action :set_template, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

  def new
    @template = @category.templates.new
    authorize @template, :create?
  end

  def create
    @template = @category.templates.create(template_params)
    @template.author = current_user
    authorize @template, :create?
    if @template.save
      flash[:success] = 'Template has been created successfully'
      redirect_to category_template_path(@category, @template)
    else
      flash.now[:danger] = 'Template was not created'
      render :new
    end
  end
  def show
    authorize @template, :show?
  end

  def edit
    authorize @template, :update?
  end

  def update
    @category = Category.friendly.find(params[:category_id])
    @template = @category.templates.friendly.find(params[:id])
    authorize @template, :update?
    @template.author = current_user
    if @template.update(template_params)
      flash[:success] = 'Template has been updated successfully'
      redirect_to category_template_path(@category, @template)
    else
      flash.now[:danger] = 'Template was not updated'
      render :edit
    end
  end

  def destroy
    authorize @template, :destroy?
    @category.templates.destroy
    redirect_to root_path
  end

  def publish
    @template.publish = true
    @template.save
    redirect_to category_template_path(@category, @template)
  end

  def unpublish
    @template.update(publish: false)
    redirect_to category_template_path(@category, @template)
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_template
    begin
      @template = @category.templates.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:danger] = 'The template you were looking for could not be found'
      redirect_to root_path
    end
  end

  def template_params
    params.require(:template).permit(:name, :category_id, :description, :points_covered, :publish)
  end
end
