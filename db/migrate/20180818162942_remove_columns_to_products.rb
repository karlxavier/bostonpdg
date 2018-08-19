class RemoveColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :dynamic_fields
    remove_column :products, :specs
    remove_column :products, :vendor_quote_prices
    remove_column :products, :notes
  end
end
