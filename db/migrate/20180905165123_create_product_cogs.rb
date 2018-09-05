class CreateProductCogs < ActiveRecord::Migration[5.1]
  def change
    create_table :product_cogs do |t|
      t.string :name

      t.timestamps
    end
  end
end
