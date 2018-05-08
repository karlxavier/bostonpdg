module Api
  module Simple
    class OrdersController < ApplicationController
      before_action :set_order, only: [:show, :update]

      def list
        @orders = Order.order("updated_at DESC")
        render json: @orders,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :brand_name, :brand_branches]
      end

      def show
        render json: @order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :updated_date, :brand_name, :brand_branches, :art, :regional, :comms, :processor]
      end

      def get_latest_order
        @order = Order.all.order('created_by DESC').first
        render json: @order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :updated_date, :brand_name, :brand_branches, :art, :regional, :comms, :processor]
      end

      def show_entries
        @order_entries = OrderEntry.where("order_id = '#{params[:order_id]}'")
        render json: @order_entries, methods: [:product_name]
      end

      def show_branches
        order = Order.find(params[:order_id])
        @order_branches = OrderBranch.where(:order_id => order.id, :brand_id => order.brand_id)
        render json: @order_branches, methods: [:state_and_city]
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

      def create
        temp_order = params[:order]
        order = Order.new
        order.brand_id = temp_order[:brand]
        order.lead_time = temp_order[:lead_time]
        order.status = temp_order[:status]
        order.total_budget = temp_order[:total_budget]
        order.urgent = temp_order[:urget]

        if order.save
          if params[:order_branch].present?
            temp_order_branch = params[:order_branch]
            temp_order_branch.each do |ob|
              order_branch = OrderBranch.new
              order_branch.brand_id = order.brand_id
              order_branch.order_id = order.id
              order_branch.address_id = ob
              order_branch.save
            end
          end
          if params[:order_user].present?
            i = 0
            temp_order_user = params[:order_user]
            @temp_length = 1

            if temp_order_user[:art].length > 0
              @temp_length = temp_order_user[:art].length
            end

            while i < @temp_length
              order_user = OrderUser.new
              order_user.order_id = order.id
              if i == 0
                order_user.comms = temp_order_user[:comms]
                order_user.processor = temp_order_user[:processor]
                order_user.regional = temp_order_user[:regional]
                order_user.art = temp_order_user[:art][i]
              end
              if temp_order_user[:art][i].present?
                order_user.art = temp_order_user[:art][i]
              end
              order_user.save
              i = i+1;
            end
          end
            render json: order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :updated_date, :brand_name, :brand_branches]
        end
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
