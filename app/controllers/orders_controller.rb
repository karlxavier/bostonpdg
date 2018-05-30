class OrdersController < ApplicationController
  def send_orders
    @order = Order.find(params[:order_id].to_i)
    @vendor = Vendor.find(params[:vendor_id].to_i)
    @order_entries = OrderEntry.where(:order_id => @order.id, :vendor_id => @vendor.id)
    OrderMailer.with(order: @order, vendor: @vendor, order_entries: @order_entries).send_order_entries.deliver_now
    redirect_to admin_order_path(@order)
  end

  def index
    @orders = Order.order("updated_at, created_by DESC")
    if @orders.present? && !@orders.nil?
      if params[:id].present? && !params[:id].nil?
        @order = Order.find(params[:id])
        @order_entries = OrderEntry.where("order_id = '#{@order.id}'")
        @order_users = OrderUser.where("order_id = '#{@order.id}'")
      else
        @order = Order.order('updated_at, created_by DESC').first
        @order_entries = OrderEntry.where("order_id = '#{@order.id}'")
        @order_users = OrderUser.where("order_id = '#{@order.id}'")
      end

    end
  end

end
