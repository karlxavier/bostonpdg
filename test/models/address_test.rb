# == Schema Information
#
# Table name: addresses
#
#  id         :bigint(8)        not null, primary key
#  street     :string
#  street_2   :string
#  city       :string
#  state      :string
#  zip        :string
#  country    :string
#  phone      :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
