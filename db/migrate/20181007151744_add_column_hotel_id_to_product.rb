class AddColumnHotelIdToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :hotel_id, :integer
  end
end
