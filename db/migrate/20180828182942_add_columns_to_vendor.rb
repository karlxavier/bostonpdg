class AddColumnsToVendor < ActiveRecord::Migration[5.1]
  def change
  	add_column :vendors, :brand_id, :integer
  	add_column :vendors, :balance, :decimal, precision: 12, scale: 3
  	add_column :vendors, :balance_total, :decimal, precision: 12, scale: 3
  	add_column :vendors, :bill_from_1, :string
  	add_column :vendors, :bill_from_2, :string
  	add_column :vendors, :bill_from_3, :string
  	add_column :vendors, :bill_from_4, :string
  	add_column :vendors, :bill_from_5, :string
  	add_column :vendors, :phone, :string
  	add_column :vendors, :fax, :string
  end
end
