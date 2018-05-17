module Api
  module Simple
    class VendorsController < ApplicationController
      before_action :set_vendor, only: [:show, :update]

      def list
        vendors = Vendor.all
        render json:  vendors.map { |vendor| { id: vendor.id, name: vendor.name } }
      end

      def show
        render json: @vendor
      end

      def create
        @vendor = Vendor.new(vendors_params)
        if @vendor.save
          render json: @vendor
        else
          render nothing: true, status: :bad_request
        end
      end

      def update
        if @vendor.update_attributes(vendors_params)
          head :no_content
        else
          render json: { status: 'failed' }, status: :unprocessable_entity
        end
      end

=begin
      def get_vendors_product
        vendors = Vendor.where("id IN (SELECT vendor_id FROM vendors_products WHERE product_id = #{params[:product_id]})")
        render json: vendors
      end
=end

      def get_category_vendors
        vendors = Vendor.where("id IN (SELECT vendor_id FROM vendor_categories WHERE category_id = #{params[:category_id]})")
        render json: vendors
      end

      def get_vendors_products
        products = Products.where("category = #{params[:category_id]} AND IN (SELECT product FROM vendors_products WHERE vendor_id = #{params[:vendor_id]})")
        render json: products
      end

      protected

      def set_vendor
        @vendor = Vendor.find(params[:id])
      end

      def vendors_params
        params[:vendor]
      end

    end
  end
end
