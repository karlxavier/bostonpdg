class ItemMessagesChannel < ApplicationCable::Channel
  	def subscribed
  		# if current_user.admin?
  		# 	ChatroomOrder.all.each do |chatroom|
	   #    		stream_from "items:#{chatroom.id}"
	   #  	end
  		# else
	   #  	ChatroomOrder.broadcast_chatrooms(current_user.id).each do |chatroom|
	   #    		stream_from "items:#{chatroom.id}"
	   #  	end
	   #  end
     
      # Order.item_messages.each do |product|
      #   stream_from "items:#{product.id}"
      # end

      Product.all.each do |product|
        stream_from "items:#{product.id}"
      end
  	end

  	def unsubscribed
    	stop_all_streams
  	end
end
