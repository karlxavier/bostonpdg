module Api
  module Simple
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update]

      def list
        products = Product.all
        render json:  products.map { |product| { id: product.id, name: product.name } }
      end

      def index
        if params[:category].present?
          inventories = Inventory.where("product_id IN (SELECT id from products where category=?)", params[:category])
        else
          inventories = Inventory.all
        end
        render json: inventories.map { |inventory| { id: inventory.id, quantity: inventory.quantity, product_name: Product.find(inventory.product_id).name, force_in_stock: Product.find(inventory.product_id).force_in_stock, price: Product.find(inventory.product_id).price } }
      end

      def show
        product = Product.find(params[:id])
        render json: product
      end

      def create
        @product = Product.new(products_params)
        if @product.save
          render json: @product
        else
          render nothing: true, status: :bad_request
        end
      end

      def update
        if @product.update_attributes(products_params)
          head :no_content
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end

      protected

      def set_product
        @product = Product.find(params[:id])
      end

      def products_params
        params[:product]
      end

    end
  end
end
