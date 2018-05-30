class OrderBranch < ApplicationRecord
  def state_and_city
    address = Address.find(self.address_id)
    address.state + " - " + address.city
  end

  def city
    address = Address.find(self.address_id)
    address.city
  end
end
