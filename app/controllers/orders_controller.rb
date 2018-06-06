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
    @categories = Category.all
    @vendors = Vendor.all
    @products = Product.all
    @users = User.all
    @brands = Brand.all
  end

  def new
    @categories = Category.all
    @vendors = Vendor.all
    @products = Product.all
    @users = User.all
    @brands = Brand.all
  end

  def update_assign_user
    @order = Order.find(params[:order_user][:order_id])
    if @order.present?
      OrderUser.where(:order_id => @order.id).destroy_all
      regional = params[:order_user][:regional]
      comms = params[:order_user][:comms]
      art = params[:order_user][:art]
      processor = params[:order_user][:processor]
      arr_count = []
      i = 0

      if params[:order_user][:regional].present?
        arr_count.push(regional.length)
      else
        arr_count.push(0)
      end
      if params[:order_user][:comms].present?
        arr_count.push(comms.length)
      else
        arr_count.push(0)
      end
      if params[:order_user][:art].present?
        arr_count.push(art.length)
      else
        arr_count.push(0)
      end
      if params[:order_user][:processor].present?
        arr_count.push(processor.length)
      else
        arr_count.push(0)
      end

      while i < arr_count.max
        order_user = OrderUser.new
        order_user.order_id = @order.id
        if params[:order_user][:regional].present?
          order_user.regional = regional[i]
        end
        if params[:order_user][:comms].present?
          order_user.comms = comms[i]
        end
        if params[:order_user][:art].present?
          order_user.art = art[i]
        end
        if params[:order_user][:processor].present?
          order_user.processor = processor[i]
        end
        if order_user.save
          flash[:notice] = "Order Users Successfully Updated"
        else
          flash[:error] = "Order Users Created Failed"
        end
        i = i + 1
      end
    end

    redirect_to orders_path(:id => @order.id)
  end

  def create
    temp_order = params[:order]
    @order = Order.new
    @order.brand_id = temp_order[:brand_id]
    @order.lead_time = temp_order[:lead_time]
    @order.status = temp_order[:status]
    @order.total_budget = temp_order[:total_budget]

    if @order.save
      flash[:notice] = "Order Successfully Created"
    else
      flash[:error] = "Order Created Failed"
    end

    redirect_to orders_path(:id => @order.id)
  end

  def update_order
    temp_order = params[:order]
    @order = Order.find(temp_order[:id])

    if @order.update_attributes(:brand_id => temp_order[:brand_id], :lead_time => temp_order[:lead_time], :status => temp_order[:status], :total_budget => temp_order[:total_budget])
      flash[:notice] = "Order Successfully Updated"
    else
      flash[:error] = "Order Updated Failed"
    end
    redirect_to orders_path(:id => @order.id)
  end

end
