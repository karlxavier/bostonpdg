module Api
  module Simple
    class OrdersController < ApplicationController
      before_action :set_order, only: [:show, :update]

      def list
        @orders = Order.order("created_at DESC")
        render json: @orders,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date]
      end

      def show
        render json: @order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date]
      end

      def get_latest_order
        @order = Order.all.order('created_by DESC').first
        render json: @order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date]
      end

      def show_entries
        @order_entries = OrderEntry.where("order_id = '#{params[:order_id]}'")
        render json: @order_entries, methods: [:product_name]
      end

      def show_users
        @order_users = OrderUser.where("order_id = '#{params[:order_id]}'")
        render json: @order_users, methods: [:regional_name, :comms_name, :art_name, :processor_name]
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

      protected

      def set_order
        @order = Order.find(params[:id])
      end

      def orders_params
        params[:order]
      end
    end
  end
end
