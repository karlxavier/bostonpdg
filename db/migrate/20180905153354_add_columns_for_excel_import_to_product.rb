class AddColumnsForExcelImportToProduct < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :cost, :decimal, precision: 12, scale: 3
  	add_column :products, :active, :boolean, default: true
  	add_column :products, :product_type_id, :integer
  	add_column :products, :sales_tax, :boolean, default: true
  	add_column :products, :product_account_id, :integer
  	add_column :products, :product_cog_id, :string
  	add_column :products, :product_asset_account_id, :string
  	add_column :products, :depreciation, :decimal, precision: 12, scale: 3
  	add_column :products, :purchase_description, :string
  	add_column :products, :purchase_price, :decimal, precision: 12, scale: 3

  	rename_column :products, :category, :category_id
  end
end
