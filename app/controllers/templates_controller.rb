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
#

class TemplatesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_category
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  def new
    @template = @category.templates.new
  end

  def create
    @template = @category.templates.create(template_params)
    @template.author = current_user
    if @template.save
      flash[:success] = 'Template has been created successfully'
      redirect_to category_template_path(@category, @template)
    else
      flash.now[:danger] = 'Template was not created'
      render :new
    end
  end
  def show
  end

  def edit
  end

  def update
    @template = @category.templates.build(template_params)
    if @template.save
      flash[:success] = 'Template has been updated successfully'
      redirect_to category_template_path(@category, @template)
    else
      flash.now[:danger] = 'Template was not updated'
      render :edit
    end
  end

  def destroy
    @category.templates.destroy
    redirect_to root_path
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_template
    @template = @category.templates.friendly.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:name, :category_id, :description, :points_covered)
  end
end