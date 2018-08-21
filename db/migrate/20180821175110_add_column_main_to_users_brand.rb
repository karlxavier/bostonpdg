class AddColumnMainToUsersBrand < ActiveRecord::Migration[5.1]
  def change
    add_column :users_brands, :main_contact, :boolean, default: false
  end
end
