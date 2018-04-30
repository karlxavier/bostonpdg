class UsersBrand < ApplicationRecord
  def name
    brand = Brand.find(self.brand_id)
    brand.name
  end
end
