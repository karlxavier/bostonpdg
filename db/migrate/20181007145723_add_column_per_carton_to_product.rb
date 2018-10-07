class AddColumnPerCartonToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :per_carton, :integer
    add_column :products, :hotel_price, :decimal, precision: 12, scale: 3
    add_column :products, :price_per_carton, :decimal, precision: 12, scale: 3
    add_column :products, :full_value, :decimal, precision: 12, scale: 3
    add_column :products, :vendor_price, :decimal, precision: 12, scale: 3
    add_column :products, :total_cost, :decimal, precision: 12, scale: 3

    add_column :inventories, :cartons, :integer
  end
end
