class CreateProductAssetAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :product_asset_accounts do |t|
      t.string :name

      t.timestamps
    end
  end
end
