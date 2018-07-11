# == Schema Information
#
# Table name: product_category_vendors
#
#  id          :bigint(8)        not null, primary key
#  product_id  :integer
#  category_id :integer
#  vendor_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductCategoryVendor < ApplicationRecord
end
