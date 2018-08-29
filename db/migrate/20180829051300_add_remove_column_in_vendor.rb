class AddRemoveColumnInVendor < ActiveRecord::Migration[5.1]
  def change
  	remove_column :vendors, :brand_id
  	add_column :vendors, :company, :string
  end
end
