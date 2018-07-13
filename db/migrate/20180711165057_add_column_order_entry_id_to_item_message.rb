class AddColumnOrderEntryIdToItemMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :item_messages, :order_entry, foreign_key: true
  end
end
