class Admin::VendorReviewsController < ApplicationController
	before_action :set_vendor

	def index
		@reviews = @vendor.vendor_reviews
	end

	def create
		@vendor_review = @vendor.vendor_reviews.new(vendor_params)
		@vendor_review.user = current_user
		@vendor_review.vendor = @vendor
		respond_to do |format|
			if @vendor_review.save

				format.js
			end
		end
	end

	private

		def set_vendor
			@vendor = Vendor.find(params[:vendor_id])
		end

		def vendor_params
			params.require(:vendor_review).permit(:review, :vendor_id, :user_id)
		end

end