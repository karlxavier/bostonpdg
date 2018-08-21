# == Schema Information
#
# Table name: order_entries
#
#  id                  :bigint(8)        not null, primary key
#  order_id            :integer
#  product_id          :integer
#  price               :decimal(, )
#  cost                :decimal(, )
#  tax                 :decimal(, )
#  quoted_by           :integer
#  quantity            :integer
#  vendor              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#  status              :integer          default(1)
#  dynamic_fields      :string
#  specs               :text
#  vendor_quote_prices :text
#  notes               :text
#

require 'test_helper'

class OrderEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
