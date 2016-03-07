# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

class CategoriesController < ApplicationController

  before_action :set_category, only: :show

  def index
    @categories = Category.all
  end

  def show
    @templates = policy_scope @category.templates.all
    @tutorials = policy_scope @category.tutorials.all
    @snippets = policy_scope @category.snippets.all
  end

  private
  def set_category
    begin
      @category = Category.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:danger] = 'The category you searched could not be found'
      redirect_to root_path
    end
  end
end
