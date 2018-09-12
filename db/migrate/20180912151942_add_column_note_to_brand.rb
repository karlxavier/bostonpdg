class AddColumnNoteToBrand < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :notes, :string
  end
end
