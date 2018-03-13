class AddFieldsToInventory < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :aisle_id, :integer
  end
end
