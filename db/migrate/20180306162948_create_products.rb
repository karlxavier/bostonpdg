class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :approval_status
      t.timestamp :online_date
      t.timestamp :offline_date
      t.string :unit
      t.string :description
      t.string :base_product
      t.integer :category
      t.string :product_references
      t.decimal :price
      t.attachment :picture
      t.string :variant_type
      t.string :style
      t.string :variants
      t.boolean :force_in_stock

      t.timestamps
    end
  end
end
