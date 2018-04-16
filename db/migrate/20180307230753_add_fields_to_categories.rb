class AddFieldsToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :parent, :integer
  end
end
