module Api
  module Simple
    class OrdersController < ApplicationController
<<<<<<< HEAD
      def update_status_entry
        entry = OrderEntry.find(params[:entry_id].to_i)
        if entry.update_attributes(:status => params[:status])
          order = Order.find(params[:order_id].to_i)
          redirect_to admin_order_path(order)
        end
      end

=======
>>>>>>> 2c263ce7664c94f2c36b2b1b89d0ea08ce6549ef
      def send_orders
        @order = Order.find(params[:order_id].to_i)
        @vendor = Vendor.find( params[:vendor_id].to_i)
        @order_entries = OrderEntry.where(:order_id => @order.id, :vendor => @vendor.id)
        @user = User.where(:email => "notifications@burningmidnight.com").first

        @body = ""

        @order_entries.each do |entry|
          product = Product.find(entry.product_id)
          user = User.find(entry.quoted_by)
          @body = @body + "<h2>Entry ##{entry.id}</h2>"
          @body = @body + "<p>"
          @body = @body + "<b>Product: </b>"
          @body = @body + "#{product.name}"
          @body = @body + "</p>"
          @body = @body + "<p>"
          @body = @body + "<b>Price: </b>"
          @body = @body + "#{entry.price}"
          @body = @body + "</p>"
          @body = @body + "<p>"
          @body = @body + "<b>Cost: </b>"
          @body = @body + "#{entry.cost}"
          @body = @body + "</p>"
          @body = @body + "<p>"
          @body = @body + "<b>Tax: </b>"
          @body = @body + "#{entry.tax}"
          @body = @body + "</p>"
          @body = @body + "<p>"
          @body = @body + "<b>Quoted By: </b>"
          @body = @body + "#{user.first_name + ' ' + user.last_name}"
          @body = @body + "</p>"
          @body = @body + "<p>"
          @body = @body + "<b>Quantity: </b>"
          @body = @body + "#{entry.quantity}"
          @body = @body + "</p>"
        end

        puts "#{@body}"

        @user.send_message(@vendor, @body, "Order Ticket ##{@order.id}")
        redirect_to admin_order_path(@order)
      end
    end
  end
end
