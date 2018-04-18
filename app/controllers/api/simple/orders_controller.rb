module Api
  module Simple
    class OrdersController < ApplicationController

      def list
        @orders = Order.order("created_at DESC")
        render json: @orders,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date]
      end

      def update_status_entry
        entry = OrderEntry.find(params[:entry_id].to_i)
        if entry.update_attributes(:status => params[:status])
          order = Order.find(params[:order_id].to_i)
          redirect_to admin_order_path(order)
        end
      end


      def send_orders
        @order = Order.find(params[:order_id].to_i)
        @vendor = Vendor.find( params[:vendor_id].to_i)
        @order_entries = OrderEntry.where(:order_id => @order.id, :vendor => @vendor.id)
        @user = User.where(:email => "notifications@burningmidnight.com").first
        OrderMailer.with(order: @order, vendor: @vendor, order_entries: @order_entries).send_order_entries.deliver_now
        redirect_to admin_order_path(@order)
      end
    end
  end
end
