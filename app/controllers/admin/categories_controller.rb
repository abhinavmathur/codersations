class Admin::CategoriesController < Admin::DashboardController

  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = "Category #{@category.name} has been created."
      redirect_to @category
    else
      flash.now[:danger] = 'Category was not created.'
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category #{@category.name} has been updated."
      redirect_to @category
    else
      flash.now[:danger] = 'Category was not updated.'
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Category was successfully deleted.'
    redirect_to root_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :slug)
  end

  def set_category
    @category = Category.friendly.find(params[:id])
  end
end
