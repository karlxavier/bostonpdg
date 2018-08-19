class ProductsController < ApplicationController
before_action :authenticate_user!
before_action :set_product, only: [:show, :edit, :item_details]

	def item_details
		respond_to do |format|
			# @order_entry
			@messages = ItemMessage.where(product_id: @order_entry.product_id)
			# @messages = @product.item_messages

			format.js
		end
  end

  def change_picture
    if params[:product_id].present? && !params[:product_id].nil?
      @product = Product.find(params[:product_id])
      if @product.update_attributes(:picture => (params[:picture].nil? ? params[:file] : params[:picture]))
        render json: @product,methods: [:convert_dynamic_fields, :picture_url]
      else
        render nothing: true, status: :bad_request
      end
    else
      render nothing: true, status: :bad_request
    end
  end

  def create
    @product = Product.new
    @product.name = params[:product_name]
    @product.category = params[:category_id]
    if @product.save
      #Add Vendor on List
      if params[:vendor_id].present?
        if params[:vendor_id].length > 0
          params[:vendor_id].each do |id|
            VendorsProduct.create(:product_id => @product.id, :vendor_id => id)
          end
        end
      end
      if params[:quantity].present?
        Inventory.create(:product_id => @product.id, :quantity => params[:quantity].to_i)
      else
        Inventory.create(:product_id => @product.id, :quantity => 0)
      end
      flash[:notice] = "Product Item has saved successfully."
    else
      flash[:error] = "Product Item save Failed!"
    end

    redirect_to inventories_path
  end

	private

		def set_product
			@order_entry = OrderEntry.find(params[:id])
			@product = Product.find(@order_entry.product_id)
			@order = Order.find(@order_entry.order_id)
		end

end