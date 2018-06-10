class AddFieldsToOrderUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :order_users, :client_contact, :integer
    add_column :order_users, :designer, :integer
  end
end
