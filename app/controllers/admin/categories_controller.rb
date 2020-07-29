class Admin::CategoriesController < ApplicationController
  def show
  end
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @article = Category.new(category_params)
  
    if @article.save
      redirect_to [:admin, :categories]
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
