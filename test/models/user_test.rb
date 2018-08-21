# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles_mask             :integer
#  admin                  :boolean
#  billing_address        :integer
#  shipping_address       :integer
#  first_name             :string
#  last_name              :string
#  brand_id               :bigint(8)
#  group_id               :bigint(8)
#  mobile                 :string
#  notes                  :text
#  active                 :boolean
#  title                  :string
#  phone                  :string
#  customer_id            :integer
#  vendor_id              :integer
#  last_notified          :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
