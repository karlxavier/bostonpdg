class AddMoreFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mobile, :string
    add_column :users, :notes, :text
  end
end
