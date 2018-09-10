# == Schema Information
#
# Table name: order_branches
#
#  id         :bigint(8)        not null, primary key
#  address_id :integer
#  brand_id   :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderBranch < ApplicationRecord
  belongs_to :order
  belongs_to :brand
  belongs_to :hotel

  def state_and_city
    if self.address_id.present?
      address = Address.find(self.address_id)
      address.state + " - " + address.city
    end

  end

  def city
    if self.address_id.present?
      address = Address.find(self.address_id)
      address.city
    end
  end
end
