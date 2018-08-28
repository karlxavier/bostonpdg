class CreateOrderEntryAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :order_entry_attachments do |t|
      t.integer :order_entry_id
      t.attachment :attachment_file

      t.timestamps
    end
  end
end
