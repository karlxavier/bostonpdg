class Admin::StyleAttributesController < Admin::BaseController
    before_action :set_style_attribute, only: [:edit, :update]

    def index
        @style_attributes = StyleAttribute.all
    end

    def new
        @style_attribute = StyleAttribute.new
    end

    def create
        @style_attribute = StyleAttribute.new(style_attribute_params)

        respond_to do |format|
           if @style_attribute.save
                format.html { redirect_to admin_style_attributes_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @style_attribute.update_attributes(style_attribute_params)
                format.html { redirect_to admin_style_attributes_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    private

        def style_attribute_params
            params.require(:style_attribute).permit(:product_id, :name, :value, :default, :height, :width, :finish)
        end

        def set_style_attribute
            @style_attribute = StyleAttribute.find(params[:id])
        end
end
