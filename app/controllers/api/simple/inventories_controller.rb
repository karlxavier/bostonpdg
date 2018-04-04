module Api
  module Simple
    class InventoriesController < ApplicationController
      before_action :set_inventory, only: [:show, :update]

      def list
        inventories = Inventory.all
        render json: inventories.map { |inventory| { id: inventory.id, quantity: inventory.quantity, product_name: Product.find(inventory.product_id).name, force_in_stock: Product.find(inventory.product_id).force_in_stock } }
      end

      def index
        if params[:category].present?
          inventories = Inventory.where("product_id IN (SELECT id from products where category=?)", params[:category])
        else
          inventories = Inventory.all
        end
        render json: inventories.map { |inventory| { id: inventory.id, quantity: inventory.quantity, product_name: Product.find(inventory.product_id).name, force_in_stock: Product.find(inventory.product_id).force_in_stock } }
      end

      def overall
        restock = Inventory.where("quantity < 10").count
        no_stock = Inventory.where("quantity = 0 OR quantity is null").count

        render json: {restock: restock, no_stock: no_stock}

      end

      def show
        render json: @inventory
      end

      def create
        @inventory = Inventory.new(inventories_params)
        if @inventory.save
          render json: @inventory
        else
          render nothing: true, status: :bad_request
        end
      end

      def update
        if @inventory.update_attributes(inventories_params)
          head :no_content
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end

      protected

      def set_inventory
        @inventory = Inventory.find(params[:id])
      end

      def inventories_params
        params[:inventory]
      end
    end
  end
end
