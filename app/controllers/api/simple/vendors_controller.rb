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

      def save
        @vendor = Vendor.new(vendors_params)
        if @vendor.save
          render json: @vendor
        else
          render nothing: true, status: :bad_request
        end
      end

      protected

      def vendors_params
        params[:vendor]
      end

    end
  end
end
