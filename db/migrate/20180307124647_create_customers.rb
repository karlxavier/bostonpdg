class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :billing_address
      t.string :shipping_address
      t.string :phone
      t.integer :brand
      t.boolean :admin

      t.timestamps
    end
  end
end
