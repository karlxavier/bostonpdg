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

    end
  end
end
