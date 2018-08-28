class Admin::VendorsController < ApplicationController
    before_action :set_vendor, only: [:show, :edit, :update]

    def index
        @vendors = Vendor.vendors_with_brands
    end

    def show
        @vendors_product = VendorsProduct.new
        @vendor_category = VendorCategory.new
        @vendor_review = VendorReview.new
    end

    def new
        @vendor = Vendor.new
    end

    def create
        @vendor = Vendor.new(vendor_params)

        respond_to do |format|
           if @vendor.save
                format.html { redirect_to admin_vendors_path }
            else
                format.html { render 'new' }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @vendor.update_attributes(vendor_params)
                format.html { redirect_to admin_vendors_path }
            else
                format.html { render 'edit' }
            end
        end
    end

    private

        def vendor_params
            params.require(:vendor).permit(:name, :lead_time, :country_origin, :email, :billing_address,
                                            :brand_id, :balance, :balance_total, :bill_from_1,
                                            :bill_from_2, :bill_from_3, :bill_from_4, :bill_from_5,
                                            :phone, :fax, :active)
        end

        def set_vendor
            @vendor = Vendor.find(params[:id])
        end

end
