class Admin::VendorsProductsController < Admin::BaseController

  def create
    @vendors_product = VendorsProduct.new(vp_params)

    respond_to do |format|
        if @vendors_product.save

            @vendor = @vendors_product.vendor
            format.js
        end
    end
  end

  def destroy
    @vendors_product = VendorsProduct.find(params[:id])
    @vendor = @vendors_product.vendor
    respond_to do |format|
      @vendors_product.destroy

      format.js
    end
  end

  private

    def vp_params
      params.require(:vendors_product).permit(:vendor_id, :product_id)
    end

end
