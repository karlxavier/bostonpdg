# == Schema Information
#
# Table name: item_messages
#
#  id              :bigint(8)        not null, primary key
#  body            :text
#  attachment_data :text
#  user_id         :bigint(8)
#  product_id      :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ItemMessage < ApplicationRecord
  belongs_to :user
  # belongs_to :product
  belongs_to :order_entry
end
