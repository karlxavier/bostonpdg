class RemoveColumnProductIdToItemMessage < ActiveRecord::Migration[5.1]
  def change
  	remove_column :item_messages, :product_id
  end
end
