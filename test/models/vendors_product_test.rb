# == Schema Information
#
# Table name: vendors_products
#
#  id         :bigint(8)        not null, primary key
#  vendor_id  :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class VendorsProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
