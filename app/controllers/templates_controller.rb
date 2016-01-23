class TemplatesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  def new
    @template = Template.new
  end

  def create
    @template = Template.create(template_params)
    @template.author = current_user
    if @template.save
      flash[:success] = 'Template has been created successfully'
      redirect_to template_path(@template)
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
    @template = Template.update(template_params)
    if @template.save
      flash[:success] = 'Template has been updated successfully'
      redirect_to template_path(@template)
    else
      flash.now[:danger] = 'Template was not updated'
      render :edit
    end
  end

  def destroy
    @template.destroy
    redirect_to root_path
  end

  private
  def set_template
    @template = Template.friendly.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:name, :category_id, :description, :points_covered)
  end
end
