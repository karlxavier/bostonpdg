# == Schema Information
#
# Table name: order_entry_vendors
#
#  id             :bigint(8)        not null, primary key
#  order_entry_id :integer
#  vendor_id      :integer
#  product_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class OrderEntryVendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
