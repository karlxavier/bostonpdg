class UsersGroup < ApplicationRecord
  def name
    group = Group.find(self.group_id)
    group.name
  end
end
