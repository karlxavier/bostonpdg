class InventoriesController < ApplicationController
  def index
    @restock = Inventory.where("quantity < 10").count
    @no_stock = Inventory.where("quantity = 0 OR quantity is null").count
  end

end
