module Api
  module Simple
    class CategoriesController < ApplicationController

      def list
        categories = Category.all
        render json: categories.map { |category| { id: category.id, name: category.name } }
      end

    end
  end
end
