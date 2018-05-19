module Api
  module Simple
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update]

      def list
        products = Product.all.order("created_at DESC")
        render json:  products.map { |product| { id: product.id, name: product.name } }
      end

      def get_item_list
        products = Product.where("name LIKE '#{params[:name]}%'").order("created_at DESC").limit(50)
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
        render json: @product
      end

      def create
        @product = Product.new
        @product.name = params[:product][:name]
        @product.category = params[:product][:category_id]
        if @product.save
          @attributes = StyleAttribute.new
          @attributes.name = params[:product][:name]
          @attributes.height = params[:height]
          @attributes.width = params[:width]
          @attributes.finish = params[:finish]
          @attributes.product_id = @product.id
          @attributes.save

          VendorCategory.new(:vendor_id => params[:vendor_id], :category_id =>  params[:product][:category_id]).save
          VendorsProduct.new(:vendor_id => params[:vendor_id], :product_id => @product.id).save

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

      def get_products_category
        products = Product.where(:category => params[:category_id])
        render json: products
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
