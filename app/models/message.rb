class Message < ApplicationRecord
	belongs_to :chatroom_order
  	belongs_to :user

  	include AttachmentUploader[:attachment]

  	validates :body, presence: true, unless: :attachment_data

	scope :unread_count, -> (user_id, chatroom_id, last_read_at){ where('user_id = ? AND chatroom_id = ? AND created_at > ?', user_id, chatroom_id, last_read_at).count }

end
