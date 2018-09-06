class AddNewColumnProcudtToInventory < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :product_id, :integer
  end
end
