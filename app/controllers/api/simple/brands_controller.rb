module Api
  module Simple
    class BrandsController < ApplicationController


      def list
        brands = Brand.all
        render json: brands.map { |brand| { id: brand.id, name: brand.name } }
      end

    end
  end
end
