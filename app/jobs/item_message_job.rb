class ItemMessageJob < ApplicationJob
  queue_as :default

    def perform(item_message, current_user, product_id)
	  	ActionCable.server.broadcast "items:#{product_id}", {
	  		username: item_message.user.email,
	  		message_user_id: current_user.id,
	  		message: ItemMessagesController.render(item_message),
	  		item_id: product_id,
	  		item_name: "Item-#{product_id}",
	  	}
  	end
end
