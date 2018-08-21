# == Schema Information
#
# Table name: order_histories
#
#  id             :bigint(8)        not null, primary key
#  order_id       :integer
#  order_entry_id :integer
#  description    :string
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :integer
#

require 'test_helper'

class OrderHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
