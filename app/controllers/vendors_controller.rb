class VendorsController < ApplicationController
  require 'csv'

  def import_csv
    Vendor.import(params[:file])
    redirect_to admin_vendors_path
  end

  def create
    @vendor = Vendor.new
    @vendor.name = params[:name]
    @vendor.email = params[:email]
    @vendor.billing_address = params[:address]
    @vendor.country_origin = params[:country]
    if @vendor.save
      if params[:category_id].present?
        params[:category_id].each do |id|
          VendorCategory.create(:vendor_id => @vendor.id, :category_id => id)
        end
      end
      flash[:notice] = "Vendor has saved successfully."
    else
      flash[:error] = "Vendor save Failed!"
    end
    redirect_to inventories_path
  end

  def new

  end

  def list

  end

  def add_item

  end

  def supplier

  end

  def products
    @product = Product.where(:vendor_id => params[:id])
    render :layout => false
  end
end
