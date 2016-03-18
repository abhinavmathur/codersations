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
  before_action :set_snippet, except: [:new, :create, :index]

  def index
    @snippets = policy_scope @category.snippets.all
  end

  def new
    s = Snippet.new
    authorize s, :create?
    @snippet = @category.snippets.new
    @@template = params[:template].to_i || nil
  end

  def create
    @snippet = @category.snippets.create(snippet_params)
    @snippet.author = current_user
    authorize @snippet, :create?
    if Template.find_by_id @@template != nil
      @snippet.template_id = @@template
    end
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
    if @snippet.template_id?
      @template = Template.find_by(id: @snippet.template_id)
    end
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

  def like
    current_user.like_snippets << @snippet
    redirect_to [@category, @snippet]
  end

  def dislike
    current_user.like_snippets.delete @snippet
    redirect_to [@category, @snippet]
  end

  def bookmark
    current_user.favorite_snippets << @snippet
    flash[:success] = 'The snippet has been bookmarked !'
    redirect_to [@category, @snippet]
  end

  def remove_bookmark
    current_user.favorite_snippets.delete @snippet
    flash[:success] = 'The snippet has been removed from bookmarks !'
    redirect_to [@category, @snippet]
  end

  def feature

  end

  def publish
    @snippet.update(publish: true)
    flash[:success] = 'Snippet succcessfully published'
    redirect_to [@category, @snippet]
  end

  def unpublish
    @snippet.update(publish: false)
    flash[:success] = 'Snippet is now hidden from public domain'
    redirect_to [@category, @snippet]
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
