class AddBrandIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :brand_id, :integer
  end
end
