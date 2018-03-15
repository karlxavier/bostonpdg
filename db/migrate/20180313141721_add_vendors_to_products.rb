class AddVendorsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :vendor_id, :integer
    add_index :products, :vendor_id
  end
end
