class RemoveFieldsToProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :product_references
  end
end
