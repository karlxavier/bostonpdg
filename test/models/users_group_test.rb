# == Schema Information
#
# Table name: users_groups
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UsersGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
