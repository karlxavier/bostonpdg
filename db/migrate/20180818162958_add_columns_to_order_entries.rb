class AddColumnsToOrderEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :order_entries, :dynamic_fields, :string
    add_column :order_entries, :specs, :text
    add_column :order_entries, :vendor_quote_prices, :text
    add_column :order_entries, :notes, :text
  end
end
