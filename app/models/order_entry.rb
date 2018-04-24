class OrderEntry < ApplicationRecord
  def product_name
    product = Product.find(self.product_id)
    product.name
  end
end
