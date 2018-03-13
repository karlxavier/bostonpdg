class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :billing_address, :integer
    add_column :users, :shipping_address, :integer
  end
end
