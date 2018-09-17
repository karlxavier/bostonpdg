class Admin::BrandsController < ApplicationController
    before_action :set_brand, only: [:edit, :update, :show, :destroy]

    def index
        @brands = Brand.all
    end

    def new
        @brand = Brand.new
    end

    def create
        @brand = Brand.new(brand_params)

        respond_to do |format|
           if @brand.save
                format.html { redirect_to admin_brands_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
    end

    def show
        @users_brand = UsersBrand.new
    end

    def update
        respond_to do |format|
            if @brand.update_attributes(brand_params)
                format.html { redirect_to admin_brands_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    def destroy
        @brands = Brand.all
        if @brand.destroy
            flash.now[:notice] = "Brand #{@brand.name} successfully deleted."
        else
            flash.now[:error] = "Cannot delete this brand, associations still exist."
        end
        render action: :index
    end

    private

        def brand_params
            params.require(:brand).permit(:name, :notes)
        end

        def set_brand
            @brand = Brand.friendly.find(params[:id])
        end

end
