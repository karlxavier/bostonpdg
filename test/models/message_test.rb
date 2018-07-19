# == Schema Information
#
# Table name: messages
#
#  id                :bigint(8)        not null, primary key
#  body              :text
#  attachment_data   :text
#  user_id           :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  chatroom_order_id :integer
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
