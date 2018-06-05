class OrderEntriesController < ApplicationController

  def create
    @order_entry = OrderEntry.new()
    @order_entry.order_id = params[:order_entry][:order_id]
    @order_entry.vendor = params[:order_entry][:vendor]
    @order_entry.product_id = params[:order_entry][:product_id]
    @order_entry.quoted_by = params[:order_entry][:quoted_by]
    @order_entry.category_id = params[:order_entry][:category_id]
    @order_entry.price = params[:order_entry][:price]
    @order_entry.cost = params[:order_entry][:cost]
    @order_entry.tax = params[:order_entry][:tax]
    @order_entry.quantity = params[:order_entry][:quantity]
    if @order_entry.save
      flash[:notice] = "Order Entry Successfully Created"
    else
      flash[:error] = "Order Entry Created Failed"
    end
    redirect_to orders_path(:id => @order_entry.order_id)
  end

  def destroy
    order_entry = OrderEntry.find(params[:id])
    if order_entry.destroy
      flash[:notice] = "Order Entry Successfully Deleted"
    else
      flash[:error] = "Order Entry Deleted Failed"
    end
    redirect_to orders_path(:id => order_entry.order_id)
  end

  def update_entry
    @order_entry = OrderEntry.find(params[:order_entry][:id])
    if @order_entry.update_attributes(:category_id => params[:order_entry][:category_id], :vendor => params[:order_entry][:vendor], :product_id => params[:order_entry][:product_id], :order_id => params[:order_entry][:order_id], :quoted_by => params[:order_entry][:quoted_by], :price => params[:order_entry][:price], :tax => params[:order_entry][:tax], :cost => params[:order_entry][:cost], :quantity => params[:order_entry][:quantity])
      flash[:notice] = "Order Entry Successfully Updated"
    else
      flash[:error] = "Order Entry Updated Failed"
    end
    redirect_to orders_path(:id => @order_entry.order_id)
  end

end
