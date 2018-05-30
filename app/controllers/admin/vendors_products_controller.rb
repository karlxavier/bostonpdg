module Admin
  class VendorsProductsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = VendorsProduct.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   VendorsProduct.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def create
      VendorsProduct.new(:vendor_id => params[:vendors_product][:vendor_id], :product_id => params[:vendors_product][:product_id]).save
      vendor = Vendor.find(params[:vendors_product][:vendor_id])
      vendor.update_attributes(:updated_at => DateTime.now)
      redirect_to(admin_vendor_path(vendor))
    end
  end
end
