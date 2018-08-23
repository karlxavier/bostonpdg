class CreateEmailTemplateOrderEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :email_template_order_entries do |t|
      t.integer :email_template_id
      t.integer :order_entry_id

      t.timestamps
    end
  end
end
