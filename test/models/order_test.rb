# == Schema Information
#
# Table name: orders
#
#  id               :bigint(8)        not null, primary key
#  created_by       :integer
#  status           :string
#  customer         :integer
#  delivery_address :integer
#  payment_address  :integer
#  total_cost       :decimal(, )
#  total_tax        :decimal(, )
#  total_discount   :decimal(, )
#  margin           :decimal(, )
#  last_updated_by  :integer
#  promise_date     :datetime
#  notes            :string
#  fulfillment_date :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  lead_time        :decimal(, )
#  total_budget     :decimal(, )
#  urgent           :boolean
#  brand_id         :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
