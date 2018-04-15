class CreateOrderEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :order_entries do |t|
      t.integer :order_id
      t.integer :product_id
      t.decimal :price
      t.decimal :cost
      t.decimal :tax
      t.integer :quoted_by
      t.integer :quantity
      t.integer :vendor

      t.timestamps
    end
  end
end
