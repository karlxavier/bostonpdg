class CreateProductAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :product_accounts do |t|
      t.string :name

      t.timestamps
    end
  end
end
