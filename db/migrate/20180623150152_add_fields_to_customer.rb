class AddFieldsToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :name, :string
    add_column :customers, :email, :string
  end
end
