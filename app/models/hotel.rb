class Hotel < ApplicationRecord
	belongs_to :brand
	belongs_to :address

	validates :name, :brand_id, :email, presence: true
	validates :name, uniqueness: true
end
