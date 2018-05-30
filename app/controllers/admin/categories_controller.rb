module Admin
  class CategoriesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Category.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Category.find_by!(slug: param)
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
      if params[:category][:vendor_id].present? && !params[:category][:vendor_id].nil?
        category = Category.new(category_params)
        if category.save
          VendorCategory.new(:vendor_id => params[:category][:vendor_id], :category_id => category.id).save
          vendor = Vendor.find(params[:category][:vendor_id])
          vendor.update_attributes(:updated_at => DateTime.now)
          redirect_to(admin_vendor_path(vendor))
        end

      else
        super
      end
    end
    private

    def category_params
      params.require(:category).permit(:name, :parent)
    end
  end
end
