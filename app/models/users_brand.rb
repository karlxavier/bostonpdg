# == Schema Information
#
# Table name: users_brands
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  brand_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsersBrand < ApplicationRecord
	belongs_to :brand
	belongs_to :user

	validates :user_id, :brand_id, presence: true

  def name
    brand = Brand.find(self.brand_id)
    brand.name
  end
end
