# == Schema Information
#
# Table name: customers
#
#  id               :bigint(8)        not null, primary key
#  first_name       :string
#  last_name        :string
#  billing_address  :string
#  shipping_address :string
#  phone            :string
#  brand            :integer
#  admin            :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  email            :string
#  status           :string
#  manage_by        :integer
#  owned_by         :integer
#  po_required      :boolean
#  payment_terms    :text
#  notes            :text
#  website          :string
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
