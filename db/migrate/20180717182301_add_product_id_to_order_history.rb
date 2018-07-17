class AddProductIdToOrderHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :order_histories, :product_id, :integer
  end
end
