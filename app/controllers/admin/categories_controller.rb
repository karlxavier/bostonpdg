class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update_attributes(category_params)
          format.html { redirect_to admin_categories_path }
      else
          format.html { render 'edit' }
      end
    end
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
     if @category.save
          format.html { redirect_to admin_categories_path }
      else
          format.html { render 'new' }
      end
    end
  end

  def import_csv
      Category.import(params[:file])
      redirect_to admin_categories_path
  end

  def destroy
      @categories = Category.all
      if @category.destroy
          flash.now[:notice] = "Category #{@category.name} successfully deleted."
      else
          flash.now[:error] = "Cannot delete this category, associations still exist."
      end
      render action: :index
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
