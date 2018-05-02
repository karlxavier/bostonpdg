class OrderEntry < ApplicationRecord
  def product_name
    product = Product.find(self.product_id)
    product.name
  end

  def quoted_name
    user = User.find(self.quoted_by)
    user.first_name + " " + user.last_name
  end

  def vendor_name
    vendor = Vendor.find(self.vendor)
    vendor.name
  end
end
