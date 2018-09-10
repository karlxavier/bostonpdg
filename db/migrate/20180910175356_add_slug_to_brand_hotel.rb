class AddSlugToBrandHotel < ActiveRecord::Migration[5.1]
  def change
  	add_column :brands, :slug, :string
  	add_column :hotels, :slug, :string
  end
end
