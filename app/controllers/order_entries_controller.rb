class OrderEntriesController < ApplicationController

  def create
    @order_entry = OrderEntry.new
    @order_entry.order_id = params[:order_entry][:order_id]
    @order_entry.product_id = params[:order_entry][:product_id]
    @order_entry.quoted_by = params[:order_entry][:quoted_by]
    @order_entry.category_id = params[:order_entry][:category_id]
    @order_entry.price = params[:order_entry][:price]
    @order_entry.cost = params[:order_entry][:cost]
    @order_entry.tax = params[:order_entry][:tax]
    @order_entry.quantity = params[:order_entry][:quantity]
    @order_entry.specs = params[:order_entry][:specs]
    @order_entry.vendor_quote_prices = params[:order_entry][:vendor_quote_prices]
    @order_entry.notes = params[:order_entry][:notes]
    @order_entry.dynamic_fields = params[:order_entry][:dynamic_fields].to_s
    if params[:order_entry][:order_id].present? && params[:order_entry][:product_id].present?
      if @order_entry.save
        if params[:order_entry][:vendor].present?
          if params[:order_entry][:vendor].length > 0
            params[:order_entry][:vendor].each do |id|
              OrderEntryVendor.create(:order_entry_id => @order_entry.id, :product_id => @order_entry.product_id, :vendor_id => id.to_i)
            end
          end
        end
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
      OrderEntryVendor.where(:order_entry_id => params[:id]).destroy_all
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
      if @order_entry.update_attributes(:category_id => params[:order_entry][:category_id], :product_id => params[:order_entry][:product_id], :order_id => params[:order_entry][:order_id], :quoted_by => params[:order_entry][:quoted_by], :price => params[:order_entry][:price], :tax => params[:order_entry][:tax], :cost => params[:order_entry][:cost], :quantity => params[:order_entry][:quantity], :specs => params[:order_entry][:specs], :vendor_quote_prices => params[:order_entry][:vendor_quote_prices], :notes => params[:order_entry][:notes], :dynamic_fields => params[:order_entry][:dynamic_fields].to_s )
        if params[:order_entry][:vendor].present?
          if params[:order_entry][:vendor].length > 0
            temp_existing_vendors = params[:order_entry][:vendor]
            puts "#{temp_existing_vendors}"
            order_entry_vendors = OrderEntryVendor.where(:order_entry_id => @order_entry.id)
            order_entry_vendors.each do |oe|
              if !temp_existing_vendors.include? oe.vendor_id.to_s
                oe.destroy
              end
            end
            temp_existing_vendors.each do |vl|
              if OrderEntryVendor.where(:order_entry_id => @order_entry.id, :vendor_id => vl.to_i).length == 0
                OrderEntryVendor.create(:order_entry_id => @order_entry.id, :product_id => @order_entry.product_id, :vendor_id => vl.to_i)
              end
            end
          end
        else
          OrderEntryVendor.where(:order_entry_id => @order_entry.id).destroy_all
        end
        flash[:notice] = "Order Entry Successfully Updated"
      else
        flash[:error] = "Order Entry Updated Failed"
      end
    else
      flash[:error] = "Order Entry Updated Failed"
    end
    redirect_to orders_path(:id => @order_entry.order_id, :product_id => @order_entry.product_id, :order_entry_id => @order_entry.id)
  end

  def change_status
    @order_entry = OrderEntry.find(params[:id])
    if params[:status].present? && !params[:status].nil? && params[:status] != ""
      if @order_entry.update_attributes(:status => params[:status])
        OrderHistory.create(:order_id => @order_entry.order_id, :order_entry_id => @order_entry.id, :description => "has changed to #{@order_entry.get_status}", :user_id => current_user.id)
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

  def history
    @order_histories = OrderHistory.where(:order_entry_id => params[:id])
    render :layout => false
  end

end
