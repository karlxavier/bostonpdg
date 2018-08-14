class Admin::OrdersController < ApplicationController
    before_action :set_order, only: [:edit, :update]

    def index
        @orders = Order.all
    end

    def edit
    end 

    def update
        respond_to do |format|
            if @order.update_attributes(order_params)
                format.html { redirect_to admin_orders_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)

        respond_to do |format|
           if @order.save
                format.html { redirect_to admin_orders_path }
            else
                format.html { render 'new' }
            end
        end
    end

    private

        def order_params
            params.require(:order).permit(:created_by, :order_status_id, :customer_id, :delivery_address, :payment_address,
                                        :total_cost, :total_tax, :total_discount, :margin, :last_updated_by,
                                        :promise_date, :notes, :fulfillment_date, :lead_time, :total_budget,
                                        :urgent, :brand_id)
        end

        def set_order
            @order = Order.find(params[:id])
        end

end

