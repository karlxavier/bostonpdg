class CreateProductCategoryVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :product_category_vendors do |t|
      t.integer :product_id
      t.integer :category_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end
