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
      if @product.update_attributes(:picture => params[:picture])
        flash[:notice] = "Product Picture Successfully Updated"
      else
        flash[:error] = "Product Picture Updated Failed"
      end
    else
      flash[:error] = "Product Doesn't Exist"
    end
    redirect_to orders_path(:id => params[:order_id], :product_id => params[:product_id], :order_entry_id => params[:order_entry_id])
  end

	private

		def set_product
			@order_entry = OrderEntry.find(params[:id])
			@product = Product.find(@order_entry.product_id)
			@order = Order.find(@order_entry.order_id)
		end

end