# == Schema Information
#
# Table name: messages
#
#  id                :bigint(8)        not null, primary key
#  body              :text
#  attachment_data   :text
#  user_id           :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  chatroom_order_id :integer
#

class Message < ApplicationRecord
	extend Textacular
	belongs_to :chatroom_order
  	belongs_to :user

  	include AttachmentUploader[:attachment]

  	validates :body, presence: true, unless: :attachment_data

	scope :unread_count, -> (user_id, chatroom_id, last_read_at){ where('user_id = ? AND chatroom_id = ? AND created_at > ?', user_id, chatroom_id, last_read_at).count }

	def self.search(query:)
		return self.all if query.blank?
		self.basic_search(query)
	end
end
