class ChatroomOrder < Order
	has_many :order_users, dependent: :destroy, class_name: 'OrderUser', primary_key: 'id', foreign_key: 'order_id'
	has_many :users, through: :order_users
	has_many :messages, dependent: :destroy

	scope :chatroom_id_not_nil, -> { includes(:order_users, :messages).order(id: :desc)  }
	scope :order_with_users, -> { joins(:order_users).where("order_users.regional IS NULL OR order_users.comms IS NULL OR order_users.art IS NULL OR order_users.processor IS NULL").ids }

	scope :chatrooms, -> { chatroom_id_not_nil.where("orders.id IN (?)", order_with_users) }

	scope :only_my_chatrooms, -> (user_id) { chatroom_id_not_nil.where("orders.id IN (?)", broadcast_chatrooms(user_id).ids ) }

	scope :broadcast_chatrooms, -> (user_id) { 
		joins(:order_users).where("order_users.regional = ? 
									OR order_users.comms = ? 
									OR order_users.art = ? 
									OR order_users.designer = ? 
									OR order_users.client_contact = ? 
									OR order_users.processor = ? ", 
									user_id,user_id,user_id,user_id,user_id,user_id) 
	}

end