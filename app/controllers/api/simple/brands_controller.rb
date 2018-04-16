module Api
  module Simple
    class BrandsController < ApplicationController
      before_action :set_brand, only: [:show, :update]

      def list
        brands = Brand.all
        render json: brands.map { |brand| { id: brand.id, name: brand.name, view: brand.name } }
      end

      def show
        render json: @brand
      end

      def index
        brand = Brand.find(params[:id])
        render json: brand
      end

      def create
        @brand = Brand.new(brands_params)
        if @brand.save
          render json: @brand
        else
          render nothing: true, status: :bad_request
        end
      end

      def update
        if @brand.update_attributes(brands_params)
          head :no_content
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end

      protected

      def set_brand
        @brand = Brand.find(params[:id])
      end

      def brands_params
        params[:brand]
      end

    end
  end
end
