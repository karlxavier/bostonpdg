class OrderBranch < ApplicationRecord
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
