class RenameStyles < ActiveRecord::Migration[5.1]
  def up
    rename_table :style_atrributes, :style_attributes
  end
end
