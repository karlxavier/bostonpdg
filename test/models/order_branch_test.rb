# == Schema Information
#
# Table name: order_branches
#
#  id         :bigint(8)        not null, primary key
#  address_id :integer
#  brand_id   :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrderBranchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
