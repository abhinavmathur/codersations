# == Schema Information
#
# Table name: snippets
#
#  id          :integer          not null, primary key
#  category_id :integer
#  title       :string
#  content     :text
#  featured    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#  publish     :boolean          default(FALSE)
#  slug        :string
#

class SnippetsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_category
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]

  def index
    @snippets = policy_scope @category.snippets.all
  end

  def new
    s = Snippet.new
    authorize s, :create?
    @snippet = @category.snippets.new
  end

  def create
    @snippet = @category.snippets.create(snippet_params)
    @snippet.author = current_user
    auhtorizr @snippet, :create?
    if @snippet.save
      flash[:success] = 'Snippet has been created successfully'
      redirect_to category_snippet_path(@category, @snippet)
    else
      flash.now[:danger] = 'Snippet was not created'
      render :new
    end
  end

  def show
    authorize @snippet, :show?

  end

  def edit
    authorize @snippet, :update?
  end

  def update
    authorize @snippet, :update?
    if @snippet.update(snippet_params)
      flash[:success] = 'Snippet has been updated successfully'
      redirect_to category_snippet_path(@category, @snippet)
    else
      flash[:danger] = 'Snippet was not updated'
      render :edit
    end
  end

  def destroy
    authorize @snippet, :destroy?
    @snippet.destroy
    flash[:success] = 'The snippet was deleted successfully'
    redirect_to root_path
  end

  private
  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_snippet
    begin
      @snippet = @category.snippets.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = 'The tutorial you searched for could not be found'
      redirect_to root_path
    end
  end

  def snippet_params
    params.require(:snippet).permit(:title, :content)
  end
end