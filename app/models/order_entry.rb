class OrderEntry < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def product_name
    if self.product_id.present?
      product = Product.find(self.product_id)
      product.name
    end
  end

  def quoted_name
    if self.quoted_by.present?
      user = User.find(self.quoted_by)
      user.first_name + " " + user.last_name
    end
  end

  def vendor_name
    if self.vendor.present?
      vendor = Vendor.find(self.vendor)
      vendor.name
    end
  end

  def category_name
    if self.category_id.present?
      category = Category.find(self.category_id)
      category.name
    end
  end
  def category
    obj = {}
    if self.category_id.present?
      category = Category.find(self.category_id)
      obj = {:id => category.id, :name => category.name, :view => category.name}
    end
    obj
  end
  def product
    obj = {}
    if self.product_id.present?
      product = Product.find(self.product_id)
      obj = {:id => product.id, :name => product.name, :view => product.name}
    end
    obj
  end
  def vendor_obj
    obj = {}
    if self.vendor.present?
      vendor = Vendor.find(self.vendor)
      obj = {:id => vendor.id, :name => vendor.name, :view => vendor.name}
    end
    obj
  end
  def quoted_by_obj
    obj = {}
    if self.quoted_by.present?
      user = User.find(self.quoted_by)
      obj = {:id => user.id, :name => user.full_name, :view => user.full_name}
    end
    obj
  end
end
