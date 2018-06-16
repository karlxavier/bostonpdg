module Api
  module Simple
    class OrdersController < ApplicationController
      before_action :set_order, only: [:show, :update]

      def list
        @orders = Order.order("updated_at, created_by DESC")
        render json: @orders,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :brand_name, :brand_branches]
      end

      def show
        render json: @order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :updated_date, :brand_name, :brand_branches, :art, :regional, :comms, :processor, :temp_brand, :art_users, :regional_users, :comms_users, :processor_users]
      end

      def get_latest_order
        @order = Order.all.order('updated_at, created_by DESC').first
        render json: @order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :updated_date, :brand_name, :brand_branches, :art, :regional, :comms, :processor, :temp_brand, :art_users, :regional_users, :comms_users, :processor_users]
      end

      def show_entries
        @order_entries = OrderEntry.where("order_id = '#{params[:order_id]}'")
        render json: @order_entries, methods: [:product_name, :category_name]
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
        if @vendor.email.present? && !@vendor.email.nil?
          OrderMailer.with(order: @order, vendor: @vendor, order_entries: @order_entries).send_order_entries.deliver_now
          flash[:notice] = "Order has sent successfully."
        else
          flash[:error] = "Vendor doesn't have an email!"
        end
        redirect_to admin_order_path(@order)
      end

      def update
        temp_order = params[:order]
        order = Order.new
        order.brand_id = params[:temp_brand][:id]
        order.lead_time = temp_order[:lead_time]
        order.status = temp_order[:status]
        order.total_budget = temp_order[:total_budget]
        order.urgent = temp_order[:urget]

        if @order.update_attributes(:brand_id => order.brand_id, :lead_time => order.lead_time, :status => order.status, :total_budget => order.total_budget, :urgent => order.urgent)
          if params[:order_branch].present?
            OrderBranch.where(:order_id => @order.id).destroy_all
            temp_order_branch = params[:order_branch]
            temp_order_branch.each do |ob|
              order_branch = OrderBranch.new
              order_branch.brand_id = order.brand_id
              order_branch.order_id = order.id
              order_branch.address_id = ob
              order_branch.save
            end
          end
          if params[:art].present? || params[:comms].present? || params[:processor].present? || params[:regional].present?
            user = OrderUser.where(:order_id => @order.id).first
            user.update_attributes(:art => params[:art][:id], :regional => params[:regional][:id], :processor => params[:processor][:id], :comms => params[:comms][:id])
          end
          render json: @order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :updated_date, :brand_name, :brand_branches, :art, :comms, :regional, :processor, :temp_brand]
        end
      end

      def create
        temp_order = params[:order]
        order = Order.new
        order.brand_id = params[:temp_brand][:id]
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
          regional = []
          comms = []
          art = []
          processor = []
          arr_count = []
          i = 0
          params[:regional].each do |user|
            if user[:selected].to_s == 'true'
              regional.push(user)
            end
          end

          params[:comms].each do |user|
            if user[:selected].to_s == 'true'
              comms.push(user)
            end
          end

          params[:art].each do |user|
            if user[:selected].to_s == 'true'
              art.push(user)
            end
          end

          params[:processor].each do |user|
            if user[:selected].to_s == 'true'
              processor.push(user)
            end
          end

          arr_count.push(regional.length)
          arr_count.push(comms.length)
          arr_count.push(art.length)
          arr_count.push(processor.length)

          while i < arr_count.max
            order_user = OrderUser.new
            order_user.order_id = order.id
            if regional[i].present?
              order_user.regional = regional[i][:id]
            end
            if comms[i].present?
              order_user.comms = comms[i][:id]
            end
            if art[i].present?
              order_user.art = art[i][:id]
            end
            if processor[i].present?
              order_user.processor = processor[i][:id]
            end
            order_user.save
            i = i + 1
          end

=begin
          if params[:order_user].present?
            i = 0
            #temp_order_user = params[:order_user]
            @temp_length = 1

            if temp_order_user[:art].length > 0
              @temp_length = temp_order_user[:art].length
            end

            while i < @temp_length
              order_user = OrderUser.new
              order_user.order_id = order.id
              if i == 0
                if temp_order_user[:comms].present?
                  order_user.comms = temp_order_user[:comms]
                end
                if temp_order_user[:processor].present?
                  order_user.processor = temp_order_user[:processor]
                end
                if temp_order_user[:regional].present?
                  order_user.regional = temp_order_user[:regional]
                end
                order_user.art = temp_order_user[:art][i]
              end
              if temp_order_user[:art][i].present?
                order_user.art = temp_order_user[:art][i]
              end
              order_user.save
              i = i+1;
            end
          end
=end

            render json: order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :updated_date, :brand_name, :brand_branches, :art, :comms, :regional, :processor, :temp_brand]
        end
      end

      def update_assign_user
        @order = Order.find(params[:order_id])
        regional = []
        comms = []
        art = []
        processor = []
        arr_count = []
        i = 0
        if @order.present?
          OrderUser.where(:order_id => @order.id).destroy_all
          params[:regional].each do |user|
            if user[:selected].to_s == 'true'
              regional.push(user)
            end
          end

          params[:comms].each do |user|
            if user[:selected].to_s == 'true'
              comms.push(user)
            end
          end

          params[:art].each do |user|
            if user[:selected].to_s == 'true'
              art.push(user)
            end
          end

          params[:processor].each do |user|
            if user[:selected].to_s == 'true'
              processor.push(user)
            end
          end

          arr_count.push(regional.length)
          arr_count.push(comms.length)
          arr_count.push(art.length)
          arr_count.push(processor.length)

          while i < arr_count.max
            order_user = OrderUser.new
            order_user.order_id = @order.id
            if regional[i].present?
              order_user.regional = regional[i][:id]
            end
            if comms[i].present?
              order_user.comms = comms[i][:id]
            end
            if art[i].present?
              order_user.art = art[i][:id]
            end
            if processor[i].present?
              order_user.processor = processor[i][:id]
            end
            order_user.save
            i = i + 1
          end


          render json: @order,methods: [:created_by_name, :customer_name, :last_updated_by_name, :created_date, :updated_date, :brand_name, :brand_branches, :art, :comms, :regional, :processor, :temp_brand]
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
