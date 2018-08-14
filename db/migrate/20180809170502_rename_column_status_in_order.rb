class RenameColumnStatusInOrder < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :status, :order_status_id
  end
end
