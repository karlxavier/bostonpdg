class AddTempFieldsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :dynamic_fields, :string
    add_column :products, :specs, :text
    add_column :products, :vendor_quote_prices, :text
    add_column :products, :notes, :text
  end
end
