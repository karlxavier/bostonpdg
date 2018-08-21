class AddColumnTelephonToHotel < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :contact_number, :string
  end
end
