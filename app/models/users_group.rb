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

class UsersGroup < ApplicationRecord
  def name
    group = Group.find(self.group_id)
    group.name
  end
end
