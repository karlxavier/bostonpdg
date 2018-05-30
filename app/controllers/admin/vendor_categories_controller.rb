module Admin
  class VendorCategoriesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = VendorCategory.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   VendorCategory.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def create
      VendorCategory.new(:vendor_id => params[:vendor_category][:vendor_id], :category_id =>  params[:vendor_category][:category_id]).save
      vendor = Vendor.find(params[:vendor_category][:vendor_id])
      vendor.update_attributes(:updated_at => DateTime.now)
      redirect_to(admin_vendor_path(vendor))
    end
  end
end
