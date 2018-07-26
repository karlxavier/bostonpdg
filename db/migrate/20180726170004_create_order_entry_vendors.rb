class CreateOrderEntryVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :order_entry_vendors do |t|
      t.integer :order_entry_id
      t.integer :vendor_id
      t.integer :product_id

      t.timestamps
    end
  end
end
