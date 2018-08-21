class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :brand_id
      t.integer :shipping_address
      t.integer :address_id
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
