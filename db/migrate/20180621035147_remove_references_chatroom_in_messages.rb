class RemoveReferencesChatroomInMessages < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :messages, :chatroom, index: true
  end
end
