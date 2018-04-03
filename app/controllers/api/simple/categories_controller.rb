module Api
  module Simple
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update]

      def list
        categories = Category.all
        render json: categories.map { |category| { id: category.id, name: category.name } }
      end

      def show
        category = Category.find(params[:id])
        render json: category
      end

      def create
        @category = Category.new(categories_params)
        if @category.save
          render json: @category
        else
          render nothing: true, status: :bad_request
        end
      end

      def update
        if @category.update_attributes(categories_params)
          head :no_content
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end

      protected

      def set_category
        @category = Category.find(params[:id])
      end

      def categories_params
        params[:category]
      end

    end
  end
end
