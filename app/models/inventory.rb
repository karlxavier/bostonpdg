# == Schema Information
#
# Table name: inventories
#
#  id         :bigint(8)        not null, primary key
#  loc_id     :integer
#  bin_id     :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  aisle_id   :integer
#  product_id :integer
#

class Inventory < ApplicationRecord

  # def product
  #   Product.find(self.product_id)
  # end

	belongs_to :product

	validates :product_id, presence: true

	def _quantity
    	quantity || 0
  	end

	def total_quantity
		total_quantity_by_orders = OrderEntry.where(:product_id => self.product_id).sum(:quantity)
		if self._quantity > total_quantity_by_orders
			self._quantity - total_quantity_by_orders
		else
			0
		end
	end
end
