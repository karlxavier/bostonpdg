class AddProductsToStyleAttributes < ActiveRecord::Migration[5.1]
  def change
    add_index :style_attributes, :product_id
  end
end
