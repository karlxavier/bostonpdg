# == Schema Information
#
# Table name: vendors_products
#
#  id         :bigint(8)        not null, primary key
#  vendor_id  :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VendorsProduct < ApplicationRecord
	belongs_to :product
	belongs_to :vendor

	validates :product_id, :vendor_id, presence: true
end
