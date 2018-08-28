class AddColumnsToCustomer < ActiveRecord::Migration[5.1]
  def change
  	add_column :customers, :balance, :decimal
  	add_column :customers, :balance_total, :decimal
  	add_column :customers, :bill_1, :string
  	add_column :customers, :bill_2, :string
  	add_column :customers, :bill_3, :string
  	add_column :customers, :bill_4, :string
  	add_column :customers, :bill_5, :string
  	add_column :customers, :ship_1, :string
  	add_column :customers, :ship_2, :string
  	add_column :customers, :ship_3, :string
  	add_column :customers, :ship_4, :string
  	add_column :customers, :ship_5, :string
  	add_column :customers, :terms, :string
  	add_column :customers, :rep, :string
  	add_column :customers, :sales_tax_code, :string
  	add_column :customers, :tax_item, :string
  	add_column :customers, :active, :boolean, default: true
  end
end
