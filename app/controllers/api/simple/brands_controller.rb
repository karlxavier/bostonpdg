module Api
  module Simple
    class BrandsController < ApplicationController


      def list
        brands = Brand.all
        render json: brands.map { |brand| { id: brand.id, name: brand.name } }
      end

      def show
        brand = Brand.find(params[:id])
        render json: brand
      end

      def index
        brand = Brand.find(params[:id])
        render json: brand
      end

      def save
        @brand = Brand.new(brands_params)
        if @brand.save
          render json: @brand
        else
          render nothing: true, status: :bad_request
        end
      end

      protected

      def brands_params
        params[:brand]
      end

    end
  end
end
