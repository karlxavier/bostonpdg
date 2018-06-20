class ChatroomOrdersChannel < ApplicationCable::Channel
  	def subscribed
    	ChatroomOrder.broadcast_chatrooms(current_user.id).each do |chatroom|
      		stream_from "chatrooms:#{chatroom.id}"
    	end
  	end

  	def unsubscribed
    	stop_all_streams
  	end
end
