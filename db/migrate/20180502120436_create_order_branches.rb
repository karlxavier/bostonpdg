class CreateOrderBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :order_branches do |t|
      t.integer :address_id
      t.integer :brand_id
      t.integer :order_id

      t.timestamps
    end
  end
end
