class AddCategoryIdToOrderEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :order_entries, :category_id, :integer
  end
end
