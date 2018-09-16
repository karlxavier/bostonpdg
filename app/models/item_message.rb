# == Schema Information
#
# Table name: item_messages
#
#  id              :bigint(8)        not null, primary key
#  body            :text
#  attachment_data :text
#  user_id         :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  order_entry_id  :bigint(8)
#

class ItemMessage < ApplicationRecord
  extend Textacular
  belongs_to :user
  # belongs_to :product
  belongs_to :order_entry

  include AttachmentUploader[:attachment]
  
  def self.search(query:, order_entry_id:)
		return self.where(order_entry_id: order_entry_id) if query.blank?
		self.where(order_entry_id: order_entry_id).basic_search(query)
	end
end
