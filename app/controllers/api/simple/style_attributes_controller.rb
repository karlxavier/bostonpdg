module Api
  module Simple
    class StyleAttributesController < ApplicationController

      def list
        styles = StyleAttribute.all
        render json:  styles.map { |style| { id: style.id, name: style.name } }
      end

      def save
        @style_attribute = StyleAttribute.new(style_attributes_params)
        if @style_attribute.save
          render json: @style_attribute
        else
          render nothing: true, status: :bad_request
        end
      end

      protected

      def style_attributes_params
        params[:style_attribute]
      end

    end
  end
end
