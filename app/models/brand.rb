# == Schema Information
#
# Table name: brands
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Brand < ApplicationRecord
	has_many :orders
	has_many :hotels
	has_many :users_brands
	has_many :customers
	has_many :order_branches
	# audited

	validates :name, presence: true
	validates :name, uniqueness: true

	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]

  	def should_generate_new_friendly_id?
	  name_changed?
	end
	
end
