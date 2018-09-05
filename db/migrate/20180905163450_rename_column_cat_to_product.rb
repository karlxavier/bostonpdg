class RenameColumnCatToProduct < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :category_id, :category
  end
end
