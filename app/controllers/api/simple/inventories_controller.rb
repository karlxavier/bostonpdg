module Api
  module Simple
    class InventoriesController < ApplicationController

      def list
        inventories = Inventory.all
        render json: inventories.map { |inventory| { id: inventory.id, quantity: inventory.quantity, product_name: Product.find(inventory.product_id).name, force_in_stock: Product.find(inventory.product_id).force_in_stock } }
      end

      def overall
        restock = Inventory.where("quantity < 10").count
        no_stock = Inventory.where("quantity = 0 OR quantity is null").count

        render json: {restock: restock, no_stock: no_stock}

      end
    end
  end
end
