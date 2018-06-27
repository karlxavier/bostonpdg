class ItemMessageJob < ApplicationJob
  queue_as :default

    def perform(item_message, current_user)
	  	ActionCable.server.broadcast "items:#{item_message.product_id}", {
	  		username: item_message.user.email,
	  		message_user_id: current_user.id,
	  		message: ItemMessagesController.render(item_message),
	  		item_id: item_message.product_id,
	  		item_name: "Item-#{item_message.product_id}",
	  	}
  	end
end
