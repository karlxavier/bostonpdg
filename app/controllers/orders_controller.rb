class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :show]

  def send_orders
    @order = Order.find(params[:order_id].to_i)
    @vendor = Vendor.find(params[:vendor_id].to_i)
    @order_entries = OrderEntry.where(:order_id => @order.id, :vendor_id => @vendor.id)
    OrderMailer.with(order: @order, vendor: @vendor, order_entries: @order_entries).send_order_entries.deliver_now
    redirect_to admin_order_path(@order)
  end

  def index
    @orders = Order.order(updated_at: :desc, created_at: :desc)
    if @orders.present? && !@orders.nil?

      if @order.present?
        @order_entries = @order.order_entries
      else
        @order = Order.order(updated_at: :desc, created_at: :desc).first
        @order_entries = @order.order_entries
      end

    end
    @chatroom_order = ChatroomOrder.find(@order.id)
    @categories = Category.all
    @vendors = Vendor.all
    @products = Product.all
    @brands = Brand.all
  end

  def show
    respond_to do |format|
      @chatroom_order = ChatroomOrder.find(@order.id)
      @order_entries = @order.order_entries

      format.js
    end
  end

  def new
    @categories = Category.order('id DESC')
    @vendors = Vendor.order('id DESC')
    @products = Product.order('id DESC')
    @users = User.order('id DESC')
    @brands = Brand.order('id DESC')
  end

  def update_assign_user
    @order = Order.find(params[:order_user][:order_id])
    if @order.present?
      OrderUser.where(:order_id => @order.id).destroy_all
      regional = params[:order_user][:regional]
      comms = params[:order_user][:comms]
      art = params[:order_user][:art]
      processor = params[:order_user][:processor]
      designer = params[:order_user][:designer]
      client_contact = params[:order_user][:client_contact]
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
      if params[:order_user][:designer].present?
        arr_count.push(designer.length)
      else
        arr_count.push(0)
      end
      if params[:order_user][:client_contact].present?
        arr_count.push(client_contact.length)
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
        if params[:order_user][:designer].present?
          order_user.designer = designer[i]
        end
        if params[:order_user][:client_contact].present?
          order_user.client_contact = client_contact[i]
        end
        if order_user.save
          flash[:notice] = "Order Users Successfully Updated"
        else
          flash[:error] = "Order Users Created Failed"
        end
        i = i + 1
      end
    end

    if order_user.errors.any?
          puts '******* ERRORS ********'
          order_user.errors.full_messages.each do |message|
            puts message
          end
        end

    redirect_to orders_path(:id => @order.id)
  end

  def create
    @order = Order.new
    @order.brand_id = params[:order][:brand_id]
    if @order.save
      if params[:order_entries].present?
        temp_order_entries = params[:order_entries].split(",").map { |s| s.to_i }
        temp_order_entries.each do |oe|
          order_entry = OrderEntry.new
          order_entry.order_id = @order.id
          product = Product.find(oe.to_i)
          order_entry.category_id = product.item_category_id
          order_entry.vendor = product.vendor_id
          order_entry.product_id = oe
          order_entry.save
        end
      end
      if params[:order_branch].present?
        temp_order_branch = params[:order_branch].split(",").map { |s| s.to_i }
        temp_order_branch.each do |ob|
          order_branch = OrderBranch.new
          order_branch.brand_id = @order.brand_id
          order_branch.order_id = @order.id
          order_branch.address_id = ob
          order_branch.save
        end
      end
      if params[:order_user].present?
        arr_count = []
        i = 0

        if params[:order_user][:regional].present?
          arr_count.push(params[:order_user][:regional].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:comms].present?
          arr_count.push(params[:order_user][:comms].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:art].present?
          arr_count.push(params[:order_user][:art].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:processor].present?
          arr_count.push(params[:order_user][:processor].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:designer].present?
          arr_count.push(params[:order_user][:designer].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:client_contact].present?
          arr_count.push(params[:order_user][:client_contact].length)
        else
          arr_count.push(0)
        end

        while i < arr_count.max
          order_user = OrderUser.new
          order_user.order_id = @order.id
          if params[:order_user][:regional].present?
            order_user.regional = params[:order_user][:regional][i]
          end
          if params[:order_user][:comms].present?
            order_user.comms = params[:order_user][:comms][i]
          end
          if params[:order_user][:art].present?
            order_user.art = params[:order_user][:art][i]
          end
          if params[:order_user][:processor].present?
            order_user.processor = params[:order_user][:processor][i]
          end
          if params[:order_user][:designer].present?
            order_user.designer = params[:order_user][:designer][i]
          end
          if params[:order_user][:client_contact].present?
            order_user.client_contact = params[:order_user][:client_contact][i]
          end
          order_user.save
          i = i + 1
        end
      end
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
      if params[:order_entries].present? || params[:existing_entries].present?
        order_entries = OrderEntry.where(:order_id => @order.id)
        order_entries.each do |oe|
          temp_existing_entries = params[:existing_entries].split(",").map { |s| s.to_i }

          if !temp_existing_entries.include? oe.id
            OrderEntry.find(oe.id).destroy
          end
        end
        temp_order_entries = params[:order_entries].split(",").map { |s| s.to_i }
        temp_order_entries.each do |oe|
            order_entry = OrderEntry.new
            order_entry.order_id = @order.id
            product = Product.find(oe.to_i)
            order_entry.category_id = product.item_category_id
            order_entry.vendor = product.vendor_id
            order_entry.product_id = oe
            order_entry.save
        end

      end
      OrderBranch.where(:order_id => @order.id).destroy_all
      if params[:order_branch].present?
        temp_order_branch = params[:order_branch].split(",").map { |s| s.to_i }
        temp_order_branch.each do |ob|
          order_branch = OrderBranch.new
          order_branch.brand_id = @order.brand_id
          order_branch.order_id = @order.id
          order_branch.address_id = ob
          order_branch.save
        end
      end
      if params[:order_user].present?
        OrderUser.where(:order_id => @order.id).destroy_all
        arr_count = []
        i = 0

        if params[:order_user][:regional].present?
          arr_count.push(params[:order_user][:regional].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:comms].present?
          arr_count.push(params[:order_user][:comms].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:art].present?
          arr_count.push(params[:order_user][:art].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:processor].present?
          arr_count.push(params[:order_user][:processor].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:designer].present?
          arr_count.push(params[:order_user][:designer].length)
        else
          arr_count.push(0)
        end
        if params[:order_user][:client_contact].present?
          arr_count.push(params[:order_user][:client_contact].length)
        else
          arr_count.push(0)
        end

        while i < arr_count.max
          order_user = OrderUser.new
          order_user.order_id = @order.id
          if params[:order_user][:regional].present?
            order_user.regional = params[:order_user][:regional][i]
          end
          if params[:order_user][:comms].present?
            order_user.comms = params[:order_user][:comms][i]
          end
          if params[:order_user][:art].present?
            order_user.art = params[:order_user][:art][i]
          end
          if params[:order_user][:processor].present?
            order_user.processor = params[:order_user][:processor][i]
          end
          if params[:order_user][:designer].present?
            order_user.designer = params[:order_user][:designer][i]
          end
          if params[:order_user][:client_contact].present?
            order_user.client_contact = params[:order_user][:client_contact][i]
          end
          order_user.save
          i = i + 1
        end
      end
      flash[:notice] = "Order Successfully Updated"
    else
      flash[:error] = "Order Updated Failed"
    end
    redirect_to orders_path(:id => @order.id)
  end


  def edit
    @categories = Category.order('id DESC')
    @vendors = Vendor.order('id DESC')
    @products = Product.order('id DESC')
    @users = User.order('id DESC')
    @brands = Brand.order('id DESC')
    @order = Order.find(params[:id])
    @order_entries = OrderEntry.where(:order_id => @order.id)
    @order_users = OrderUser.where(:order_id => @order.id)
    @order_branches = OrderBranch.where(:order_id => @order.id)
    if @order.brand_id.present? && !@order.brand_id.nil?
      @addresses = Address.where("id IN (SELECT billing_address FROM users WHERE id IN (SELECT user_id FROM users_brands WHERE brand_id = #{@order.brand_id}))  OR id IN (SELECT shipping_address FROM users WHERE id IN (SELECT user_id FROM users_brands WHERE brand_id = #{@order.brand_id}))")
    end
  end

  private

    def set_order
      if params[:id].present? && !params[:id].nil?
        @order = Order.find(params[:id])
      end
    end

end
