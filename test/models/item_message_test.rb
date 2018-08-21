# == Schema Information
#
# Table name: item_messages
#
#  id              :bigint(8)        not null, primary key
#  body            :text
#  attachment_data :text
#  user_id         :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  order_entry_id  :bigint(8)
#

require 'test_helper'

class ItemMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
