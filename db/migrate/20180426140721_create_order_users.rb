class CreateOrderUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :order_users do |t|
      t.integer :regional
      t.integer :comms
      t.integer :art
      t.integer :processor
      t.integer :order_id

      t.timestamps
    end
  end
end
