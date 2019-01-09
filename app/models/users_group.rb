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

  has_many :users_group_details
  has_many :users, through: :users_group_details

  validates :description, presence: true, uniqueness: { case_sensitive: false }

  def name
    group = Group.find(self.group_id)
    group.name
  end
end
