# == Schema Information
#
# Table name: inventories
#
#  id         :bigint(8)        not null, primary key
#  loc_id     :integer
#  bin_id     :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  aisle_id   :integer
#  product_id :integer
#

require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
