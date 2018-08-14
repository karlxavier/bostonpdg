# == Schema Information
#
# Table name: vendor_categories
#
#  id          :bigint(8)        not null, primary key
#  vendor_id   :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class VendorCategory < ApplicationRecord
	belongs_to :vendor
	belongs_to :category

	validates :vendor_id, :category_id, presence: true
end
