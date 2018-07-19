# == Schema Information
#
# Table name: vendors
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  lead_time       :integer
#  country_origin  :string
#  product_id      :bigint(8)
#  email           :string
#  billing_address :integer
#

require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
