class AddFieldsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :item_category_id, :integer
    add_column :products, :dynamic_fields, :string
  end
end
