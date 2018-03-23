module Api
  module Simple
    class ProductsController < ApplicationController

      def list
        products = Product.all
        render json:  products.map { |product| { id: product.id, name: product.name } }
      end

    end
  end
end
