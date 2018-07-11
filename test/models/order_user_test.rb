# == Schema Information
#
# Table name: order_users
#
#  id             :bigint(8)        not null, primary key
#  regional       :integer
#  comms          :integer
#  art            :integer
#  processor      :integer
#  order_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  client_contact :integer
#  designer       :integer
#

require 'test_helper'

class OrderUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
