class AddFieldToStyleAttributes < ActiveRecord::Migration[5.1]
  def change
    add_column :style_attributes, :height, :decimal
    add_column :style_attributes, :width, :decimal
    add_column :style_attributes, :finish, :string
  end
end
