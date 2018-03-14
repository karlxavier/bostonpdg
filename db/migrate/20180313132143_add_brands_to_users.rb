class AddBrandsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :brand, foreign_key: true
  end
end
