class AddReferencesToUsers < ActiveRecord::Migration[5.1]
  def up
    add_foreign_key :users, :addresses, column: :billing_address, primary_key: "id"
    add_foreign_key :users, :addresses, column: :shipping_address, primary_key: "id"
  end
end
