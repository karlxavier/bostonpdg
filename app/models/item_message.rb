class ItemMessage < ApplicationRecord
  belongs_to :user
  # belongs_to :product
  belongs_to :order_entry
end
