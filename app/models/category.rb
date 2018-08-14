# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent     :integer
#

class Category < ApplicationRecord
	has_many :vendor_categories
	has_many :vendors, through: :vendor_categories
end
