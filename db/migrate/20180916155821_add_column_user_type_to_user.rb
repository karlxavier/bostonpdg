class AddColumnUserTypeToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :regional_director, :boolean, default: true
  	add_column :users, :client_contacts, :boolean, default: true
  	add_column :users, :communications, :boolean, default: true
  	add_column :users, :art_director, :boolean, default: true
  	add_column :users, :designers, :boolean, default: true
  	add_column :users, :processor, :boolean, default: true
  end
end
