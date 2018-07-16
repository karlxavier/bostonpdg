class AddDefaultValueInStatusToOrderEntry < ActiveRecord::Migration[5.1]
  def change
    change_column :order_entries, :status, :integer, :default => 1
  end
end
