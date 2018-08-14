class RenameColumnCustomerInOrder < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :customer, :customer_id
  end
end
