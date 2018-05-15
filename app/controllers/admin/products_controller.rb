module Admin
  class ProductsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Product.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Product.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def new
      super
      if params[:vendor_id].present? && !params[:vendor_id].nil?
        @vendor_id = params[:vendor_id]
      end
    end
    def create
      if params[:product][:vendor_id].present? && !params[:product][:vendor_id].nil?
        product = Product.new(product_params)
        if product.save
          VendorsProduct.new(:vendor_id => params[:product][:vendor_id], :product_id => product.id).save
          vendor = Vendor.find(params[:product][:vendor_id])
          vendor.update_attributes(:updated_at => DateTime.now)
          redirect_to(admin_vendor_path(vendor))

        end

      else
        super
      end
    end
    private

    def product_params
      params.require(:product).permit(:name, :approval_status, :online_date, :offline_date, :unit, :description, :base_product, :category, :price, :variant_type, :style, :force_in_stock, :style_attribute_ids)
    end
  end
end
