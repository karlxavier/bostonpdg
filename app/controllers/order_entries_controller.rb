class OrderEntriesController < ApplicationController

  def create
    @order_entry = OrderEntry.new
    @order_entry.order_id = params[:order_entry][:order_id]
    @order_entry.vendor = params[:order_entry][:vendor]
    @order_entry.product_id = params[:order_entry][:product_id]
    @order_entry.quoted_by = params[:order_entry][:quoted_by]
    @order_entry.category_id = params[:order_entry][:category_id]
    @order_entry.price = params[:order_entry][:price]
    @order_entry.cost = params[:order_entry][:cost]
    @order_entry.tax = params[:order_entry][:tax]
    @order_entry.quantity = params[:order_entry][:quantity]
    if params[:order_entry][:order_id].present? && params[:order_entry][:product_id].present?
      if @order_entry.save
        OrderHistory.create(:order_id => @order_entry.order_id, :order_entry_id => @order_entry.id, :description => 'has been Added', :user_id => current_user.id)
        flash[:notice] = "Order Entry Successfully Created"
      else
        flash[:error] = "Order Entry Created Failed"
      end
    else
      flash[:error] = "Order Entry Created Failed"
    end

    redirect_to orders_path(:id => @order_entry.order_id)
  end

  def destroy
    order_entry = OrderEntry.find(params[:id])
    if order_entry.destroy
      OrderHistory.create(:order_id => order_entry.order_id, :product_id => order_entry.product_id, :description => 'has been Removed', :user_id => current_user.id)
      flash[:notice] = "Order Entry Successfully Deleted"
    else
      flash[:error] = "Order Entry Deleted Failed"
    end
    redirect_to orders_path(:id => order_entry.order_id)
  end

  def update_entry
    @order_entry = OrderEntry.find(params[:order_entry][:id])
    if params[:order_entry][:order_id].present? && params[:order_entry][:product_id].present?
      if @order_entry.update_attributes(:category_id => params[:order_entry][:category_id], :vendor => params[:order_entry][:vendor], :product_id => params[:order_entry][:product_id], :order_id => params[:order_entry][:order_id], :quoted_by => params[:order_entry][:quoted_by], :price => params[:order_entry][:price], :tax => params[:order_entry][:tax], :cost => params[:order_entry][:cost], :quantity => params[:order_entry][:quantity])
        flash[:notice] = "Order Entry Successfully Updated"
      else
        flash[:error] = "Order Entry Updated Failed"
      end
    else
      flash[:error] = "Order Entry Updated Failed"
    end
    redirect_to orders_path(:id => @order_entry.order_id)
  end

  def change_status
    @order_entry = OrderEntry.find(params[:id])
    if params[:status].present? && !params[:status].nil? && params[:status] != 0 && params[:status] != ""
      if @order_entry.update_attributes(:status => params[:status])
        OrderHistory.create(:order_id => @order_entry.order_id, :order_entry_id => @order_entry.id, :description => 'has changed to Ordered', :user_id => current_user.id)
        flash[:notice] = "Item Status Successfully Updated"
      else
        flash[:error] = "Item Status Updated Failed"
      end
    else
      flash[:error] = "Item Status Updated Failed"
    end
    redirect_to orders_path(:id => @order_entry.order_id)
  end

  def change_status_on_checklist
    if params[:item_ids].present? && !params[:item_ids].nil?
      if params[:item_ids].size > 0
        params[:item_ids].each do |id|
          @order_entry = OrderEntry.find(id)
          if @order_entry.update_attributes(:status => 2)
            OrderHistory.create(:order_id => @order_entry.order_id, :order_entry_id => @order_entry.id, :description => 'has changed to Ordered', :user_id => current_user.id)
            flash[:notice] = "Item Statuses Successfully Updated"
          else
            flash[:error] = "Item Statuses Updated Failed"
          end
        end
      else
        flash[:error] = "No Item has been checked"
      end
    else
      flash[:error] = "No Item has been checked"
    end
    redirect_to orders_path(:id => params[:id])
  end

end
