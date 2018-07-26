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
        render json: @product,methods: [:convert_dynamic_fields, :picture_url]
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

      def create_item
        @product = Product.new
        @product.name = params[:product_name]
        @product.category = params[:category_id]
        @product.item_category_id = params[:item_category_id]
        @product.specs = params[:specs]
        @product.vendor_quote_prices = params[:vendor_quote_prices]
        @product.notes = params[:notes]
        @product.dynamic_fields = params[:dynamic_fields].to_s
        # @product.vendor_id = params[:vendor_id]
        if @product.save
          #Add Vendor on List
          if params[:vendor_id].present?
            if params[:vendor_id].length > 0
              params[:vendor_id].each do |id|
                OrderEntryVendor.create(:product_id => @product.id, :vendor_id => id)
              end
            end
          end
          render json: @product
        else
          render nothing: true, status: :bad_request
        end
      end

      def update
        @temp_product = Product.new
        if params[:product_name].present? && !params[:product_name].nil?
          @temp_product.name = params[:product_name]
        else
          @temp_product.name = @product.name
        end
        if params[:category_id].present? && !params[:category_id].nil?
          @temp_product.category = params[:category_id]
        else
          @temp_product.category = @product.category
        end
        if params[:item_category_id].present? && !params[:item_category_id].nil?
          @temp_product.item_category_id = params[:item_category_id]
        else
          @temp_product.item_category_id = @product.item_category_id
        end
        if params[:specs].present? && !params[:specs].nil?
          @temp_product.specs = params[:specs]
        else
          @temp_product.specs = @product.specs
        end
        if params[:vendor_quote_prices].present? && !params[:vendor_quote_prices].nil?
          @temp_product.vendor_quote_prices = params[:vendor_quote_prices]
        else
          @temp_product.vendor_quote_prices = @product.vendor_quote_prices
        end
        if params[:notes].present? && !params[:notes].nil?
          @temp_product.notes = params[:notes]
        else
          @temp_product.notes = @product.notes
        end
        if params[:dynamic_fields].present? && !params[:dynamic_fields].nil?
          @temp_product.dynamic_fields = params[:dynamic_fields]
        else
          @temp_product.dynamic_fields = @product.dynamic_fields
        end

        if params[:vendor_id].present? && !params[:vendor_id].nil?
          @temp_product.vendor_id = params[:vendor_id]
        else
          @temp_product.vendor_id = @product.vendor_id
        end
        if @product.update_attributes(:name => @temp_product.name, :category => @temp_product.category, :item_category_id => @temp_product.item_category_id, :specs => @temp_product.specs, :vendor_quote_prices => @temp_product.vendor_quote_prices, :notes => @temp_product.notes, :dynamic_fields => @temp_product.dynamic_fields, :vendor_id => @temp_product.vendor_id)
          head :no_content
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end

      def update_product
        @product = Product.find(params[:id])
        @temp_product = Product.new
        if params[:product_name].present? && !params[:product_name].nil?
          @temp_product.name = params[:product_name]
        else
          @temp_product.name = @product.name
        end
        if params[:category_id].present? && !params[:category_id].nil?
          @temp_product.category = params[:category_id]
        else
          @temp_product.category = @product.category
        end
        if params[:item_category_id].present? && !params[:item_category_id].nil?
          @temp_product.item_category_id = params[:item_category_id]
        else
          @temp_product.item_category_id = @product.item_category_id
        end
        if params[:specs].present? && !params[:specs].nil?
          @temp_product.specs = params[:specs]
        else
          @temp_product.specs = @product.specs
        end
        if params[:vendor_quote_prices].present? && !params[:vendor_quote_prices].nil?
          @temp_product.vendor_quote_prices = params[:vendor_quote_prices]
        else
          @temp_product.vendor_quote_prices = @product.vendor_quote_prices
        end
        if params[:notes].present? && !params[:notes].nil?
          @temp_product.notes = params[:notes]
        else
          @temp_product.notes = @product.notes
        end
        if params[:dynamic_fields].present? && !params[:dynamic_fields].nil?
          @temp_product.dynamic_fields = params[:dynamic_fields]
        else
          @temp_product.dynamic_fields = @product.dynamic_fields
        end
        if params[:vendor_id].present? && !params[:vendor_id].nil?
          @temp_product.vendor_id = params[:vendor_id]
        else
          @temp_product.vendor_id = @product.vendor_id
        end
        if @product.update_attributes(:name => @temp_product.name, :category => @temp_product.category, :item_category_id => @temp_product.item_category_id, :specs => @temp_product.specs, :vendor_quote_prices => @temp_product.vendor_quote_prices, :notes => @temp_product.notes, :dynamic_fields => @temp_product.dynamic_fields, :vendor_id => @temp_product.vendor_id)
          render json: @product
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end

      def get_products_category
        products = Product.where(:category => params[:category_id])
        render json: products
      end

      def show
        render json: @product,methods: [:convert_dynamic_fields, :picture_url, :specs_html, :vendor_quote_prices_html, :notes_html]
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
