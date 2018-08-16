class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.order(id: :desc)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    respond_to do |format|
        
        @product.audit_comment = "Updated product #{@product.id}-#{params[:name]}"

        if @product.update_attributes(product_params)
            format.html { redirect_to admin_products_path }
        else
            format.html { render 'edit' }
        end
    end
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
       if @product.save
            format.html { redirect_to admin_products_path }
        else
            format.html { render 'new' }
        end
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :approval_status, :online_date, :offline_date, 
                                      :unit, :description, :base_product, :category, :price, 
                                      :variant_type, :style, :force_in_stock, :style_attribute_ids,
                                      :image)
    end

    def set_product
      @product = Product.find(params[:id])
    end

end
