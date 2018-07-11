# == Schema Information
#
# Table name: orders
#
#  id               :bigint(8)        not null, primary key
#  created_by       :integer
#  status           :string
#  customer         :integer
#  delivery_address :integer
#  payment_address  :integer
#  total_cost       :decimal(, )
#  total_tax        :decimal(, )
#  total_discount   :decimal(, )
#  margin           :decimal(, )
#  last_updated_by  :integer
#  promise_date     :datetime
#  notes            :string
#  fulfillment_date :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  lead_time        :decimal(, )
#  total_budget     :decimal(, )
#  urgent           :boolean
#  brand_id         :integer
#

class ChatroomOrder < Order
	has_many :order_users, dependent: :destroy, class_name: 'OrderUser', primary_key: 'id', foreign_key: 'order_id'
	has_many :users, through: :order_users
	has_many :messages, dependent: :destroy

	has_many :order_entries, class_name: 'OrderEntry', primary_key: 'id', foreign_key: 'order_id'
	has_many :products, through: :order_entries

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
