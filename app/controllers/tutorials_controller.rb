# == Schema Information
#
# Table name: tutorials
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  title          :string
#  description    :text
#  points_covered :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  link_to_repo   :string
#  slug           :string
#  author_id      :integer
#

class TutorialsController < ApplicationController

  before_action :set_category
  before_action :set_tutorial, only: [:show, :edit, :update,
                                      :destroy, :add_member,
                                      :remove_member, :like,
                                      :dislike, :admin_remove_member, :publish, :unpublish, :add_template, :add_this_template, :remove_template]
  before_action :authenticate_user!, except: :show

  def new
    @tutorial = Tutorial.new
    @@template = params[:template].to_i
    authorize @tutorial, :create?
  end

  def create
    @tutorial = @category.tutorials.create(tutorial_params)
    authorize @tutorial, :create?
    @tutorial.update(author: current_user)
    @tutorial.template_id = @@template
    Contributor.create!(tutorial: @tutorial, access: true, member: current_user)
    if @tutorial.save
      flash[:success] = 'Tutorial has been created successfully'
      redirect_to category_tutorial_path(@category, @tutorial)
    else
      flash.now[:danger] = 'Template has not been created'
      render :new
    end
  end

  def show
    authorize @tutorial, :show?
    @infos = @tutorial.infos.order('created_at ASC').all
    template_id = @tutorial.template_id if @tutorial.template_id != nil
    if template_id == nil
      return
    else
      @template = Template.find_by_id template_id
    end

  end

  def edit
    authorize @tutorial, :update?
  end

  def update
    authorize @tutorial, :update?
    if @tutorial.update(tutorial_params)
      flash[:success] = 'Tutorial has been updated successfully'
      redirect_to category_tutorial_path(@category, @tutorial)
    else
      flash.now[:danger] = 'Tutorial has not been updated'
      render :edit
    end
  end

  def destroy
    authorize @tutorial, :destroy?
    @tutorial.destroy
    redirect_to root_path
    flash[:success] = 'Tutorial has been successfully deleted'
  end

  def publish
    @tutorial.update(publish: true)
    redirect_to category_tutorial_path(@category, @tutorial)
  end

  def unpublish
    @tutorial.update(publish: false)
    redirect_to category_tutorial_path(@category, @tutorial)
  end

  def add_member
    user = params[:user].to_i
    temp_user = User.find_by_id(user)
    if @tutorial.members.include? temp_user
      flash[:danger] = 'User once denied cannot be added again. Sorry.'
    else
      Contributor.create!(tutorial: @tutorial, access: true, member: temp_user)
      @tutorial.members << temp_user
      flash[:success] = "#{temp_user.name} been added as a contributor to the tutorial"
    end
    redirect_to category_tutorial_path(@category, @tutorial)
  end

  def remove_member
    user = params[:user].to_i
    temp_user = User.find_by_id(user)
    con = Contributor.where(tutorial: @tutorial, member: temp_user, access: true).first
    con.access = false
    con.save
    flash[:success] = 'User access has been revoked'
    redirect_to category_tutorial_path(@category, @tutorial)
  end


  def like
    current_user.favorite_tutorials << @tutorial
    redirect_to category_tutorial_path(@category, @tutorial)
  end

  def dislike
    current_user.favorite_tutorials.delete @tutorial
    redirect_to category_tutorial_path(@category, @tutorial)
  end

  def admin_remove_member
    user = params[:user].to_i
    temp_user = User.find_by_id(user)
    @tutorial.members.delete temp_user
    flash[:success] = "User access for #{temp_user.name} has been reset"
    redirect_to category_tutorial_path(@category, @tutorial)
  end

  def add_template
    @templates = @category.templates.all
  end

  def add_this_template
    template = params[:template].to_i
    @tutorial.template_id = template
    if @tutorial.save
      flash[:success] = 'The template was added successfully'
    else
      flash[:danger] = 'Something went wrong. Contact the site moderators for help'
    end
    redirect_to category_tutorial_path(@category, @tutorial)
  end

  def remove_template
    @tutorial.template_id = nil
    @tutorial.save
    flash.now[:success] = 'Teemplate has been removed from the tutorial'
    redirect_to category_tutorial_path(@category, @tutorial)
  end

  private
  def tutorial_params
    params.require(:tutorial).permit(:title, :description, :points_covered, :link_to_repo, :template)
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_tutorial
    begin
      @tutorial = @category.tutorials.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = 'The tutorial you searched for could not be found'
      redirect_to root_path
    end
  end

end
