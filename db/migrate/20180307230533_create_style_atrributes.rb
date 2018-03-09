class CreateStyleAtrributes < ActiveRecord::Migration[5.1]
  def change
    create_table :style_atrributes do |t|
      t.integer :product_id
      t.string :name
      t.string :value
      t.string :default

      t.timestamps
    end
  end
end
