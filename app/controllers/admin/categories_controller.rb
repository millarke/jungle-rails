class Admin::CategoriesController < ApplicationController
  def show
  end
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
end
