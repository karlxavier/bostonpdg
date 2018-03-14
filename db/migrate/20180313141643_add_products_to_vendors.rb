class AddProductsToVendors < ActiveRecord::Migration[5.1]
  def change
    add_reference :vendors, :product, foreign_key: true
  end
end
