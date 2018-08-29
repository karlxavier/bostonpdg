class AddProductIdToOrderEntryAttachments < ActiveRecord::Migration[5.1]
  def change
    add_column :order_entry_attachments, :product_id, :integer
  end
end
