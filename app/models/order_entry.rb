class OrderEntry < ApplicationRecord
  def product_name
    if self.product_id.present
      product = Product.find(self.product_id)
      product.name
    end
  end

  def quoted_name
    if self.quoted_by.present
      user = User.find(self.quoted_by)
      user.first_name + " " + user.last_name
    end
  end

  def vendor_name
    if self.vendor.present
      vendor = Vendor.find(self.vendor)
      vendor.name
    end
  end
end
