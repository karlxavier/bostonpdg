class CreateVendorsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors_products do |t|
      t.integer :vendor_id
      t.integer :product_id

      t.timestamps
    end
  end
end
