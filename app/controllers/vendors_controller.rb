class VendorsController < ApplicationController
  require 'csv'

  def import_csv
    Vendor.import(params[:file])
    redirect_to admin_vendors_path
  end
end