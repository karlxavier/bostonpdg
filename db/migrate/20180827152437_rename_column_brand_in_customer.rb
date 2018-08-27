class RenameColumnBrandInCustomer < ActiveRecord::Migration[5.1]
  def change
  	rename_column :customers, :brand, :brand_id
  end
end
