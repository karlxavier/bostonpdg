class AddStyleAttributesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :style_attribute, foreign_key: true
  end
end
