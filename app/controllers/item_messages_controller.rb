class ItemMessagesController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :authenticate_user!
before_action :set_item

def create
	message = @item.item_messages.new(message_params)
	message.user = current_user
	
	message.save
	ItemMessageJob.perform_later(message, current_user)
end

private

	def message_params
		params.require(:item_message).permit(:body, :attachment, :product_id)
	end

	def set_item
		@item = Product.find(params[:product_id])
	end
end
