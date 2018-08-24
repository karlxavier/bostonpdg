class VendorReview < ApplicationRecord
	belongs_to :vendor
	belongs_to :user

	validates :review, presence: true
end
