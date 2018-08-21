# == Schema Information
#
# Table name: products
#
#  id                   :bigint(8)        not null, primary key
#  name                 :string
#  approval_status      :string
#  online_date          :datetime
#  offline_date         :datetime
#  unit                 :string
#  description          :string
#  base_product         :string
#  category             :integer
#  price                :decimal(, )
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  variant_type         :string
#  style                :string
#  variants             :string
#  force_in_stock       :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  vendor_id            :integer
#  style_attribute_id   :bigint(8)
#  item_category_id     :integer
#  image_data           :text
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
