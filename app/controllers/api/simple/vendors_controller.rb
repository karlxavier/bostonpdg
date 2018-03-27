module Api
  module Simple
    class VendorsController < ApplicationController

      def list
        vendors = Vendor.all
        render json:  vendors.map { |vendor| { id: vendor.id, name: vendor.name } }
      end

      def show
        vendor = Vendor.find(params[:id])
        render json: vendor
      end

    end
  end
end
