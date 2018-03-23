module Api
  module Simple
    class StyleAttributesController < ApplicationController

      def list
        styles = StyleAttribute.all
        render json:  styles.map { |style| { id: style.id, name: style.name } }
      end

    end
  end
end
