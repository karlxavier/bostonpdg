class InventoriesController < ApplicationController
  def index
    @restock = Inventory.where("quantity < 10").count
    @no_stock = Inventory.where("quantity = 0 OR quantity is null").count
  end

  def add_item
    @brands = Brand.all
  end

  def manage_by_hotel
    @brands = Brand.all
  end

  def view_stocks
    @categories = Category.all
    @inventories = Inventory.all
  end

  def show_brand
    @brand = Brand.find(params[:brand_id])
  end

end
