module Api
  module Simple
    class VendorsController < ApplicationController

      def list
        vendors = Vendor.all
        render json:  vendors.map { |vendor| { id: vendor.id, name: vendor.name } }
      end

    end
  end
end
