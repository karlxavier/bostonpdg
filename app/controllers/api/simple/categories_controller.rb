module Api
  module Simple
    class CategoriesController < ApplicationController

      def list
        categories = Category.all
        render json: categories.map { |category| { id: category.id, name: category.name } }
      end

      def show
        category = Category.find(params[:id])
        render json: category
      end

      def save
        @category = Category.new(categories_params)
        if @category.save
          render json: @category
        else
          render nothing: true, status: :bad_request
        end
      end

      protected

      def categories_params
        params[:category]
      end

    end
  end
end
