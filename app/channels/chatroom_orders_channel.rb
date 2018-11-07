class ChatroomOrdersChannel < ApplicationCable::Channel
  	def subscribed
  		if current_user.admin?
  			ChatroomOrder.all.each do |chatroom|
	      		stream_from "chatrooms:#{chatroom.id}"
	    	end
  		else
	    	ChatroomOrder.broadcast_chatrooms(current_user.id).each do |chatroom|
	      		stream_from "chatrooms:#{chatroom.id}"
	    	end
	    end
  	end

  	def unsubscribed
    	stop_all_streams
  	end
end
