module Api
  module Simple
    class StyleAttributesController <
        before_action :set_style_attribute, only: [:show, :update]

      def list
        styles = StyleAttribute.all
        render json:  styles.map { |style| { id: style.id, name: style.name } }
      end

      def create
        @style_attribute = StyleAttribute.new(style_attributes_params)
        if @style_attribute.save
          render json: @style_attribute
        else
          render nothing: true, status: :bad_request
        end
      end

    def update
      if @style_attribute.update_attributes(style_attributes_params)
        head :no_content
      else
        render json: { status: 'failed' }, status: :unprocessable_entity
      end
    end

      protected

    def set_style_attribute
      @style_attribute = StyleAttribute.find(params[:id])
    end

      def style_attributes_params
        params[:style_attribute]
      end

    end
  end
end
