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


	private

		def set_product
			@order_entry = OrderEntry.find(params[:id])
			@product = Product.find(@order_entry.product_id)
			@order = Order.find(@order_entry.order_id)
		end

end