class CreateOrderHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :order_histories do |t|
      t.integer :order_id
      t.integer :order_entry_id
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
