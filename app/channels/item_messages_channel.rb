class ItemMessagesChannel < ApplicationCable::Channel
  	def subscribed

      Product.all.each do |product|
        stream_from "items:#{product.id}"
      end
  	end

  	def unsubscribed
    	stop_all_streams
  	end
end
