class AddDefaultValueInStatus2ToOrderEntry < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_entries, :status
    add_column :order_entries, :status, :integer, :default => 1
  end
end
