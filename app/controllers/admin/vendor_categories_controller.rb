class Admin::VendorCategoriesController < ApplicationController

  def create
    @vendor_category = VendorCategory.new(vc_params)

    respond_to do |format|
        if @vendor_category.save

            @vendor = @vendor_category.vendor
            format.js
        end
    end
  end

  def destroy
    @vendor_category = VendorCategory.find(params[:id])
    @vendor = @vendor_category.vendor
    respond_to do |format|
      @vendor_category.destroy

      format.js
    end
  end

  private

    def vc_params
      params.require(:vendor_category).permit(:vendor_id, :category_id)
    end

end
