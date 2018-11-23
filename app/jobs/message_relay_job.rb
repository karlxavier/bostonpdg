class MessageRelayJob < ApplicationJob
  queue_as :default

  	# def perform(message, current_user)
	#   	ActionCable.server.broadcast "chatrooms:#{message.chatroom_order_id}", {
	#   		username: message.user.email,
	#   		message_user_id: message.user.id,
	#   		message: MessagesController.render(message),
	#   		chatroom_id: message.chatroom_order_id,
	#   		chatroom_name: "Order-#{message.chatroom_order_id}"
	#   	}
	  # end
	  
	def perform(message, current_user)
		ActionCable.server.broadcast "channels:#{message.channel_id}", {
			username: message.user.email,
			message_user_id: message.user.id,
			message: MessagesController.render(message),
			channel_id: message.channel_id,
			chatroom_name: "Order-#{message.channel_id}"
		}
	end  
end
