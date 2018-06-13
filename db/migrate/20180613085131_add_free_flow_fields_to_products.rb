class AddFreeFlowFieldsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :specs, :text
    add_column :products, :vendor_quote_prices, :text
    add_column :products, :notes, :text
  end
end
