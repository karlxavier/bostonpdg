module ApplicationHelper
  def get_vendor_link id
    vendor = Vendor.find(id)
    link_to vendor.name, admin_vendor_path(vendor)
  end

  def get_product_link id
    product = Product.find(id)
    link_to product.name, admin_product_path(vendor)
  end

  def get_user_link id
    user = User.find(id)
    link_to user.first_name + ' ' + user.last_name, admin_user_path(vendor)
  end
end
